import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonList,
  IonRouterLink,
  IonRow,
  isPlatform,
} from '@ionic/react';
import { V1SecretList } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import useWindowWidth from '../../../utils/useWindowWidth';
import { IHelmRelease, IHelmReleases, getDetails } from './helpers';

interface IHistoryProps {
  name: string;
  namespace: string;
  helmRelease: IHelmRelease;
}

const History: React.FunctionComponent<IHistoryProps> = ({ name, namespace, helmRelease }: IHistoryProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();
  const width = useWindowWidth();

  const { data } = useQuery<IHelmReleases, Error>(
    ['HelmHistory', cluster ? cluster.id : '', namespace, name, helmRelease],
    async () => {
      try {
        const secrets: V1SecretList = await kubernetesRequest(
          'GET',
          `/api/v1/namespaces/${namespace}/secrets?limit=${context.settings.queryLimit}&labelSelector=owner=helm,name=${name}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const helmReleases: IHelmReleases = {};
        for (const secret of secrets.items) {
          if (
            secret.metadata &&
            secret.metadata.name &&
            secret.metadata.namespace &&
            secret.metadata.labels &&
            secret.data
          ) {
            const d = new Date(parseInt(secret.metadata.labels.modifiedAt) * 1000);
            const helmRelease = {
              name: secret.metadata.labels.name,
              namespace: secret.metadata.namespace,
              revision: parseInt(secret.metadata.labels.version),
              updated: `${d.getFullYear()}-${('0' + (d.getMonth() + 1)).slice(-2)}-${('0' + d.getDate()).slice(-2)} ${(
                '0' + d.getHours()
              ).slice(-2)}:${('0' + d.getMinutes()).slice(-2)}:${('0' + d.getSeconds()).slice(-2)}`,
              status: secret.metadata.labels.status,
              details: getDetails(secret.data['release']),
              secretName: secret.metadata.name,
            };

            helmReleases[`${helmRelease.secretName}-${helmRelease.namespace}`] = helmRelease;
          }
        }

        return helmReleases;
      } catch (err) {
        throw err;
      }
    },
    {
      ...context.settings.queryConfig,
      refetchInterval: context.settings.queryRefetchInterval,
    },
  );

  if (data && Object.keys(data).length > 0) {
    return (
      <IonRow>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>History</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              {isPlatform('hybrid') || isPlatform('mobile') || width < 992 ? (
                <IonList>
                  {data
                    ? Object.keys(data).map((key, index) => (
                        <IonItem
                          key={index}
                          routerLink={
                            helmRelease.revision === data[key].revision
                              ? undefined
                              : `/plugins/helm/${data[key].namespace}/${data[key].secretName}`
                          }
                          routerDirection="forward"
                        >
                          <IonLabel>
                            <p>
                              Revision: {data[key].revision}
                              <br />
                              Updated: {data[key].updated}
                              <br />
                              Status: {data[key].status}
                              <br />
                              Chart: {data[key].details?.chart.metadata.name}-
                              {data[key].details?.chart.metadata.version}
                              <br />
                              App Version: {data[key].details?.chart.metadata.appVersion}
                              <br />
                              Description: {data[key].details?.info.description}
                            </p>
                          </IonLabel>
                        </IonItem>
                      ))
                    : null}
                </IonList>
              ) : (
                <div className="table">
                  <table>
                    <thead>
                      <tr>
                        <th>Revision</th>
                        <th>Updated</th>
                        <th>Status</th>
                        <th>Chart</th>
                        <th>App Version</th>
                        <th>Description</th>
                      </tr>
                    </thead>
                    <tbody>
                      {data
                        ? Object.keys(data).map((key, index) => (
                            <tr key={index}>
                              <td>
                                <IonRouterLink
                                  routerLink={
                                    helmRelease.revision === data[key].revision
                                      ? undefined
                                      : `/plugins/helm/${data[key].namespace}/${data[key].secretName}`
                                  }
                                  routerDirection="forward"
                                >
                                  {data[key].revision}
                                </IonRouterLink>
                              </td>
                              <td>{data[key].updated}</td>
                              <td>{data[key].status}</td>
                              <td>
                                {data[key].details?.chart.metadata.name}-{data[key].details?.chart.metadata.version}
                              </td>
                              <td>{data[key].details?.chart.metadata.appVersion}</td>
                              <td>{data[key].details?.info.description}</td>
                            </tr>
                          ))
                        : null}
                    </tbody>
                  </table>
                </div>
              )}
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>
    );
  } else {
    return <React.Fragment />;
  }
};

export default History;
