import { IonButton, IonIcon, IonItem, IonItemOption, IonLabel, IonList, IonPopover } from '@ionic/react';
import { list } from 'ionicons/icons';
import React, { useContext, useState } from 'react';
import { Terminal } from 'xterm';

import { IContext, ITerminalContext, TActivator } from '../../declarations';
import { logsRequest } from '../../utils/api';
import { LOG_TAIL_LINES, LOG_TERMINAL_OPTIONS, SERVER } from '../../utils/constants';
import { AppContext } from '../../utils/context';
import { TerminalContext } from '../../utils/terminal';

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

  const add = async (previous: boolean, tailLines: number, follow: boolean) => {
    const term = new Terminal(LOG_TERMINAL_OPTIONS(context.settings.darkMode));

    if (context.clusters && context.cluster) {
      if (follow) {
        try {
          const parameters = `container=${container}&tailLines=10&follow=true`;

          const { id } = await logsRequest(
            `/api/v1/namespaces/${namespace}/pods/${pod}/log?${parameters}`,
            context.clusters[context.cluster],
          );

          const eventSource = new EventSource(`${SERVER}/api/kubernetes/logs/${id}`);

          eventSource.onmessage = (event: MessageEvent) => {
            term.write(`${event.data}\n\r`);
          };

          eventSource.onerror = () => {
            term.write('\n\rAN ERROR OCCURRED, WHILE STREAMING LOG LINES.\n\r');
            eventSource.close();
          };

          terminalContext.add({
            name: container,
            shell: term,
            eventSource: eventSource,
          });
        } catch (err) {
          term.write(`${err.message}\n\r`);

          terminalContext.add({
            name: container,
            shell: term,
          });
        }
      } else {
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
          // Befor writing the logs to the terminal we have to replace all '\n' with '\n\r' to print the new lines.
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const data: any = await context.request(
            'GET',
            `/api/v1/namespaces/${namespace}/pods/${pod}/log?${parameters}`,
            '',
          );

          term.write(`${typeof data === 'string' ? data : JSON.stringify(data)}\n\r`);
        } catch (err) {
          term.write(`${err.message}\n\r`);
        }

        terminalContext.add({
          name: container,
          shell: term,
        });
      }
    }
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
              add(false, LOG_TAIL_LINES, false);
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
              add(false, 0, false);
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
              add(true, LOG_TAIL_LINES, false);
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
              add(true, 0, false);
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
              add(false, LOG_TAIL_LINES, true);
            }}
          >
            <IonLabel>{`Stream Log Lines`}</IonLabel>
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
