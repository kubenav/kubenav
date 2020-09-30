import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import { list } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { LOG_TAIL_LINES } from '../../../../utils/constants';
import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addLogs } from '../../../plugins/terminal/helpers';

interface ILogsItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const LogsItemActivator: React.FunctionComponent<ILogsItemActivatorProps> = ({
  activator,
  onClick,
}: ILogsItemActivatorProps) => {
  if (activator === 'item') {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={list} />
        <IonLabel>Logs</IonLabel>
      </IonItem>
    );
  } else {
    return null;
  }
};

interface ILogsItemProps {
  show: boolean;
  hide: () => void;
  item: V1Pod;
  url: string;
}

const LogsItem: React.FunctionComponent<ILogsItemProps> = ({ show, hide, item, url }: ILogsItemProps) => {
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
      text: `Last ${LOG_TAIL_LINES} Log Lines`,
      handler: () => {
        addLogs(context, terminalContext, url, container, false, LOG_TAIL_LINES, false);
        setContainer(initialContainer);
      },
    },
    {
      text: 'All Log Lines',
      handler: () => {
        addLogs(context, terminalContext, url, container, false, 0, false);
        setContainer(initialContainer);
      },
    },
    {
      text: `Previous Last ${LOG_TAIL_LINES} Log Lines`,
      handler: () => {
        addLogs(context, terminalContext, url, container, true, LOG_TAIL_LINES, false);
        setContainer(initialContainer);
      },
    },
    {
      text: 'All Previous Log Lines',
      handler: () => {
        addLogs(context, terminalContext, url, container, true, 0, false);
        setContainer(initialContainer);
      },
    },
    {
      text: 'Stream Log Lines',
      handler: () => {
        addLogs(context, terminalContext, url, container, false, LOG_TAIL_LINES, true);
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
        header={container === '' ? 'Select a Container' : 'Select an Option'}
        buttons={container === '' ? containerButtons : optionButtons}
      />
    </React.Fragment>
  );
};

export default LogsItem;
