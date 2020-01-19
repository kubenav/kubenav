import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader, IonIcon,
  IonList,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import { refresh } from 'ionicons/icons';
import React, {useContext, useEffect, useState} from 'react';
import { RouteComponentProps } from 'react-router';

import ItemOptions from '../components/kubernetes/ItemOptions';
import NamespacePopover from '../components/kubernetes/NamespacePopover';
import LoadingErrorCard from '../components/misc/LoadingErrorCard';
import { AppContext } from '../context';
import { IContext } from '../declarations';
import { sections } from '../sections';
import { isNamespaced } from '../utils';

interface IMatchParams {
  section: string;
  type: string;
  namespace: string;
  name: string;
}

interface IListProps extends RouteComponentProps<IMatchParams> {}

const List: React.FunctionComponent<IListProps> = ({ match }) => {
  const context = useContext<IContext>(AppContext);

  const page = sections[match.params.section].pages[match.params.type];
  const Component = page.listItemComponent;

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
          <IonList>
            {match.url === url && items ? items.map((item, index) => {
              return (
                <ItemOptions key={index} item={item} url={page.detailsURL(item.metadata ? item.metadata.namespace : '', item.metadata ? item.metadata.name : '')}>
                  <Component key={index} item={item} section={match.params.section} type={match.params.type} />
                </ItemOptions>
              )
            }) : null}
          </IonList>
        ) : <LoadingErrorCard cluster={context.cluster} clusters={context.clusters} error={error} icon={page.icon} text={`Could not get ${page.pluralText}`} />}
      </IonContent>
    </IonPage>
  );
};

export default List;
