import React from 'react';

import { ITerminal } from '../../declarations';
import Editor from '../misc/Editor';

interface ILogsProps {
  terminal: ITerminal;
}

const Logs: React.FunctionComponent<ILogsProps> = ({ terminal }: ILogsProps) => {
  return (
    <Editor
      readOnly={true}
      mode="text"
      value={terminal.logs ? terminal.logs : ''}
      fullHeight={true}
      scrollToBottomButton={true}
    />
  );
};

export default Logs;
