import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonInfiniteScroll,
  IonInfiniteScrollContent,
  IonItemDivider,
  IonItemGroup,
  IonLabel,
  IonList,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonSearchbar,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext, useState } from 'react';
import { useInfiniteQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import Details from '../../misc/list/Details';
import Namespaces from '../../misc/list/Namespaces';
import LoadingErrorCard from '../../../misc/LoadingErrorCard';
import ItemOptions from '../../misc/details/ItemOptions';
import CustomResourceItem from './CustomResourceItem';

interface IMatchParams {
  group: string;
  version: string;
  name: string;
}

type ICustomResourcesListPageProps = RouteComponentProps<IMatchParams>;

const getURL = (namespace: string, group: string, version: string, name: string): string => {
  return namespace ? `/apis/${group}/${version}/namespaces/${namespace}/${name}` : `/apis/${group}/${version}/${name}`;
};

const CustomResourcesListPage: React.FunctionComponent<ICustomResourcesListPageProps> = ({
  location,
  match,
}: ICustomResourcesListPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  // scope can be "Cluster" or "Namespaced", for a cluster scoped CRD we have to set the namespace to "" to retrive all
  // CRs.
  const scope = new URLSearchParams(location.search).get('scope');

  // namespace and showNamespace is used to group all items by namespace and to only show the namespace once via the
  // IonItemDivider component.
  let namespace = '';
  let showNamespace = false;

  // searchText is used to search and filter the list of items.
  const [searchText, setSearchText] = useState<string>('');

  const fetchItems = async (key, cursor) =>
    await kubernetesRequest(
      'GET',
      `${getURL(
        scope === 'Cluster' ? '' : cluster ? cluster.namespace : '',
        match.params.group,
        match.params.version,
        match.params.name,
      )}?limit=50${cursor ? `&continue=${cursor}` : ''}`,
      '',
      context.settings,
      await context.kubernetesAuthWrapper(''),
    );

  const { isError, isFetching, isFetchingMore, canFetchMore, data, error, fetchMore, refetch } = useInfiniteQuery(
    // NOTE: Array keys (https://react-query.tanstack.com/docs/guides/queries#array-keys) do not work with
    // useInfiniteQuery, therefore we are creating a string only query key with the values, which normaly are used as
    // query key.
    // ['CustomResourcesListPage', cluster ? cluster.id : '', cluster ? cluster.namespace : '', match.params.group, match.params.version, match.params.name],
    `CustomResourcesListPage_${cluster ? cluster.id : ''}_${cluster ? cluster.namespace : ''}_${match.params.group}_${
      match.params.version
    }_${match.params.name}`,
    fetchItems,
    {
      ...context.settings.queryConfig,
      refetchInterval: context.settings.queryRefetchInterval,
      getFetchMore: (lastGroup) =>
        lastGroup.metadata && lastGroup.metadata.continue ? lastGroup.metadata.continue : '',
    },
  );

  // The doRefresh method is used for a manual reload of the items for the corresponding resource. The
  // event.detail.complete() call is required to finish the animation of the IonRefresher component.
  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    refetch();
  };

  // allGroups is used to fetch additional items from the Kubernetes API. When the fetchMore funtion is finished we have
  // to call the complete() method on the infinite scroll instance.
  const loadMore = async (event: CustomEvent<void>) => {
    await fetchMore();
    (event.target as HTMLIonInfiniteScrollElement).complete();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton defaultHref={`/resources/cluster/customresourcedefinitions`} />
          </IonButtons>
          <IonTitle>{match.params.name}</IonTitle>
          <IonButtons slot="primary">
            <Namespaces />
            <Details
              refresh={refetch}
              bookmark={{
                title: match.params.name,
                url: match.url,
                namespace: cluster ? cluster.namespace : '',
              }}
              type="customresourcedefinitions"
            />
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

            <IonList>
              {data
                ? data.map((group, i) => (
                    <React.Fragment key={i}>
                      {group && group.items
                        ? group.items
                            .filter((item) => {
                              const regex = new RegExp(searchText, 'gi');
                              return item.metadata && item.metadata.name && item.metadata.name.match(regex);
                            })
                            .map((item, j) => {
                              if (item.metadata && item.metadata.namespace && item.metadata.namespace !== namespace) {
                                namespace = item.metadata.namespace;
                                showNamespace = true;
                              } else {
                                showNamespace = false;
                              }

                              return (
                                <IonItemGroup key={j}>
                                  {showNamespace ? (
                                    <IonItemDivider>
                                      <IonLabel>{namespace}</IonLabel>
                                    </IonItemDivider>
                                  ) : null}
                                  <ItemOptions
                                    item={item}
                                    url={`${getURL(
                                      item.metadata ? item.metadata.namespace : '',
                                      match.params.group,
                                      match.params.version,
                                      match.params.name,
                                    )}/${item.metadata ? item.metadata.name : ''}`}
                                  >
                                    <CustomResourceItem
                                      group={match.params.group}
                                      version={match.params.version}
                                      name={match.params.name}
                                      item={item}
                                    />
                                  </ItemOptions>
                                </IonItemGroup>
                              );
                            })
                        : null}
                    </React.Fragment>
                  ))
                : null}
              <IonInfiniteScroll
                threshold="25%"
                disabled={!canFetchMore || (isFetchingMore as boolean)}
                onIonInfinite={loadMore}
              >
                <IonInfiniteScrollContent
                  loadingText={`Loading more ${match.params.name}...`}
                ></IonInfiniteScrollContent>
              </IonInfiniteScroll>
            </IonList>
          </React.Fragment>
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error}
            icon="/assets/icons/kubernetes/crd.png"
            text={`Could not get Custom Resources "${match.params.name}"`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(CustomResourcesListPage, (prevProps, nextProps): boolean => {
  if (prevProps.match.url !== nextProps.match.url) {
    return false;
  }

  return true;
});
