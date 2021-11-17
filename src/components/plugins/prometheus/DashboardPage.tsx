import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonGrid,
  IonHeader,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import LoadingErrorCard from '../../misc/LoadingErrorCard';
import Dashboard, { IDashboardProps, IVariable } from './Dashboard';
import Details from './Details';

interface IMatchParams {
  namespace: string;
  name: string;
}

type IDashboardPageProps = RouteComponentProps<IMatchParams>;

const DashboardPage: React.FunctionComponent<IDashboardPageProps> = ({ match, location }: IDashboardPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { isError, isFetching, data, error, refetch } = useQuery<IDashboardProps, Error>(
    ['PrometheusDashboardPage', cluster ? cluster.id : '', match.params.namespace, match.params.name, location.search],
    async () => {
      try {
        const cm = await kubernetesRequest(
          'GET',
          `/api/v1/namespaces/${match.params.namespace}/configmaps/${match.params.name}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const url = new URLSearchParams(location.search);
        const variables: IVariable[] = [];
        if (cm && cm.data && cm.data['variables']) {
          for (const variable of JSON.parse(cm.data['variables']) as IVariable[]) {
            const value = url.get(variable.name);
            if (value) {
              variable.value = value;
            }
            variables.push(variable);
          }
        }

        return {
          title: cm && cm.data && cm.data['title'] ? cm.data['title'] : '',
          variables: variables.length === 0 ? undefined : variables,
          charts: cm && cm.data && cm.data['charts'] ? JSON.parse(cm.data['charts']) : undefined,
        };
      } catch (err) {
        throw err;
      }
    },
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
            <IonBackButton defaultHref="/plugins/prometheus" />
          </IonButtons>
          <IonTitle>{data ? data.title : ''}</IonTitle>
          <IonButtons slot="primary">
            <Details refresh={refetch} />
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!isError && cluster && data ? (
          <IonGrid>{data.charts ? <Dashboard variables={data.variables} charts={data.charts} /> : null}</IonGrid>
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error as Error}
            icon="/assets/icons/kubernetes/prometheus.png"
            text="Could not get Prometheus Dashboard"
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(DashboardPage, (): boolean => {
  return true;
});
