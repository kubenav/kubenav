import { IonAlert, IonButton, IonIcon, IonItem, IonItemOption, IonLabel } from '@ionic/react';
import { V1Deployment, V1StatefulSet, V1ReplicaSet, V1ReplicationController } from '@kubernetes/client-node';
import { copy } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

interface IScaleItemProps {
  activator: TActivator;
  item: V1Deployment | V1StatefulSet | V1ReplicaSet | V1ReplicationController;
  url: string;
}

const ScaleItem: React.FunctionComponent<IScaleItemProps> = ({ activator, item, url }: IScaleItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [showAlert, setShowAlert] = useState<boolean>(false);
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
      {activator === 'item-option' ? (
        <IonItemOption color="danger" onClick={() => setShowAlert(true)}>
          <IonIcon slot="start" icon={copy} />
          Scale
        </IonItemOption>
      ) : null}

      {activator === 'button' ? (
        <IonButton onClick={() => setShowAlert(true)}>
          <IonIcon slot="icon-only" icon={copy} />
        </IonButton>
      ) : null}

      {activator === 'item' ? (
        <IonItem button={true} detail={false} onClick={() => setShowAlert(true)}>
          <IonIcon slot="end" color="primary" icon={copy} />
          <IonLabel>Scale</IonLabel>
        </IonItem>
      ) : null}

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
        isOpen={showAlert}
        onDidDismiss={() => setShowAlert(false)}
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
          { text: 'Cancel', role: 'cancel', handler: () => setShowAlert(false) },
          { text: 'Scale', handler: (data) => handleScale(data.replicas ? data.replicas : 0) },
        ]}
      />
    </React.Fragment>
  );
};

export default ScaleItem;
