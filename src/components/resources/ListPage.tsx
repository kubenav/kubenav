import { RefresherEventDetail } from '@ionic/core';
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItemDivider,
  IonItemGroup,
  IonLabel,
  IonList,
  IonMenuButton,
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

import { IContext } from '../../declarations';
import { kubernetesRequest } from '../../utils/api';
import { AppContext } from '../../utils/context';
import { isNamespaced } from '../../utils/helpers';
import { resources } from '../../utils/resources';
import LoadingErrorCard from '../misc/LoadingErrorCard';
import Namespaces from './misc/list/Namespaces';
import ItemOptions from './misc/details/ItemOptions';

interface IMatchParams {
  section: string;
  type: string;
}

type IListPageProps = RouteComponentProps<IMatchParams>;

// ListPage shows a list of the selected resource. The list can be filtered by namespace and each item contains a status
// indicator, to get an overview of problems in the cluster.
const ListPage: React.FunctionComponent<IListPageProps> = ({ match }: IListPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  // Determine one which page we are currently (which items for a resource do we want to show) by the section and type
  // parameter. Get the component 'ResourceItem' we want to render.
  const page = resources[match.params.section].pages[match.params.type];
  const Component = page.listItemComponent;

  // namespace and showNamespace is used to group all items by namespace and to only show the namespace once via the
  // IonItemDivider component.
  let namespace = '';
  let showNamespace = false;

  // searchText is used to search and filter the list of items.
  const [searchText, setSearchText] = useState<string>('');

  const { isError, isFetching, data, error, refetch } = useQuery(
    [cluster ? cluster.id : '', cluster ? cluster.namespace : '', match.params.section, match.params.type],
    async () =>
      await kubernetesRequest(
        'GET',
        page.listURL(cluster ? cluster.namespace : ''),
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
            <IonMenuButton />
          </IonButtons>
          <IonTitle>{page.pluralText}</IonTitle>
          <IonButtons slot="primary">
            {!isPlatform('hybrid') ? (
              <IonButton onClick={() => refetch()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
            ) : null}
            {isNamespaced(match.params.type) ? <Namespaces /> : null}
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
                      if (
                        isNamespaced(match.params.type) &&
                        item.metadata &&
                        item.metadata.namespace &&
                        item.metadata.namespace !== namespace
                      ) {
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
                            item={item}
                            url={page.detailsURL(
                              item.metadata ? item.metadata.namespace : '',
                              item.metadata ? item.metadata.name : '',
                            )}
                          >
                            <Component
                              key={index}
                              item={item}
                              section={match.params.section}
                              type={match.params.type}
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
            icon={page.icon}
            text={`Could not get ${page.pluralText}`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(ListPage, (prevProps, nextProps): boolean => {
  if (prevProps.match.url !== nextProps.match.url) {
    return false;
  }

  return true;
});
