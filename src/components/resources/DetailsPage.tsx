import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButtons,
  IonContent,
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

import { IContext } from '../../declarations';
import { kubernetesRequest } from '../../utils/api';
import { AppContext } from '../../utils/context';
import { resources } from '../../utils/resources';
import Details from './misc/details/Details';
import LoadingErrorCard from '../misc/LoadingErrorCard';

interface IMatchParams {
  section: string;
  type: string;
  namespace: string;
  name: string;
}

type IDetailsPageProps = RouteComponentProps<IMatchParams>;

const DetailsPage: React.FunctionComponent<IDetailsPageProps> = ({ match }: IDetailsPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const page = resources[match.params.section].pages[match.params.type];
  const Component = page.detailsComponent;

  const { isError, isFetching, data, error, refetch } = useQuery(
    [
      'DetailsPage',
      cluster ? cluster.id : '',
      match.params.section,
      match.params.type,
      match.params.namespace,
      match.params.name,
    ],
    async () =>
      await kubernetesRequest(
        'GET',
        page.detailsURL(match.params.namespace, match.params.name),
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    { refetchInterval: context.settings.queryRefetchInterval },
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
            <IonBackButton defaultHref={`/resources/${match.params.section}/${match.params.type}`} />
          </IonButtons>
          <IonTitle>{data && data.metadata ? data.metadata.name : ''}</IonTitle>
          <IonButtons slot="primary">
            {data ? (
              <Details
                refresh={refetch}
                type={match.params.type}
                item={data}
                url={page.detailsURL(
                  data.metadata ? data.metadata.namespace : '',
                  data.metadata ? data.metadata.name : '',
                )}
                bookmark={{
                  title: `${page.singleText}${data.metadata ? `: ${data.metadata.name}` : ''}`,
                  url: match.url,
                  namespace: data.metadata ? data.metadata.namespace : '',
                }}
              />
            ) : null}
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!isError && cluster && data ? (
          <Component item={data} section={match.params.section} type={match.params.type} />
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error as Error}
            icon={page.icon}
            text={`Could not get ${page.singleText}`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(DetailsPage, (prevProps, nextProps): boolean => {
  if (prevProps.match.url !== nextProps.match.url) {
    return false;
  }

  return true;
});
