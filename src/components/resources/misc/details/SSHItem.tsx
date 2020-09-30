import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Node } from '@kubernetes/client-node';
import { terminal } from 'ionicons/icons';
import React, { useContext } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addSSH } from '../../../plugins/terminal/helpers';

const generateButtons = (item: V1Node, context: IContext, terminalContext: ITerminalContext): ActionSheetButton[] => {
  const buttons: ActionSheetButton[] = [];

  if (item.status && item.status.addresses) {
    for (const address of item.status.addresses) {
      buttons.push({
        text: address.address,
        handler: () => {
          addSSH(
            context,
            terminalContext,
            item.metadata && item.metadata.name ? item.metadata.name : '',
            address.address,
          );
        },
      });
    }
  }

  return buttons;
};

interface ISSHItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
  item: V1Node;
}

export const SSHItemActivator: React.FunctionComponent<ISSHItemActivatorProps> = ({
  activator,
  onClick,
  item,
}: ISSHItemActivatorProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const buttons = generateButtons(item, context, terminalContext);

  if (activator === 'item') {
    return (
      <IonItem
        button={true}
        detail={false}
        onClick={() =>
          buttons.length === 1
            ? addSSH(
                context,
                terminalContext,
                item.metadata && item.metadata.name ? item.metadata.name : '',
                buttons[0].text ? buttons[0].text : '',
              )
            : onClick()
        }
      >
        <IonIcon slot="end" color="primary" icon={terminal} />
        <IonLabel>SSH</IonLabel>
      </IonItem>
    );
  } else {
    return null;
  }
};

interface ISSHItemProps {
  show: boolean;
  hide: () => void;
  item: V1Node;
}

const SSHItem: React.FunctionComponent<ISSHItemProps> = ({ show, hide, item }: ISSHItemProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const buttons = generateButtons(item, context, terminalContext);

  return (
    <React.Fragment>
      <IonActionSheet isOpen={show} onDidDismiss={hide} header="Select IP Address" buttons={buttons} />
    </React.Fragment>
  );
};

export default SSHItem;
