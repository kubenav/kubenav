import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import { terminal } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addShell } from '../../../terminal/helpers';

interface IShellItemProps {
  activator: TActivator;
  item: V1Pod;
  url: string;
}

const ShellItem: React.FunctionComponent<IShellItemProps> = ({ activator, item, url }: IShellItemProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const [showActionSheet, setShowActionSheet] = useState<boolean>(false);

  const generateButtons = (): ActionSheetButton[] => {
    const buttons: ActionSheetButton[] = [];

    if (item.spec && item.spec.initContainers) {
      for (const container of item.spec.initContainers) {
        buttons.push({
          text: container.name,
          handler: () => {
            addShell(
              context,
              terminalContext,
              url,
              item.metadata && item.metadata.name ? item.metadata.name : '',
              container.name,
            );
          },
        });
      }
    }

    if (item.spec && item.spec.containers) {
      for (const container of item.spec.containers) {
        buttons.push({
          text: container.name,
          handler: () => {
            addShell(
              context,
              terminalContext,
              url,
              item.metadata && item.metadata.name ? item.metadata.name : '',
              container.name,
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
              ? addShell(
                  context,
                  terminalContext,
                  url,
                  item.metadata && item.metadata.name ? item.metadata.name : '',
                  buttons[0].text ? buttons[0].text : '',
                )
              : setShowActionSheet(true)
          }
        >
          <IonIcon slot="end" color="primary" icon={terminal} />
          <IonLabel>Shell</IonLabel>
        </IonItem>
      ) : null}

      <IonActionSheet
        isOpen={showActionSheet}
        onDidDismiss={() => setShowActionSheet(false)}
        header="Select Container"
        buttons={buttons}
      />
    </React.Fragment>
  );
};

export default ShellItem;
