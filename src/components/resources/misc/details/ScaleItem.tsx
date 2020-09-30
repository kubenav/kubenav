import { IonAlert, IonButton, IonIcon, IonItem, IonItemOption, IonLabel } from '@ionic/react';
import { V1Deployment, V1StatefulSet, V1ReplicaSet, V1ReplicationController } from '@kubernetes/client-node';
import { copy } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

interface IScaleItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const ScaleItemActivator: React.FunctionComponent<IScaleItemActivatorProps> = ({
  activator,
  onClick,
}: IScaleItemActivatorProps) => {
  if (activator === 'item-option') {
    return (
      <IonItemOption color="danger" onClick={onClick}>
        <IonIcon slot="start" icon={copy} />
        Scale
      </IonItemOption>
    );
  } else if (activator === 'button') {
    return (
      <IonButton onClick={onClick}>
        <IonIcon slot="icon-only" icon={copy} />
      </IonButton>
    );
  } else {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={copy} />
        <IonLabel>Scale</IonLabel>
      </IonItem>
    );
  }
};

interface IScaleItemProps {
  show: boolean;
  hide: () => void;
  item: V1Deployment | V1StatefulSet | V1ReplicaSet | V1ReplicationController;
  url: string;
}

const ScaleItem: React.FunctionComponent<IScaleItemProps> = ({ show, hide, item, url }: IScaleItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');

  const handleScale = async (replicas: number) => {
    try {
      await kubernetesRequest(
        'PATCH',
        url,
        `[{"op": "replace", "path": "/spec/replicas", "value": ${replicas}}]`,
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
          header={`Could not scale ${item.metadata ? item.metadata.name : ''}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonAlert
        isOpen={show}
        onDidDismiss={hide}
        header={item.metadata ? item.metadata.name : ''}
        message={`Enter a new number of replicas for ${
          item.metadata && item.metadata.namespace ? `${item.metadata.namespace}/` : ''
        }${item.metadata ? item.metadata.name : ''}?`}
        inputs={[
          {
            name: 'replicas',
            type: 'number',
            value: item.spec && item.spec.replicas ? item.spec.replicas : 0,
          },
        ]}
        buttons={[
          { text: 'Cancel', role: 'cancel', handler: hide },
          { text: 'Scale', handler: (data) => handleScale(data.replicas ? data.replicas : 0) },
        ]}
      />
    </React.Fragment>
  );
};

export default ScaleItem;
