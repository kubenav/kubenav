import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonContent,
  IonGrid,
  IonHeader,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonRow,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import yaml from 'js-yaml';
import React, { memo, useContext } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import Editor from '../../misc/Editor';
import LoadingErrorCard from '../../misc/LoadingErrorCard';
import Configuration from '../../resources/misc/template/Configuration';
import Row from '../../resources/misc/template/Row';
import Status from '../../resources/misc/template/Status';
import Details from './Details';
import History from './History';
import { IHelmRelease, getDetails } from './helpers';

interface IMatchParams {
  namespace: string;
  name: string;
}

type IReleasePageProps = RouteComponentProps<IMatchParams>;

const ReleasePage: React.FunctionComponent<IReleasePageProps> = ({ match }: IReleasePageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { isError, isFetching, data, error, refetch } = useQuery<IHelmRelease, Error>(
    ['HelmReleasePage', cluster ? cluster.id : '', match.params.namespace, match.params.name],
    async () => {
      try {
        const secret = await kubernetesRequest(
          'GET',
          `/api/v1/namespaces/${match.params.namespace}/secrets/${match.params.name}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const d = new Date(parseInt(secret.metadata.labels.modifiedAt) * 1000);
        return {
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
      } catch (err) {
        throw err;
      }
    },
    { ...context.settings.queryConfig, refetchInterval: context.settings.queryRefetchInterval },
  );

  // The doRefresh method is used for a manual reload of the items for the corresponding resource. The
  // event.detail.complete() call is required to finish the animation of the IonRefresher component.
  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    refetch();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton defaultHref="/plugins/helm" />
          </IonButtons>
          <IonTitle>{data ? data.name : ''}</IonTitle>
          <IonButtons slot="primary">
            <Details refresh={refetch} />
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!isError && cluster && data ? (
          <IonGrid>
            <IonRow>
              <Configuration>
                <Row obj={data} objKey="namespace" title="Namespace" />
                {data.details ? (
                  <IonRow>
                    <IonCol size="auto">
                      <b>Chart:</b>
                    </IonCol>
                    <IonCol>
                      {data.details.chart.metadata.name}-{data.details.chart.metadata.version}
                    </IonCol>
                  </IonRow>
                ) : null}
                <Row obj={data} objKey="details.chart.metadata.appVersion" title="App Version" />
              </Configuration>
              <Status>
                <Row obj={data} objKey="revision" title="Revision" />
                <Row obj={data} objKey="updated" title="Updated" />
                <Row obj={data} objKey="status" title="Status" />
                <Row obj={data} objKey="details.info.description" title="Description" />
              </Status>
            </IonRow>

            <History name={data.name} namespace={data.namespace} helmRelease={data} />

            {data.details && (data.details.config || data.details.chart.values) ? (
              <IonRow>
                <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Values</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <Editor
                        value={yaml.dump(
                          data.details.config
                            ? data.details.config
                            : data.details.chart.values
                            ? data.details.chart.values
                            : '',
                        )}
                        readOnly={true}
                      />
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ) : null}
          </IonGrid>
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error}
            icon="/assets/icons/kubernetes/helm.png"
            text="Could not get Helm Release"
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(ReleasePage, (prevProps, nextProps): boolean => {
  if (prevProps.match.url !== nextProps.match.url) {
    return false;
  }

  return true;
});
