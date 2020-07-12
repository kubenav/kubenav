import { IonAlert, IonButton, IonIcon, IonItem, IonItemOption, IonLabel } from '@ionic/react';
import { trash } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

interface IDeleteItemProps {
  activator: TActivator;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
}

const DeleteItem: React.FunctionComponent<IDeleteItemProps> = ({ activator, item, url }: IDeleteItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [showAlert, setShowAlert] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const handleDelete = async () => {
    try {
      await kubernetesRequest('DELETE', url, '', context.settings.timeout, await context.kubernetesAuthWrapper(''));
    } catch (err) {
      setError(err);
    }
  };

  return (
    <React.Fragment>
      {activator === 'item-option' ? (
        <IonItemOption color="danger" onClick={() => setShowAlert(true)}>
          <IonIcon slot="start" icon={trash} />
          Delete
        </IonItemOption>
      ) : null}

      {activator === 'button' ? (
        <IonButton onClick={() => setShowAlert(true)}>
          <IonIcon slot="icon-only" icon={trash} />
        </IonButton>
      ) : null}

      {activator === 'item' ? (
        <IonItem button={true} detail={false} onClick={() => setShowAlert(true)}>
          <IonIcon slot="end" color="primary" icon={trash} />
          <IonLabel>Delete</IonLabel>
        </IonItem>
      ) : null}

      {error !== '' ? (
        <IonAlert
          isOpen={error !== ''}
          onDidDismiss={() => setError('')}
          header={`Could not delete ${item.metadata ? item.metadata.name : ''}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonAlert
        isOpen={showAlert}
        onDidDismiss={() => setShowAlert(false)}
        header={item.metadata ? item.metadata.name : ''}
        message={`Do you really want to delete ${
          item.metadata && item.metadata.namespace ? `${item.metadata.namespace}/` : ''
        }${item.metadata ? item.metadata.name : ''}?`}
        buttons={[
          { text: 'Cancel', role: 'cancel', handler: () => setShowAlert(false) },
          { text: 'Delete', cssClass: 'delete-button', handler: () => handleDelete() },
        ]}
      />
    </React.Fragment>
  );
};

export default DeleteItem;
