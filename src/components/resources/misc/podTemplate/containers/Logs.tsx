import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonList,
  IonModal,
  IonPopover,
  IonProgressBar,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close, ellipsisHorizontal, ellipsisVertical } from 'ionicons/icons';
import React, { useContext, useEffect, useState } from 'react';

import { IContext } from '../../../../../declarations';
import { AppContext } from '../../../../../utils/context';
import Editor from '../../../../misc/Editor';

const TAIL_LINES = 1000;

interface ILogsProps {
  showModal: boolean;
  setShowModal: (value: boolean) => void;
  name: string;
  namespace: string;
  container: string;
}

const Logs: React.FunctionComponent<ILogsProps> = ({
  showModal,
  setShowModal,
  name,
  namespace,
  container,
}: ILogsProps) => {
  const context = useContext<IContext>(AppContext);

  const [showLoading, setShowLoading] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [logs, setLogs] = useState<string>('');
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  useEffect(() => {
    if (showModal) {
      (async () => {
        setLogs('');
        await load(false, TAIL_LINES);
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

      // It is possible that the returned log only contains one line with valid json. This gets parsed by the requests
      // function and so an object instead of a string is returned. In this case we have to revert the parsing.
      const data: any = await context.request(
        'GET',
        `/api/v1/namespaces/${namespace}/pods/${name}/log?${parameters}`,
        '',
      );
      setLogs(typeof data === 'string' ? data : JSON.stringify(data));
    } catch (err) {
      setError(err);
    }

    setShowLoading(false);
  };

  return (
    <React.Fragment>
      {error !== '' ? (
        <IonAlert
          isOpen={error !== ''}
          onDidDismiss={() => setError('')}
          header="Could not load logs"
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton
                onClick={(e) => {
                  setShowModal(false);
                }}
              >
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{container}</IonTitle>
            <IonButtons slot="primary">
              <IonButton
                onClick={(e) => {
                  e.persist();
                  setPopoverEvent(e as any);
                  setShowPopover(true);
                }}
              >
                <IonIcon slot="icon-only" ios={ellipsisHorizontal} md={ellipsisVertical} />
              </IonButton>
            </IonButtons>

            <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
              <IonList>
                <IonItem
                  button={true}
                  detail={false}
                  onClick={() => {
                    setShowPopover(false);
                    load(false, TAIL_LINES);
                  }}
                >
                  <IonLabel>{`Last ${TAIL_LINES} Log Lines`}</IonLabel>
                </IonItem>
                <IonItem
                  button={true}
                  detail={false}
                  onClick={() => {
                    setShowPopover(false);
                    load(false, 0);
                  }}
                >
                  <IonLabel>All Log Lines</IonLabel>
                </IonItem>
                <IonItem
                  button={true}
                  detail={false}
                  onClick={() => {
                    setShowPopover(false);
                    load(true, TAIL_LINES);
                  }}
                >
                  <IonLabel>{`Previous Last ${TAIL_LINES} Log Lines`}</IonLabel>
                </IonItem>
                <IonItem
                  button={true}
                  detail={false}
                  onClick={() => {
                    setShowPopover(false);
                    load(true, 0);
                  }}
                >
                  <IonLabel>All Previous Log Lines</IonLabel>
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
