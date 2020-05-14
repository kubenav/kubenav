import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
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
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import LoadingErrorCard from '../../../misc/LoadingErrorCard';
import ItemOptions from '../../misc/modify/ItemOptions';
import NamespacePopover from '../../misc/NamespacePopover';
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
  match,
}: ICustomResourcesListPageProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [showLoading, setShowLoading] = useState<boolean>(false);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [items, setItems] = useState<any>();
  const [url, setUrl] = useState<string>('');
  const [searchText, setSearchText] = useState<string>('');

  useEffect(() => {
    (async () => {
      setItems(undefined);
      setUrl(match.url);
      await load();
    })();

    return () => {};
  }, [match, context.clusters, context.cluster]); /* eslint-disable-line */

  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    await load();
  };

  const load = async () => {
    setShowLoading(true);

    try {
      if (!context.clusters || !context.cluster) {
        throw new Error('Select an active cluster');
      }

      const namespace = context.clusters[context.cluster].namespace;
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const data: any = await context.request(
        'GET',
        getURL(namespace, match.params.group, match.params.version, match.params.name),
        '',
      );
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
            <IonBackButton defaultHref={`/resources/cluster/customresourcedefinitions`} />
          </IonButtons>
          <IonTitle>{match.params.name}</IonTitle>
          <IonButtons slot="primary">
            {!isPlatform('hybrid') ? (
              <IonButton onClick={() => load()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
            ) : null}
            <NamespacePopover />
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
                      return (
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
                          <CustomResourceItem item={item} />
                        </ItemOptions>
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
            icon="/assets/icons/kubernetes/crd.png"
            text={`Could not get Custom Resource "${match.params.name}"`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default CustomResourcesListPage;
