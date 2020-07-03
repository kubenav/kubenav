import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Node } from '@kubernetes/client-node';
import { terminal } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addSSH } from '../../../terminal/helpers';

interface ISSHItemProps {
  activator: TActivator;
  item: V1Node;
}

const SSHItem: React.FunctionComponent<ISSHItemProps> = ({ activator, item }: ISSHItemProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const [showActionSheet, setShowActionSheet] = useState<boolean>(false);

  const generateButtons = (): ActionSheetButton[] => {
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

  const buttons = generateButtons();

  return (
    <React.Fragment>
      {activator === 'item' ? (
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
              : setShowActionSheet(true)
          }
        >
          <IonIcon slot="end" color="primary" icon={terminal} />
          <IonLabel>SSH</IonLabel>
        </IonItem>
      ) : null}

      <IonActionSheet
        isOpen={showActionSheet}
        onDidDismiss={() => setShowActionSheet(false)}
        header="Select IP Address"
        buttons={buttons}
      />
    </React.Fragment>
  );
};

export default SSHItem;
