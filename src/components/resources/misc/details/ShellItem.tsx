import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import { terminal } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addShell } from '../../../plugins/terminal/helpers';

interface IShellItemProps {
  activator: TActivator;
  item: V1Pod;
  url: string;
}

const ShellItem: React.FunctionComponent<IShellItemProps> = ({ activator, item, url }: IShellItemProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const [showActionSheetContainer, setShowActionSheetContainer] = useState<boolean>(false);
  const [showActionSheetShell, setShowActionSheetShell] = useState<boolean>(false);

  const generateButtons = (): ActionSheetButton[] => {
    const buttons: ActionSheetButton[] = [];

    if (item.spec && item.spec.initContainers) {
      for (const container of item.spec.initContainers) {
        buttons.push({
          text: container.name,
          handler: () => {
            setContainer(container.name);
            setShowActionSheetShell(true);
          },
        });
      }
    }

    if (item.spec && item.spec.containers) {
      for (const container of item.spec.containers) {
        buttons.push({
          text: container.name,
          handler: () => {
            setContainer(container.name);
            setShowActionSheetShell(true);
          },
        });
      }
    }

    return buttons;
  };

  const buttons = generateButtons();
  const [container, setContainer] = useState<string>(
    buttons.length === 1 ? (buttons[0].text ? buttons[0].text : '') : '',
  );

  return (
    <React.Fragment>
      {activator === 'item' ? (
        <IonItem
          button={true}
          detail={false}
          onClick={() => (buttons.length === 1 ? setShowActionSheetShell(true) : setShowActionSheetContainer(true))}
        >
          <IonIcon slot="end" color="primary" icon={terminal} />
          <IonLabel>Shell</IonLabel>
        </IonItem>
      ) : null}

      <IonActionSheet
        isOpen={showActionSheetContainer}
        onDidDismiss={() => setShowActionSheetContainer(false)}
        header="Select a Container"
        buttons={buttons}
      />

      <IonActionSheet
        isOpen={showActionSheetShell}
        onDidDismiss={() => setShowActionSheetShell(false)}
        header="Select a Shell"
        buttons={[
          {
            text: 'bash',
            handler: () => {
              addShell(context, terminalContext, url, container, 'bash');
            },
          },
          {
            text: 'sh',
            handler: () => {
              addShell(context, terminalContext, url, container, 'sh');
            },
          },
          {
            text: 'powershell',
            handler: () => {
              addShell(context, terminalContext, url, container, 'powershell');
            },
          },
          {
            text: 'cmd',
            handler: () => {
              addShell(context, terminalContext, url, container, 'cmd');
            },
          },
        ]}
      />
    </React.Fragment>
  );
};

export default ShellItem;
