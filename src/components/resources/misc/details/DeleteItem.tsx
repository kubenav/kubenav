import { IonAlert, IonButton, IonIcon, IonItem, IonItemOption, IonLabel } from '@ionic/react';
import { trash } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

interface IDeleteItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const DeleteItemActivator: React.FunctionComponent<IDeleteItemActivatorProps> = ({
  activator,
  onClick,
}: IDeleteItemActivatorProps) => {
  if (activator === 'item-option') {
    return (
      <IonItemOption color="danger" onClick={onClick}>
        <IonIcon slot="start" icon={trash} />
        Delete
      </IonItemOption>
    );
  } else if (activator === 'button') {
    return (
      <IonButton onClick={onClick}>
        <IonIcon slot="icon-only" icon={trash} />
      </IonButton>
    );
  } else {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={trash} />
        <IonLabel>Delete</IonLabel>
      </IonItem>
    );
  }
};

interface IDeleteItemProps {
  show: boolean;
  hide: () => void;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
  closeAction?: () => void;
}

const DeleteItem: React.FunctionComponent<IDeleteItemProps> = ({ show, hide, item, url }: IDeleteItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');

  const handleDelete = async () => {
    try {
      await kubernetesRequest('DELETE', url, '', context.settings, await context.kubernetesAuthWrapper(''));
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
          header={`Could not delete ${item.metadata ? item.metadata.name : ''}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonAlert
        isOpen={show}
        onDidDismiss={hide}
        header={item.metadata ? item.metadata.name : ''}
        message={`Do you really want to delete ${
          item.metadata && item.metadata.namespace ? `${item.metadata.namespace}/` : ''
        }${item.metadata ? item.metadata.name : ''}?`}
        buttons={[
          { text: 'Cancel', role: 'cancel', handler: hide },
          { text: 'Delete', cssClass: 'delete-button', handler: () => handleDelete() },
        ]}
      />
    </React.Fragment>
  );
};

export default DeleteItem;
