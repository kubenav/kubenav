import { IonButton, IonIcon, IonItemOption } from '@ionic/react';
import { terminal } from 'ionicons/icons';
import React, { useContext } from 'react';

import { IContext, ITerminalContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import { TerminalContext } from '../../utils/terminal';

interface IAddTerminalProps {
  namespace: string;
  pod: string;
  container: string;
  mobile: boolean;
}

const AddTerminal: React.FunctionComponent<IAddTerminalProps> = ({
  namespace,
  pod,
  container,
  mobile,
}: IAddTerminalProps) => {
  const context = useContext<IContext>(AppContext);
  const terminalContext = useContext<ITerminalContext>(TerminalContext);

  const add = () => {
    if (context.clusters && context.cluster) {
      terminalContext.add({
        namespace: namespace,
        pod: pod,
        container: container,
        type: 'term',
        cluster: context.clusters[context.cluster],
      });
    }
  };

  if (mobile) {
    return (
      <IonItemOption color="primary" onClick={() => add()}>
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
          add();
        }}
      >
        <IonIcon slot="start" icon={terminal} />
        Term
      </IonButton>
    );
  }
};

export default AddTerminal;
