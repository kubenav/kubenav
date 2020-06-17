import SockJS from 'sockjs-client';
import { Terminal } from 'xterm';

import { IContext, ITerminalContext } from '../../declarations';
import { execRequest } from '../../utils/api';
import { SERVER, SHELL_TERMINAL_OPTIONS } from '../../utils/constants';

export const addShell = async (
  context: IContext,
  terminalContext: ITerminalContext,
  url: string,
  container: string,
): Promise<void> => {
  const term = new Terminal(SHELL_TERMINAL_OPTIONS(context.settings.darkMode));

  try {
    if (context.clusters && context.cluster) {
      const { id } = await execRequest(
        `${url}/exec?command=sh&container=${container}&stdin=true&stdout=true&stderr=true&tty=true`,
        context.clusters[context.cluster],
      );

      const webSocket = new SockJS(`${SERVER}/api/kubernetes/sockjs?${id}`);

      term?.onData((str) => {
        webSocket.send(
          JSON.stringify({
            Op: 'stdin',
            Data: str,
            Cols: term.cols,
            Rows: term.rows,
          }),
        );
      });

      term?.onResize(() => {
        webSocket.send(
          JSON.stringify({
            Op: 'resize',
            Cols: term.cols,
            Rows: term.rows,
          }),
        );
      });

      webSocket.onopen = () => {
        const startData = { Op: 'bind', SessionID: id };
        webSocket.send(JSON.stringify(startData));
      };

      webSocket.onmessage = (event) => {
        const msg = JSON.parse(event.data);
        if (msg.Op === 'stdout') {
          term?.write(msg.Data);
        }
      };

      terminalContext.add({
        name: container,
        shell: term,
        webSocket: webSocket,
      });
    }
  } catch (err) {
    term.write(`${err.message}\n\r`);

    terminalContext.add({
      name: container,
      shell: term,
    });
  }
};
