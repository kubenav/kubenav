import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import { terminal } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addShell } from '../../../plugins/terminal/helpers';

interface IShellItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const ShellItemActivator: React.FunctionComponent<IShellItemActivatorProps> = ({
  activator,
  onClick,
}: IShellItemActivatorProps) => {
  if (activator === 'item') {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={terminal} />
        <IonLabel>Shell</IonLabel>
      </IonItem>
    );
  } else {
    return null;
  }
};

interface IShellItemProps {
  show: boolean;
  hide: () => void;
  item: V1Pod;
  url: string;
}

const ShellItem: React.FunctionComponent<IShellItemProps> = ({ show, hide, item, url }: IShellItemProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const generateContainerButtons = (): ActionSheetButton[] => {
    const buttons: ActionSheetButton[] = [];

    if (item.spec && item.spec.initContainers) {
      for (const container of item.spec.initContainers) {
        buttons.push({
          text: container.name,
          handler: () => {
            setContainer(container.name);
            return false;
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
            return false;
          },
        });
      }
    }

    return buttons;
  };

  const containerButtons = generateContainerButtons();
  const initialContainer =
    containerButtons.length === 1 ? (containerButtons[0].text ? containerButtons[0].text : '') : '';
  const [container, setContainer] = useState<string>(initialContainer);

  const optionButtons = [
    {
      text: 'bash',
      handler: () => {
        addShell(context, terminalContext, url, container, 'bash');
        setContainer(initialContainer);
      },
    },
    {
      text: 'sh',
      handler: () => {
        addShell(context, terminalContext, url, container, 'sh');
        setContainer(initialContainer);
      },
    },
    {
      text: 'powershell',
      handler: () => {
        addShell(context, terminalContext, url, container, 'powershell');
        setContainer(initialContainer);
      },
    },
    {
      text: 'cmd',
      handler: () => {
        addShell(context, terminalContext, url, container, 'cmd');
        setContainer(initialContainer);
      },
    },
  ];

  return (
    <React.Fragment>
      <IonActionSheet
        isOpen={show}
        onDidDismiss={() => {
          hide();
          setContainer(initialContainer);
        }}
        header={container === '' ? 'Select a Container' : 'Select a Shell'}
        buttons={container === '' ? containerButtons : optionButtons}
      />
    </React.Fragment>
  );
};

export default ShellItem;
