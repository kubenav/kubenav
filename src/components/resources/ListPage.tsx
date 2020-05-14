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
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import { isNamespaced } from '../../utils/helpers';
import { resources } from '../../utils/resources';
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

  // namespace and showNamespace is used to group all items by namespace and to only show the namespace once via the
  // IonItemDivider component.
  let namespace = '';
  let showNamespace = false;

  // Determine one which page we are currently (which items for a resource do we want to show) by the section and type
  // parameter. Get the component 'ResourceItem' we want to render.
  const page = resources[match.params.section].pages[match.params.type];
  const Component = page.listItemComponent;

  // The error state is used to show error message to the user, when the Kubernetes API request fails. showLoading is
  // the indicator the the items are currently loaded/reloaded.
  // HACK: url is used to avoid unnecessary rendering. We should try to remove this and test if it is really required in
  // the current version. Maybe it's already improved and not needed.
  const [error, setError] = useState<string>('');
  const [showLoading, setShowLoading] = useState<boolean>(false);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [items, setItems] = useState<any>();
  const [url, setUrl] = useState<string>('');
  const [searchText, setSearchText] = useState<string>('');

  // When the component is rendered the first time and on every change route change or a modification to the context
  // object we are loading all items for the corresponding resource.
  useEffect(() => {
    (async () => {
      setItems(undefined);
      setUrl(match.url);
      await load();
    })();

    return () => {};
  }, [match, context.clusters, context.cluster]); /* eslint-disable-line */

  // The doRefresh method is used for a manual reload of the items for the corresponding resource. The
  // event.detail.complete() call is required to finish the animation of the IonRefresher component.
  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    await load();
  };

  // load loads all the items for the corresponding resource. If the clusters or cluster property of the context is
  // undefined we are returning an error. If everything is defined we are getting the selected namespace of the current
  // cluster and trying to get all the items.
  const load = async () => {
    setShowLoading(true);

    try {
      if (!context.clusters || !context.cluster) {
        throw new Error('Select an active cluster');
      }

      const namespace = context.clusters[context.cluster].namespace;
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const data: any = await context.request('GET', page.listURL(namespace), '');
      setError('');
      setItems(data.items);
    } catch (err) {
      setError(err.message);
    }

    setShowLoading(false);
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
              <IonButton onClick={() => load()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
            ) : null}
            {isNamespaced(match.params.type) ? <NamespacePopover /> : null}
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {showLoading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {error === '' && context.clusters && context.cluster && context.clusters.hasOwnProperty(context.cluster) ? (
          <React.Fragment>
            <IonSearchbar
              inputmode="search"
              value={searchText}
              onIonChange={(e) => setSearchText(e.detail.value ? e.detail.value : '')}
            />

            <IonList>
              {match.url === url && items
                ? items
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
        ) : (
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

export default ListPage;
