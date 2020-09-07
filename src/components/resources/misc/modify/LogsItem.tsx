import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import { list } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { LOG_TAIL_LINES } from '../../../../utils/constants';
import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';
import { addLogs } from '../../../terminal/helpers';

interface ILogsItemProps {
  activator: TActivator;
  item: V1Pod;
  url: string;
}

const LogsItem: React.FunctionComponent<ILogsItemProps> = ({ activator, item, url }: ILogsItemProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const [showActionSheetContainer, setShowActionSheetContainer] = useState<boolean>(false);
  const [showActionSheetOptions, setShowActionSheetOptions] = useState<boolean>(false);

  const generateButtons = (): ActionSheetButton[] => {
    const buttons: ActionSheetButton[] = [];

    if (item.spec && item.spec.initContainers) {
      for (const container of item.spec.initContainers) {
        buttons.push({
          text: container.name,
          handler: () => {
            setContainer(container.name);
            setShowActionSheetOptions(true);
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
            setShowActionSheetOptions(true);
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
          onClick={() => (buttons.length === 1 ? setShowActionSheetOptions(true) : setShowActionSheetContainer(true))}
        >
          <IonIcon slot="end" color="primary" icon={list} />
          <IonLabel>Logs</IonLabel>
        </IonItem>
      ) : null}

      <IonActionSheet
        isOpen={showActionSheetContainer}
        onDidDismiss={() => setShowActionSheetContainer(false)}
        header="Select a Container"
        buttons={buttons}
      />

      <IonActionSheet
        isOpen={showActionSheetOptions}
        onDidDismiss={() => setShowActionSheetOptions(false)}
        header="Select an Option"
        buttons={[
          {
            text: `Last ${LOG_TAIL_LINES} Log Lines`,
            handler: () => {
              addLogs(context, terminalContext, url, container, false, LOG_TAIL_LINES, false);
            },
          },
          {
            text: 'All Log Lines',
            handler: () => {
              addLogs(context, terminalContext, url, container, false, 0, false);
            },
          },
          {
            text: `Previous Last ${LOG_TAIL_LINES} Log Lines`,
            handler: () => {
              addLogs(context, terminalContext, url, container, true, LOG_TAIL_LINES, false);
            },
          },
          {
            text: 'All Previous Log Lines',
            handler: () => {
              addLogs(context, terminalContext, url, container, true, 0, false);
            },
          },
          {
            text: 'Stream Log Lines',
            handler: () => {
              addLogs(context, terminalContext, url, container, false, LOG_TAIL_LINES, true);
            },
          },
        ]}
      />
    </React.Fragment>
  );
};

export default LogsItem;
