import {
  IonAlert,
  IonIcon,
  IonItemOption,
} from '@ionic/react';
import { trash } from 'ionicons/icons';
import React, {useContext, useState} from 'react';

import { AppContext } from '../../context';
import { Context } from '../../declarations';

interface DeleteItemProps {
  item: any;
  url: string;
}

const DeleteItem: React.FunctionComponent<DeleteItemProps> = ({ item, url }) => {
  const context = useContext<Context>(AppContext);

  const [showAlert, setShowAlert] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const handleDelete = async () => {
    try {
      await context.request('DELETE', url, '');
    } catch (err) {
      setError(err);
    }
  };

  return (
    <React.Fragment>
      <IonItemOption color="danger" onClick={() => setShowAlert(true)}>
        <IonIcon slot="start" icon={trash} />
        Delete
      </IonItemOption>

      {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header={`Could not delete ${item.metadata ? item.metadata.name : ''}`} message={error} buttons={['OK']} /> : null}

      <IonAlert
        isOpen={showAlert}
        onDidDismiss={() => setShowAlert(false)}
        header={item.metadata ? item.metadata.name : ''}
        message={`Do you really want to delete ${item.metadata && item.metadata.namespace ? `${item.metadata.namespace}/` : ''}${item.metadata ? item.metadata.name : ''}?`}
        buttons={[
          { text: 'Cancel', role: 'cancel', handler: () => setShowAlert(false) },
          { text: 'Delete', cssClass: 'delete-button', handler: () => handleDelete() },
        ]}
      />
    </React.Fragment>
  );
};

export default DeleteItem;
