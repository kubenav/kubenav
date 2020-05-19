import React, { useRef, useEffect, useState } from 'react';
import SockJS from 'sockjs-client';
import { Terminal as xTerminal } from 'xterm';
import { FitAddon } from 'xterm-addon-fit';

import 'xterm/css/xterm.css';

import { ITerminal } from '../../declarations';
import { execRequest } from '../../utils/api';
import { SERVER } from '../../utils/constants';

interface ITerminalProps {
  terminal: ITerminal;
}

const Terminal: React.FunctionComponent<ITerminalProps> = ({ terminal }: ITerminalProps) => {
  const termRef = useRef<HTMLDivElement>(null);
  const [xterm, setXterm] = useState<xTerminal>();

  const fitAddon = new FitAddon();

  useEffect(() => {
    const term = new xTerminal({
      fontSize: 12,
      bellStyle: 'sound',
      cursorBlink: true,
    });
    setXterm(term);
  }, []);

  useEffect(() => {
    const handleTerminalInit = async () => {
      setTimeout(() => {
        if (termRef.current && xterm) {
          xterm.loadAddon(fitAddon);
          xterm.open(termRef.current);
          fitAddon.fit();
          xterm.focus();

          openWebSocket();
        }
      }, 1000);
    };

    handleTerminalInit();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [termRef, xterm]);

  const openWebSocket = async () => {
    try {
      const { id } = await execRequest(
        `/api/v1/namespaces/${terminal.namespace}/pods/${terminal.pod}/exec?command=sh&container=${terminal.container}&stdin=true&stdout=true&stderr=true&tty=true`,
        terminal.cluster,
      );

      const sock = new SockJS(`${SERVER}/api/kubernetes/sockjs?${id}`);

      xterm?.onData((str) => {
        sock.send(
          JSON.stringify({
            Op: 'stdin',
            Data: str,
            Cols: xterm.cols,
            Rows: xterm.rows,
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
          xterm?.write(msg.Data);
        }
      };
    } catch (err) {
      xterm?.write(err.message);
    }
  };

  return <div className="terminal-container" ref={termRef}></div>;
};

export default Terminal;
