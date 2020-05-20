import { IonButton, IonIcon, IonItem, IonItemOption, IonLabel, IonList, IonPopover } from '@ionic/react';
import { list } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, ITerminalContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import { TerminalContext } from '../../utils/terminal';

const TAIL_LINES = 1000;

interface IAddLogsProps {
  namespace: string;
  pod: string;
  container: string;
  mobile: boolean;
}

const AddLogs: React.FunctionComponent<IAddLogsProps> = ({ namespace, pod, container, mobile }: IAddLogsProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  const add = async (previous: boolean, tailLines: number) => {
    let logs = '';

    try {
      if (context.clusters && context.cluster) {
        let parameters = `container=${container}`;

        if (previous) {
          parameters = `${parameters}&previous=true`;
        }

        if (tailLines !== 0) {
          parameters = `${parameters}&tailLines=${tailLines}`;
        }

        // It is possible that the returned log only contains one line with valid json. This gets parsed by the requests
        // function and so an object instead of a string is returned. In this case we have to revert the parsing.
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const data: any = await context.request(
          'GET',
          `/api/v1/namespaces/${namespace}/pods/${pod}/log?${parameters}`,
          '',
        );

        logs = typeof data === 'string' ? data : JSON.stringify(data);
      }
    } catch (err) {
      logs = err.message;
    }

    terminalContext.add({
      name: container,
      type: 'logs',
      logs: logs,
    });
  };

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
              add(false, TAIL_LINES);
            }}
          >
            <IonLabel>{`Last ${TAIL_LINES} Log Lines`}</IonLabel>
          </IonItem>
          <IonItem
            button={true}
            detail={false}
            onClick={(e) => {
              e.stopPropagation();
              setShowPopover(false);
              add(false, 0);
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
              add(true, TAIL_LINES);
            }}
          >
            <IonLabel>{`Previous Last ${TAIL_LINES} Log Lines`}</IonLabel>
          </IonItem>
          <IonItem
            button={true}
            detail={false}
            onClick={(e) => {
              e.stopPropagation();
              setShowPopover(false);
              add(true, 0);
            }}
          >
            <IonLabel>All Previous Log Lines</IonLabel>
          </IonItem>
        </IonList>
      </IonPopover>

      {mobile ? (
        <IonItemOption color="primary" onClick={() => setShowPopover(true)}>
          <IonIcon slot="start" icon={list} />
          Logs
        </IonItemOption>
      ) : (
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
      )}
    </React.Fragment>
  );
};

export default AddLogs;
