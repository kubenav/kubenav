import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import { V1ConfigMap } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import { getProperty } from '../../../utils/helpers';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const getLink = (item: any, link: string): string => {
  if (link) {
    const linkParts: string[] = [];

    for (const parameter of link.split('&')) {
      const parts = parameter.split('=');
      if (parts.length !== 2 || parts[1].length < 2) {
        return '';
      }

      linkParts.push(`${parts[0]}=${getProperty(item, parts[1].substring(2))}`);
    }

    return `?${linkParts.join('&')}`;
  }

  return '';
};

interface IDashboardListProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const DashboardList: React.FunctionComponent<IDashboardListProps> = ({ item }: IDashboardListProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { isError, data, error } = useQuery<V1ConfigMap[], Error>(
    ['PrometheusDashboardList', cluster ? cluster.id : '', item],
    async () => {
      try {
        if (item && item.metadata && item.metadata.annotations && item.metadata.annotations['kubenav.io/dashboards']) {
          const dashboards = item.metadata.annotations['kubenav.io/dashboards'].split(',');
          const cms: V1ConfigMap[] = [];

          for (const dashboard of dashboards) {
            const cm = await kubernetesRequest(
              'GET',
              `/api/v1/namespaces/${context.settings.prometheusDashboardsNamespace}/configmaps/${dashboard}`,
              '',
              context.settings,
              await context.kubernetesAuthWrapper(''),
            );

            cms.push(cm);
          }

          return cms;
        }

        return [];
      } catch (err) {
        throw err;
      }
    },
    { ...context.settings.queryConfig, refetchInterval: context.settings.queryRefetchInterval },
  );

  if ((data && data.length > 0) || isError) {
    return (
      <IonRow>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="12">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Dashboards</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              {isError ? (
                `Could not load dashboards: ${error}`
              ) : (
                <IonList>
                  {data
                    ? data.map((cm: V1ConfigMap, index) => {
                        return (
                          <IonItem
                            key={index}
                            routerLink={`/plugins/prometheus/${cm.metadata ? cm.metadata.namespace : ''}/${
                              cm.metadata ? cm.metadata.name : ''
                            }${getLink(item, cm.data && cm.data['link'] ? cm.data['link'] : '')}`}
                            routerDirection="forward"
                          >
                            <IonLabel>
                              <h2>{cm.data && cm.data['title'] ? cm.data['title'] : ''}</h2>
                              <p>{cm.data && cm.data['description'] ? cm.data['description'] : ''}</p>
                            </IonLabel>
                          </IonItem>
                        );
                      })
                    : null}
                </IonList>
              )}
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>
    );
  } else {
    return null;
  }
};

export default DashboardList;
