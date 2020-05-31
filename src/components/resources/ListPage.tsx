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
import React, { memo, useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import { isNamespaced } from '../../utils/helpers';
import { resources } from '../../utils/resources';
import useAsyncFn from '../../utils/useAsyncFn';
import LoadingErrorCard from '../misc/LoadingErrorCard';
import ItemOptions from './misc/modify/ItemOptions';
import NamespacePopover from './misc/NamespacePopover';

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

  // useAsyncFn is a custom React hook which wrapps our API call.
  const [state, fetch, fetchInit] = useAsyncFn(
    async () => await context.request('GET', page.listURL(cluster ? cluster.namespace : ''), ''),
    [page, cluster?.namespace],
    { loading: true, error: undefined, value: undefined },
  );

  // When the component is rendered the first time and on every route change or a modification to the context
  // object we are loading all items for the corresponding resource.
  useEffect(() => {
    fetchInit();
  }, [fetchInit]);

  // The doRefresh method is used for a manual reload of the items for the corresponding resource. The
  // event.detail.complete() call is required to finish the animation of the IonRefresher component.
  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    fetch();
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
              <IonButton onClick={() => fetch()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
            ) : null}
            {isNamespaced(match.params.type) ? <NamespacePopover /> : null}
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {state.loading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!state.error && cluster ? (
          <React.Fragment>
            <IonSearchbar
              inputmode="search"
              value={searchText}
              onIonChange={(e) => setSearchText(e.detail.value ? e.detail.value : '')}
            />

            <IonList>
              {state.value && state.value.items
                ? state.value.items
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
        ) : state.loading ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={state.error}
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
