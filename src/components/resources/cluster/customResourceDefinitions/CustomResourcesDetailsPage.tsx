import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonGrid,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonRow,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import LoadingErrorCard from '../../../misc/LoadingErrorCard';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import List from '../../misc/list/List';
import Details from '../../misc/details/Details';
import Conditions from '../../misc/template/Conditions';
import Metadata from '../../misc/template/Metadata';

interface IMatchParams {
  group: string;
  version: string;
  name: string;
  crnamespace: string;
  crname: string;
}

type ICustomResourcesDetailsPageProps = RouteComponentProps<IMatchParams>;

const getURL = (namespace: string, group: string, version: string, name: string, crname: string): string => {
  return namespace && namespace !== 'undefined'
    ? `/apis/${group}/${version}/namespaces/${namespace}/${name}/${crname}`
    : `/apis/${group}/${version}/${name}/${crname}`;
};

const CustomResourcesDetailsPage: React.FunctionComponent<ICustomResourcesDetailsPageProps> = ({
  match,
}: ICustomResourcesDetailsPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { isError, isFetching, data, error, refetch } = useQuery(
    [
      'CustomResourcesDetailsPage',
      cluster ? cluster.id : '',
      match.params.crnamespace,
      match.params.group,
      match.params.version,
      match.params.name,
      match.params.crname,
    ],
    async () =>
      await kubernetesRequest(
        'GET',
        getURL(
          match.params.crnamespace,
          match.params.group,
          match.params.version,
          match.params.name,
          match.params.crname,
        ),
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
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
            <IonBackButton
              defaultHref={`/customresources/${match.params.group}/${match.params.group}/${match.params.name}`}
            />
          </IonButtons>
          <IonTitle>{match.params.crname}</IonTitle>
          <IonButtons slot="primary">
            {data ? (
              <Details
                refresh={refetch}
                type="customresources"
                item={data}
                url={getURL(
                  match.params.crnamespace,
                  match.params.group,
                  match.params.version,
                  match.params.name,
                  match.params.crname,
                )}
                bookmark={{ title: match.params.crname, url: match.url, namespace: '' }}
              />
            ) : null}
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!isError && cluster && data ? (
          <IonGrid>
            {data.metadata ? <Metadata metadata={data.metadata} type="customresource" /> : null}

            {data.status && data.status.conditions ? (
              <IonRow>
                <Conditions conditions={data.status.conditions} />
              </IonRow>
            ) : null}

            {data.metadata && data.metadata.name && data.metadata.namespace ? (
              <IonRow>
                <List
                  name="Events"
                  section="cluster"
                  type="events"
                  namespace={data.metadata.namespace}
                  parent={data}
                  selector={`fieldSelector=involvedObject.name=${data.metadata.name}`}
                />
              </IonRow>
            ) : null}

            {context.settings.prometheusEnabled ? <DashboardList item={data} /> : null}
            {context.settings.elasticsearchEnabled ? <QueryList item={data} /> : null}
            {context.settings.jaegerEnabled ? <TraceList item={data} /> : null}
          </IonGrid>
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error}
            icon="/assets/icons/kubernetes/crd.png"
            text={`Could not get Custom Resource "${match.params.crname}"`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(CustomResourcesDetailsPage, (prevProps, nextProps): boolean => {
  if (prevProps.match.url !== nextProps.match.url) {
    return false;
  }

  return true;
});
