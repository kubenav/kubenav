import { ActionSheetButton, IonActionSheet, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import { list } from 'ionicons/icons';
import React, { useContext, useState } from 'react';
import { Terminal } from 'xterm';

import { LOG_TAIL_LINES, LOG_TERMINAL_OPTIONS } from '../../../../utils/constants';
import { IContext, ITerminalContext, TActivator } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { TerminalContext } from '../../../../utils/terminal';

interface IRestartItemProps {
  activator: TActivator;
  item: V1Pod;
  url: string;
}

const RestartItem: React.FunctionComponent<IRestartItemProps> = ({ activator, item, url }: IRestartItemProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const [showActionSheet, setShowActionSheet] = useState<boolean>(false);

  const getLogs = async (container: string) => {
    const term = new Terminal(LOG_TERMINAL_OPTIONS(context.settings.darkMode));

    try {
      const parameters = `container=${container}&tailLines=${LOG_TAIL_LINES}`;

      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const data: any = await context.request('GET', `${url}/log?${parameters}`, '');

      term.write(`${typeof data === 'string' ? data : JSON.stringify(data)}\n\r`);
    } catch (err) {
      term.write(`${err.message}\n\r`);
    }

    terminalContext.add({
      name: container,
      shell: term,
    });
  };

  const buttons = () => {
    const buttons: ActionSheetButton[] = [];

    if (item.spec && item.spec.initContainers) {
      for (const container of item.spec.initContainers) {
        buttons.push({
          text: container.name,
          handler: () => {
            getLogs(container.name);
          },
        });
      }
    }

    if (item.spec && item.spec.containers) {
      for (const container of item.spec.containers) {
        buttons.push({
          text: container.name,
          handler: () => {
            getLogs(container.name);
          },
        });
      }
    }

    return buttons;
  };

  return (
    <React.Fragment>
      {activator === 'item' ? (
        <IonItem button={true} detail={false} onClick={() => setShowActionSheet(true)}>
          <IonIcon slot="end" color="primary" icon={list} />
          <IonLabel>Logs</IonLabel>
        </IonItem>
      ) : null}

      <IonActionSheet
        isOpen={showActionSheet}
        onDidDismiss={() => setShowActionSheet(false)}
        header="Select Container"
        buttons={buttons()}
      />
    </React.Fragment>
  );
};

export default RestartItem;
