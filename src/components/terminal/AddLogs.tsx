import { IonButton, IonIcon, IonItem, IonItemOption, IonLabel, IonList, IonPopover } from '@ionic/react';
import { list } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../declarations';
import { LOG_TAIL_LINES } from '../../utils/constants';
import { AppContext } from '../../utils/context';
import { TerminalContext } from '../../utils/terminal';
import { addLogs } from './helpers';

interface IAddLogsProps {
  activator: TActivator;
  namespace: string;
  pod: string;
  container: string;
}

const AddLogs: React.FunctionComponent<IAddLogsProps> = ({ activator, namespace, pod, container }: IAddLogsProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  const url = `/api/v1/namespaces/${namespace}/pods/${pod}`;

  return (
    <React.Fragment>
      <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
        <IonList>
          <IonItem
            button={true}
            detail={false}
            onClick={(e) => {
              e.stopPropagation();
              setShowPopover(false);
              addLogs(context, terminalContext, url, pod, container, false, LOG_TAIL_LINES, false);
            }}
          >
            <IonLabel>{`Last ${LOG_TAIL_LINES} Log Lines`}</IonLabel>
          </IonItem>
          <IonItem
            button={true}
            detail={false}
            onClick={(e) => {
              e.stopPropagation();
              setShowPopover(false);
              addLogs(context, terminalContext, url, pod, container, false, 0, false);
            }}
          >
            <IonLabel>All Log Lines</IonLabel>
          </IonItem>
          <IonItem
            button={true}
            detail={false}
            onClick={(e) => {
              e.stopPropagation();
              setShowPopover(false);
              addLogs(context, terminalContext, url, pod, container, true, LOG_TAIL_LINES, false);
            }}
          >
            <IonLabel>{`Previous Last ${LOG_TAIL_LINES} Log Lines`}</IonLabel>
          </IonItem>
          <IonItem
            button={true}
            detail={false}
            onClick={(e) => {
              e.stopPropagation();
              setShowPopover(false);
              addLogs(context, terminalContext, url, pod, container, true, 0, false);
            }}
          >
            <IonLabel>All Previous Log Lines</IonLabel>
          </IonItem>
          <IonItem
            button={true}
            detail={false}
            onClick={(e) => {
              e.stopPropagation();
              setShowPopover(false);
              addLogs(context, terminalContext, url, pod, container, false, LOG_TAIL_LINES, true);
            }}
          >
            <IonLabel>Stream Log Lines</IonLabel>
          </IonItem>
        </IonList>
      </IonPopover>

      {activator === 'item-option' ? (
        <IonItemOption
          color="primary"
          onClick={(e) => {
            e.persist();
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            setPopoverEvent(e as any);
            setShowPopover(true);
          }}
        >
          <IonIcon slot="start" icon={list} />
          Logs
        </IonItemOption>
      ) : null}

      {activator === 'button' ? (
        <IonButton
          fill="outline"
          slot="end"
          onClick={(e) => {
            e.stopPropagation();
            e.persist();
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            setPopoverEvent(e as any);
            setShowPopover(true);
          }}
        >
          <IonIcon slot="start" icon={list} />
          Logs
        </IonButton>
      ) : null}
    </React.Fragment>
  );
};

export default AddLogs;
