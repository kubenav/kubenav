import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
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
  isPlatform,
} from '@ionic/react';
import { refresh } from 'ionicons/icons';
import React, { memo, useContext, useState } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
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

  const { isError, isFetching, data, error, refetch } = useQuery(
    [
      cluster ? cluster.id : '',
      cluster ? cluster.namespace : '',
      match.params.group,
      match.params.version,
      match.params.name,
    ],
    async () =>
      await kubernetesRequest(
        'GET',
        getURL(
          scope === 'Cluster' ? '' : cluster ? cluster.namespace : '',
          match.params.group,
          match.params.version,
          match.params.name,
        ),
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    context.settings.queryConfig,
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
            <IonBackButton defaultHref={`/resources/cluster/customresourcedefinitions`} />
          </IonButtons>
          <IonTitle>{match.params.name}</IonTitle>
          <IonButtons slot="primary">
            {!isPlatform('hybrid') ? (
              <IonButton onClick={() => refetch()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
            ) : null}
            <Namespaces />
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
              {data && data.items
                ? data.items
                    .filter((item) => {
                      const regex = new RegExp(searchText, 'gi');
                      return item.metadata && item.metadata.name && item.metadata.name.match(regex);
                    })
                    .map((item, index) => {
                      if (item.metadata && item.metadata.namespace && item.metadata.namespace !== namespace) {
                        namespace = item.metadata.namespace;
                        showNamespace = true;
                      } else {
                        showNamespace = false;
                      }

                      return (
                        <IonItemGroup key={index}>
                          {showNamespace ? (
                            <IonItemDivider>
                              <IonLabel>{namespace}</IonLabel>
                            </IonItemDivider>
                          ) : null}
                          <ItemOptions
                            key={index}
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
