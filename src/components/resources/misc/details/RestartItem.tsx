import { IonAlert, IonButton, IonIcon, IonItem, IonItemOption, IonLabel } from '@ionic/react';
import { V1DaemonSet, V1Deployment, V1StatefulSet } from '@kubernetes/client-node';
import * as jsonpatch from 'fast-json-patch';
import { reload } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

interface IRestartItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const RestartItemActivator: React.FunctionComponent<IRestartItemActivatorProps> = ({
  activator,
  onClick,
}: IRestartItemActivatorProps) => {
  if (activator === 'item-option') {
    return (
      <IonItemOption color="danger" onClick={onClick}>
        <IonIcon slot="start" icon={reload} />
        Restart
      </IonItemOption>
    );
  } else if (activator === 'button') {
    return (
      <IonButton onClick={onClick}>
        <IonIcon slot="icon-only" icon={reload} />
      </IonButton>
    );
  } else {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={reload} />
        <IonLabel>Restart</IonLabel>
      </IonItem>
    );
  }
};

interface IRestartItemProps {
  show: boolean;
  hide: () => void;
  item: V1DaemonSet | V1Deployment | V1StatefulSet;
  url: string;
}

const RestartItem: React.FunctionComponent<IRestartItemProps> = ({ show, hide, item, url }: IRestartItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');

  const handleRestart = async () => {
    try {
      const now = new Date();
      const copy = JSON.parse(JSON.stringify(item));

      if (copy.spec && copy.spec.template.metadata) {
        if (copy.spec.template.metadata.annotations) {
          copy.spec.template.metadata.annotations['kubenav.io/restartedAt'] = now.toJSON();
        } else {
          copy.spec.template.metadata.annotations = { 'kubenav.io/restartedAt': now.toJSON() };
        }
      }

      const diff = jsonpatch.compare(item, copy);
      await kubernetesRequest(
        'PATCH',
        url,
        JSON.stringify(diff),
        context.settings,
        await context.kubernetesAuthWrapper(''),
      );
    } catch (err) {
      setError(err);
    }
  };

  return (
    <React.Fragment>
      {error !== '' ? (
        <IonAlert
          isOpen={error !== ''}
          onDidDismiss={() => setError('')}
          header={`Could not restart ${item.metadata ? item.metadata.name : ''}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonAlert
        isOpen={show}
        onDidDismiss={hide}
        header={item.metadata ? item.metadata.name : ''}
        message={`Do you really want to restart ${
          item.metadata && item.metadata.namespace ? `${item.metadata.namespace}/` : ''
        }${item.metadata ? item.metadata.name : ''}?`}
        buttons={[
          { text: 'Cancel', role: 'cancel', handler: hide },
          { text: 'Restart', handler: () => handleRestart() },
        ]}
      />
    </React.Fragment>
  );
};

export default RestartItem;
