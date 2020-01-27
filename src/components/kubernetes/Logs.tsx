import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonItemOption,
  IonLabel,
  IonList,
  IonModal,
  IonPopover,
  IonProgressBar,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close, list, more } from 'ionicons/icons';
import React, { useContext, useEffect, useState } from 'react';

import { AppContext } from '../../context';
import { IContext, TActivator } from '../../declarations';
import Editor from '../misc/Editor';

interface ILogsProps {
  activator: TActivator;
  name: string;
  namespace: string;
  container: string;
}

const Logs: React.FunctionComponent<ILogsProps> = ({ activator, name, namespace, container }) => {
  const context = useContext<IContext>(AppContext);

  const [showModal, setShowModal] = useState<boolean>(false);
  const [showLoading, setShowLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [logs, setLogs] = useState<string>('');
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  useEffect(() => {
    if (showModal) {
      (async() => {
        setLogs('');
        await load(false, 1000);
      })();
    }

    return () => {};
  }, [showModal]); /* eslint-disable-line */

  const load = async (previous: boolean, tailLines: number) => {
    setShowLoading(true);

    try {
      let parameters = `container=${container}`;

      if (previous) {
        parameters = `${parameters}&previous=true`;
      }

      if (tailLines !== 0) {
        parameters = `${parameters}&tailLines=${tailLines}`;
      }

      const data: any = await context.request('GET', `/api/v1/namespaces/${namespace}/pods/${name}/log?${parameters}`, '');
      setLogs(data);
    } catch (err) {
      setError(err);
    }

    setShowLoading(false);
  };

  return (
    <React.Fragment>
      {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header="Could not load logs" message={error} buttons={['OK']} /> : null}

      {activator === 'item-option' ? (
        <IonItemOption color="primary" onClick={() => setShowModal(true)}>
          <IonIcon slot="start" icon={list} />
          Logs
        </IonItemOption>
      ) : null}

      {activator === 'button' ? (
        <IonButton fill="outline" slot="end" onClick={(e) => { e.stopPropagation(); setShowModal(true); }}>
          <IonIcon slot="start" icon={list} />
          Logs
        </IonButton>
      ) : null}

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={(e) => { e.stopPropagation(); setShowModal(false); }}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{container}</IonTitle>
            <IonButtons slot="primary">
              <IonButton onClick={(e) => { e.stopPropagation(); e.persist(); setPopoverEvent(e); setShowPopover(true); }}>
                <IonIcon slot="icon-only" icon={more} />
              </IonButton>
            </IonButtons>

            <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
              <IonList>
                <IonItem button={true} detail={false} onClick={(e) => { e.stopPropagation(); setShowPopover(false); load(false, 1000); }}>
                  <IonLabel>Log</IonLabel>
                </IonItem>
                <IonItem button={true} detail={false} onClick={(e) => { e.stopPropagation(); setShowPopover(false); load(false, 0); }}>
                  <IonLabel>Complete Log</IonLabel>
                </IonItem>
                <IonItem button={true} detail={false} onClick={(e) => { e.stopPropagation(); setShowPopover(false); load(true, 1000); }}>
                  <IonLabel>Previous Log</IonLabel>
                </IonItem>
                <IonItem button={true} detail={false} onClick={(e) => { e.stopPropagation(); setShowPopover(false); load(true, 0); }}>
                  <IonLabel>Complete Previous Log</IonLabel>
                </IonItem>
              </IonList>
            </IonPopover>
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
