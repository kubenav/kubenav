import {
  IonBackButton, IonButton,
  IonButtons,
  IonContent,
  IonHeader, IonIcon,
  IonList,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import { refresh } from 'ionicons/icons';
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import ItemOptions from '../components/kubernetes/ItemOptions';
import CustomResourceItem from '../components/kubernetes/items/CustomResourceItem';
import NamespacePopover from '../components/kubernetes/NamespacePopover';
import LoadingErrorCard from '../components/misc/LoadingErrorCard';
import { AppContext } from '../context';
import { IContext } from '../declarations';

interface IMatchParams {
  group: string;
  version: string;
  name: string;
}

interface ICustomResourcesListPageProps extends RouteComponentProps<IMatchParams> {}

const getURL = (namespace: string, group: string, version: string, name: string): string => {
  return namespace ? `/apis/${group}/${version}/namespaces/${namespace}/${name}` : `/apis/${group}/${version}/${name}`
};

const CustomResourcesListPage: React.FunctionComponent<ICustomResourcesListPageProps> = ({ match }) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [showLoading, setShowLoading] = useState<boolean>(false);
  const [items, setItems] = useState<any>();
  const [url, setUrl] = useState<string>('');

  useEffect(() => {
    (async() => {
      setItems(undefined);
      setUrl(match.url);
      await load();
    })();

    return () => {};
  }, [match, context.clusters, context.cluster]); /* eslint-disable-line */

  const doRefresh = async (event) => {
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
      const data: any = await context.request('GET', getURL(namespace, match.params.group, match.params.version, match.params.name), '');
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
            <IonBackButton defaultHref={`/kubernetes/cluster/customresourcedefinitions`} />
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
          <IonList>
            {match.url === url && items ? items.map((item, index) => {
              return (
                <ItemOptions key={index} item={item} url={`${getURL(item.metadata ? item.metadata.namespace : '', match.params.group, match.params.version, match.params.name)}/${item.metadata ? item.metadata.name : ''}`}>
                  <CustomResourceItem item={item} />
                </ItemOptions>
              )
            }) : null}
          </IonList>
        ) : <LoadingErrorCard cluster={context.cluster} clusters={context.clusters} error={error} icon="/assets/icons/kubernetes/crd.png" text={`Could not get Custom Resource "${match.params.name}"`} />}
      </IonContent>
    </IonPage>
  );
};

export default CustomResourcesListPage;
