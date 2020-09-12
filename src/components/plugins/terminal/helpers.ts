import SockJS from 'sockjs-client';
import { Terminal } from 'xterm';

import { IContext, ITerminalContext } from '../../../declarations';
import { kubernetesRequest, kubernetesExecRequest, kubernetesLogsRequest, sshRequest } from '../../../utils/api';
import { INCLUSTER_URL, LOG_TERMINAL_OPTIONS, SHELL_TERMINAL_OPTIONS } from '../../../utils/constants';

export const addShell = async (
  context: IContext,
  terminalContext: ITerminalContext,
  url: string,
  container: string,
  shell: string,
): Promise<void> => {
  const term = new Terminal(
    SHELL_TERMINAL_OPTIONS(
      context.settings.terminalFontSize,
      context.settings.terminalScrollback,
      context.settings.darkMode,
    ),
  );

  try {
    if (context.clusters && context.cluster) {
      const { id } = await kubernetesExecRequest(
        `${url}/exec?command=${shell}&container=${container}&stdin=true&stdout=true&stderr=true&tty=true`,
        await context.kubernetesAuthWrapper(''),
      );

      const webSocket = new SockJS(`${INCLUSTER_URL}/api/kubernetes/exec/sockjs?${id}`);

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

export const addLogs = async (
  context: IContext,
  terminalContext: ITerminalContext,
  url: string,
  container: string,
  previous: boolean,
  tailLines: number,
  follow: boolean,
): Promise<void> => {
  const term = new Terminal(
    LOG_TERMINAL_OPTIONS(
      context.settings.terminalFontSize,
      context.settings.terminalScrollback,
      context.settings.darkMode,
    ),
  );

  if (context.clusters && context.cluster) {
    if (follow) {
      try {
        const parameters = `container=${container}&tailLines=10&follow=true`;

        const { id } = await kubernetesLogsRequest(`${url}/log?${parameters}`, await context.kubernetesAuthWrapper(''));

        const eventSource = new EventSource(`${INCLUSTER_URL}/api/kubernetes/logs/${id}`);

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
        const data: any = await kubernetesRequest(
          'GET',
          `${url}/log?${parameters}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
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

export const addSSH = async (
  context: IContext,
  terminalContext: ITerminalContext,
  node: string,
  ip: string,
): Promise<void> => {
  const term = new Terminal(
    SHELL_TERMINAL_OPTIONS(
      context.settings.terminalFontSize,
      context.settings.terminalScrollback,
      context.settings.darkMode,
    ),
  );

  try {
    if (context.clusters && context.cluster) {
      const { id } = await sshRequest(
        context.settings.sshKey,
        `${ip}:${context.settings.sshPort}`,
        context.settings.sshUser,
      );

      const webSocket = new SockJS(`${INCLUSTER_URL}/api/kubernetes/ssh/sockjs?${id}`);

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
        name: node,
        shell: term,
        webSocket: webSocket,
      });
    }
  } catch (err) {
    term.write(`${err.message}\n\r`);

    terminalContext.add({
      name: node,
      shell: term,
    });
  }
};
