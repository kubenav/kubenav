import { IonButton, IonIcon, IonItemOption } from '@ionic/react';
import { terminal } from 'ionicons/icons';
import React, { useContext } from 'react';
import SockJS from 'sockjs-client';
import { Terminal as xTerminal } from 'xterm';

import { IContext, ITerminalContext } from '../../declarations';
import { execRequest } from '../../utils/api';
import { SERVER, TERMINAL_DARK_THEME, TERMINAL_LIGHT_THEME } from '../../utils/constants';
import { AppContext } from '../../utils/context';
import { TerminalContext } from '../../utils/terminal';

interface IAddShellProps {
  namespace: string;
  pod: string;
  container: string;
  mobile: boolean;
}

const AddShell: React.FunctionComponent<IAddShellProps> = ({ namespace, pod, container, mobile }: IAddShellProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const add = async () => {
    try {
      if (context.clusters && context.cluster) {
        const term = new xTerminal({
          fontSize: 12,
          bellStyle: 'sound',
          cursorBlink: true,
          theme: context.settings.darkMode ? TERMINAL_DARK_THEME : TERMINAL_LIGHT_THEME,
        });

        const { id } = await execRequest(
          `/api/v1/namespaces/${namespace}/pods/${pod}/exec?command=sh&container=${container}&stdin=true&stdout=true&stderr=true&tty=true`,
          context.clusters[context.cluster],
        );

        const sock = new SockJS(`${SERVER}/api/kubernetes/sockjs?${id}`);

        term?.onData((str) => {
          sock.send(
            JSON.stringify({
              Op: 'stdin',
              Data: str,
              Cols: term.cols,
              Rows: term.rows,
            }),
          );
        });

        sock.onopen = () => {
          const startData = { Op: 'bind', SessionID: id };
          sock.send(JSON.stringify(startData));
        };

        sock.onmessage = (event) => {
          const msg = JSON.parse(event.data);
          if (msg.Op === 'stdout') {
            term?.write(msg.Data);
          }
        };

        terminalContext.add({
          name: container,
          type: 'shell',
          shell: term,
        });
      }
    } catch (err) {
      throw err;
    }
  };

  if (mobile) {
    return (
      <IonItemOption color="primary" onClick={() => add()}>
        <IonIcon slot="start" icon={terminal} />
        Term
      </IonItemOption>
    );
  } else {
    return (
      <IonButton
        fill="outline"
        slot="end"
        onClick={(e) => {
          e.stopPropagation();
          add();
        }}
      >
        <IonIcon slot="start" icon={terminal} />
        Term
      </IonButton>
    );
  }
};

export default AddShell;
