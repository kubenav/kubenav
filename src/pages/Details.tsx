import {
  IonAlert,
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar
} from '@ionic/react';
import React, {useContext, useEffect, useState} from 'react';
import { RouteComponentProps } from 'react-router';

import { AppContext } from '../context';
import { Context } from '../declarations';
import { sections } from '../sections';

interface MatchParams {
  section: string;
  type: string;
  namespace: string;
  name: string;
}

interface DetailsProps extends RouteComponentProps<MatchParams> {}

const Details: React.FunctionComponent<DetailsProps> = ({ match }) => {
  const context = useContext<Context>(AppContext);

  const page = sections[match.params.section].pages[match.params.type];
  const Component = page.detailsComponent;

  const [error, setError] = useState<string>('');
  const [showLoading, setShowLoading] = useState<boolean>(false);
  const [item, setItem] = useState<any>();
  const [url, setUrl] = useState<string>('');

  useEffect(() => {
    (async() => {
      setItem(undefined);
      setUrl(match.url);
      await load();
    })();

    return () => {};
  }, [match]); /* eslint-disable-line */

  const doRefresh = async (event) => {
    event.detail.complete();
    await load();
  };

  const load = async () => {
    setShowLoading(true);

    try {
      const data: any = await context.request('GET', page.detailsURL(match.params.namespace, match.params.name), '');
      setItem(data);
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
            <IonBackButton defaultHref={`/kubernetes/${match.params.section}/${match.params.type}`} />
          </IonButtons>
          <IonTitle>{item && item.metadata ? item.metadata.name : ''}</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header={`Could not get ${page.pluralText}`} message={error} buttons={['OK']} /> : null}
        {showLoading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed"  onIonRefresh={doRefresh} />

        {match.url === url && item ? <Component item={item} section={match.params.section} type={match.params.type} /> : null}
      </IonContent>
    </IonPage>
  );
};

export default Details;
