import {
  IonAlert,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItemOption,
  IonModal,
  IonProgressBar,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close, list, refresh } from 'ionicons/icons';
import React, {useContext, useEffect, useState} from 'react';

import { AppContext } from '../../context';
import { Context } from '../../declarations';
import Editor from '../misc/Editor';

interface LogsProps {
  name: string;
  namespace: string;
  container: string;
}

const Logs: React.FunctionComponent<LogsProps> = ({ name, namespace, container }) => {
  const context = useContext<Context>(AppContext);

  const [showModal, setShowModal] = useState<boolean>(false);
  const [showLoading, setShowLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [logs, setLogs] = useState<string>('');

  useEffect(() => {
    if (showModal) {
      (async() => {
        setLogs('');
        await load();
      })();
    }

    return () => {};
  }, [showModal]); /* eslint-disable-line */

  const load = async () => {
    setShowLoading(true);

    try {
      const data: any = await context.request('GET', `/api/v1/namespaces/${namespace}/pods/${name}/log?container=${container}`, '');
      setLogs(data);
    } catch (err) {
      setError(err);
    }

    setShowLoading(false);
  };

  return (
    <React.Fragment>
      {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header="Could not load logs" message={error} buttons={['OK']} /> : null}

      <IonItemOption color="primary" onClick={() => setShowModal(true)}>
        <IonIcon slot="start" icon={list} />
        Logs
      </IonItemOption>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start" onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
            </IonButtons>
            <IonTitle>{container}</IonTitle>
            <IonButtons slot="primary" onClick={() => load()}>
              <IonIcon slot="icon-only" icon={refresh} />
            </IonButtons>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          {showLoading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
          <Editor readOnly={true} mode="text" value={logs} fullHeight={true} scrollToBottomButton={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default Logs;
