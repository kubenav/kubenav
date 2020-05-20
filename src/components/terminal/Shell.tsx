import React, { useRef, useEffect, useState } from 'react';
import { Terminal } from 'xterm';
import { FitAddon } from 'xterm-addon-fit';

import 'xterm/css/xterm.css';

import { ITerminal } from '../../declarations';

interface IShellProps {
  terminal: ITerminal;
}

const Shell: React.FunctionComponent<IShellProps> = ({ terminal }: IShellProps) => {
  const termRef = useRef<HTMLDivElement>(null);
  const [term, setTerm] = useState<Terminal>();

  const fitAddon = new FitAddon();

  useEffect(() => {
    setTerm(terminal.shell);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    return () => {
      window.removeEventListener('resize', updateTerminalSize);
    };
  });

  useEffect(() => {
    const handleTerminalInit = async () => {
      setTimeout(() => {
        if (termRef.current && term) {
          term.loadAddon(fitAddon);
          term.open(termRef.current);
          fitAddon.fit();
          term.focus();

          window.addEventListener('resize', updateTerminalSize);
        }
      }, 1000);
    };

    handleTerminalInit();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [termRef, term]);

  const updateTerminalSize = () => {
    fitAddon.fit();
  };

  return <div className="terminal-container" ref={termRef}></div>;
};

export default Shell;
