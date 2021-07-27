import { RefresherEventDetail } from '@ionic/core';
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonInfiniteScroll,
  IonInfiniteScrollContent,
  IonItem,
  IonLabel,
  IonList,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonSearchbar,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { V1ConfigMap } from '@kubernetes/client-node';
import React, { memo, useContext, useState } from 'react';
import { useInfiniteQuery } from 'react-query';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import LoadingErrorCard from '../../misc/LoadingErrorCard';
import Details from './Details';

const DashboardsPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const [searchText, setSearchText] = useState<string>('');

  const fetchItems = async (cursor) =>
    await kubernetesRequest(
      'GET',
      `${
        context.settings.prometheusDashboardsNamespace
          ? `/api/v1/namespaces/${context.settings.prometheusDashboardsNamespace}/configmaps`
          : `/api/v1/configmaps`
      }?labelSelector=kubenav.io/prometheus-dashboard=true&limit=50${
        cursor.pageParam ? `&continue=${cursor.pageParam}` : ''
      }`,
      '',
      context.settings,
      await context.kubernetesAuthWrapper(''),
    );

  const { isError, isFetching, isFetchingNextPage, hasNextPage, data, error, fetchNextPage, refetch } =
    useInfiniteQuery(
      `PrometheusDashboardsPage_${cluster ? cluster.id : ''}_${cluster ? cluster.namespace : ''}`,
      fetchItems,
      {
        ...context.settings.queryConfig,
        refetchInterval: context.settings.queryRefetchInterval,
        getNextPageParam: (lastGroup) =>
          lastGroup.metadata && lastGroup.metadata.continue ? lastGroup.metadata.continue : false,
      },
    );

  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    refetch();
  };

  const loadMore = async (event: CustomEvent<void>) => {
    await fetchNextPage();
    (event.target as HTMLIonInfiniteScrollElement).complete();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Prometheus</IonTitle>
          <IonButtons slot="primary">
            <Details refresh={refetch} />
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!isError && cluster ? (
          <React.Fragment>
            <IonSearchbar
              inputmode="search"
              value={searchText}
              onIonChange={(e) => setSearchText(e.detail.value ? e.detail.value : '')}
            />
            {data && data.pages && data.pages.length > 0 && data[0].items.length > 0 ? (
              <IonList>
                {data.pages.map((group, i) => (
                  <React.Fragment key={i}>
                    {group && group.items
                      ? group.items
                          .filter((item) => {
                            const regex = new RegExp(searchText, 'gi');
                            return item.metadata && item.metadata.name && item.metadata.name.match(regex);
                          })
                          .map((item: V1ConfigMap, j) => {
                            return (
                              <IonItem
                                key={`${i}_${j}`}
                                routerLink={`/plugins/prometheus/${item.metadata ? item.metadata.namespace : ''}/${
                                  item.metadata ? item.metadata.name : ''
                                }`}
                                routerDirection="forward"
                              >
                                <IonLabel>
                                  <h2>{item.data && item.data['title'] ? item.data['title'] : ''}</h2>
                                  <p>{item.data && item.data['description'] ? item.data['description'] : ''}</p>
                                </IonLabel>
                              </IonItem>
                            );
                          })
                      : null}
                  </React.Fragment>
                ))}
                <IonInfiniteScroll
                  threshold="25%"
                  disabled={!hasNextPage || (isFetchingNextPage as boolean)}
                  onIonInfinite={loadMore}
                >
                  {(!isFetchingNextPage as boolean) ? (
                    <IonButton size="small" expand="block" fill="clear" onClick={() => fetchNextPage()}>
                      Load more
                    </IonButton>
                  ) : null}
                  <IonInfiniteScrollContent
                    loadingText={`Loading more Prometheus Dashboards...`}
                  ></IonInfiniteScrollContent>
                </IonInfiniteScroll>
              </IonList>
            ) : null}
          </React.Fragment>
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error as Error}
            icon="/assets/icons/kubernetes/prometheus.png"
            text="Could not get Prometheus Dashboards"
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(DashboardsPage, (): boolean => {
  return true;
});
