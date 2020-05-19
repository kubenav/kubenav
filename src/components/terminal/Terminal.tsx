import React, { useRef, useEffect, useState } from 'react';
import SockJS from 'sockjs-client';
import { Terminal as xTerminal } from 'xterm';
import { FitAddon } from 'xterm-addon-fit';

import 'xterm/css/xterm.css';

import { ITerminal } from '../../declarations';
import { execRequest } from '../../utils/api';
import { SERVER } from '../../utils/constants';

interface ITerminalProps {
  darkMode: boolean;
  terminal: ITerminal;
}

const Terminal: React.FunctionComponent<ITerminalProps> = ({ darkMode, terminal }: ITerminalProps) => {
  const termRef = useRef<HTMLDivElement>(null);
  const [xterm, setXterm] = useState<xTerminal>();

  const fitAddon = new FitAddon();

  useEffect(() => {
    const term = new xTerminal({
      fontSize: 12,
      bellStyle: 'sound',
      cursorBlink: true,
      theme: darkMode
        ? {
            foreground: '#d8dee9',
            background: '#2e3440',
            cursor: '#d8dee9',
            selection: '#434c5ecc',
            black: '#3b4251',
            red: '#bf6069',
            green: '#a3be8b',
            yellow: '#eacb8a',
            blue: '#81a1c1',
            magenta: '#b48dac',
            cyan: '#88c0d0',
            white: '#e5e9f0',
            brightBlack: '#4c556a',
            brightRed: '#bf6069',
            brightGreen: '#a3be8b',
            brightYellow: '#eacb8a',
            brightBlue: '#81a1c1',
            brightMagenta: '#b48dac',
            brightCyan: '#8fbcbb',
            brightWhite: '#eceef4',
          }
        : {
            foreground: '#000000',
            background: '#ffffff',
            cursor: '#000000',
            selection: '#b5d5ff',
            black: '#4f4f4f',
            red: '#a91b1b',
            green: '#00a237',
            yellow: '#f9f0d1',
            blue: '#00529b',
            magenta: '#ef61a2',
            cyan: '#98d9ef',
            white: '#feffff',
            brightBlack: '#797979',
            brightRed: '#e62000',
            brightGreen: '#96dab1',
            brightYellow: '#f4d600',
            brightBlue: '#3981c6',
            brightMagenta: '#ffb3ae',
            brightCyan: '#00f9fe',
            brightWhite: '#feffff',
          },
    });
    setXterm(term);
    // eslint-disable-next-line react-hooks/exhaustive-deps
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
