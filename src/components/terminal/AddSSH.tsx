import { IonButton, IonIcon, IonItemOption } from '@ionic/react';
import { terminal } from 'ionicons/icons';
import React, { useContext } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../declarations';
import { AppContext } from '../../utils/context';
import { TerminalContext } from '../../utils/terminal';
import { addSSH } from './helpers';

interface IAddShellProps {
  activator: TActivator;
  node: string;
  ip: string;
}

const AddShell: React.FunctionComponent<IAddShellProps> = ({ activator, node, ip }: IAddShellProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  if (activator === 'item-option') {
    return (
      <IonItemOption color="primary" onClick={() => addSSH(context, terminalContext, node, ip)}>
        <IonIcon slot="start" icon={terminal} />
        SSH
      </IonItemOption>
    );
  } else {
    return (
      <IonButton
        fill="outline"
        slot="end"
        onClick={(e) => {
          e.stopPropagation();
          addSSH(context, terminalContext, node, ip);
        }}
      >
        <IonIcon slot="start" icon={terminal} />
        SSH
      </IonButton>
    );
  }
};

export default AddShell;
