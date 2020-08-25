import { IonButton, IonIcon, IonItemOption } from '@ionic/react';
import { terminal } from 'ionicons/icons';
import React, { useContext } from 'react';

import { IContext, ITerminalContext, TActivator } from '../../declarations';
import { AppContext } from '../../utils/context';
import { TerminalContext } from '../../utils/terminal';
import { addShell } from './helpers';

interface IAddShellProps {
  activator: TActivator;
  namespace: string;
  pod: string;
  container: string;
}

const AddShell: React.FunctionComponent<IAddShellProps> = ({
  activator,
  namespace,
  pod,
  container,
}: IAddShellProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  if (activator === 'item-option') {
    return (
      <IonItemOption
        color="primary"
        onClick={() =>
          addShell(context, terminalContext, `/api/v1/namespaces/${namespace}/pods/${pod}`, pod, container)
        }
      >
        <IonIcon slot="start" icon={terminal} />
        Term
      </IonItemOption>
    );
  } else {
    return (
      <IonButton
        fill="outline"
        slot="end"
        onClick={(e) => {
          e.stopPropagation();
          addShell(context, terminalContext, `/api/v1/namespaces/${namespace}/pods/${pod}`, pod, container);
        }}
      >
        <IonIcon slot="start" icon={terminal} />
        Term
      </IonButton>
    );
  }
};

export default AddShell;
