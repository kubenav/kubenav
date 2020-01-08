import {
  IonAlert,
  IonButtons,
  IonContent,
  IonHeader,
  IonList,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar
} from '@ionic/react';
import React, {useContext, useEffect, useState} from 'react';
import { RouteComponentProps } from 'react-router';

import ItemOptions from '../components/kubernetes/ItemOptions';
import NamespacePopover from '../components/kubernetes/NamespacePopover';
import { AppContext } from '../context';
import { Context } from '../declarations';
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
  const context = useContext<Context>(AppContext);

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
  }, [match, context.clusters]); /* eslint-disable-line */

  const doRefresh = async (event) => {
    event.detail.complete();
    await load();
  };

  const load = async () => {
    setShowLoading(true);

    try {
      const namespace = context.clusters[context.cluster].namespace;
      const data: any = await context.request('GET', page.listURL(namespace), '');
      setItems(data.items);
    } catch (err) {
      setError(err);
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
          {isNamespaced(match.params.type) ? <NamespacePopover /> : null}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header={`Could not get ${page.pluralText}`} message={error} buttons={['OK']} /> : null}
        {showLoading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed"  onIonRefresh={doRefresh} />

        <IonList>
          {match.url === url && items ? items.map((item, index) => {
            return (
              <ItemOptions key={index} item={item} url={page.detailsURL(item.metadata ? item.metadata.namespace : '', item.metadata ? item.metadata.name : '')}>
                <Component key={index} item={item} section={match.params.section} type={match.params.type} />
              </ItemOptions>
            )
          }) : null}
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default List;
