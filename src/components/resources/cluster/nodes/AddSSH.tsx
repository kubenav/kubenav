import { IonChip, IonIcon, IonLabel } from '@ionic/react';
import { terminal } from 'ionicons/icons';
import React, { useContext } from 'react';

import { IContext, ITerminalContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addSSH } from '../../../plugins/terminal/helpers';

interface IAddSSHProps {
  type: string;
  node: string;
  ip: string;
}

const AddSSH: React.FunctionComponent<IAddSSHProps> = ({ type, node, ip }: IAddSSHProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  return (
    <IonChip
      className="unset-chip-height"
      onClick={(e) => {
        e.stopPropagation();
        addSSH(context, terminalContext, node, ip);
      }}
    >
      <IonIcon icon={terminal} color="primary" />
      <IonLabel>
        {type}: {ip}
      </IonLabel>
    </IonChip>
  );
};

export default AddSSH;
