import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItemOption,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import * as jsonpatch from 'fast-json-patch';
import { close, create } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useContext, useState } from 'react';

import { AppContext } from '../../context';
import { IContext } from '../../declarations';
import Editor from '../misc/Editor';

interface IEditItemProps {
  item: any;
  url: string;
}

const EditItem: React.FunctionComponent<IEditItemProps> = ({ item, url }) => {
  const context = useContext<IContext>(AppContext);

  const [showModal, setShowModal] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [value, setValue] = useState<string>(yaml.safeDump(item));

  const handleSave = async () => {
    try {
      const diff = jsonpatch.compare(item, yaml.safeLoad(value));
      await context.request('PATCH', url, JSON.stringify(diff));
      setShowModal(false);
    } catch (err) {
      setError(err);
    }
  };

  return (
    <React.Fragment>
      {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header="Could not save" message={error} buttons={['OK']} /> : null}

      <IonItemOption color="primary" onClick={() => setShowModal(true)}>
        <IonIcon slot="start" icon={create} />
        Edit
      </IonItemOption>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start" onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
            </IonButtons>
            <IonTitle>{item.metadata ? item.metadata.name : ''}</IonTitle>
            <IonButtons slot="primary">
              <IonButton onClick={() => handleSave()}>
                Save
              </IonButton>
            </IonButtons>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Editor readOnly={false} value={value} onChange={(newValue) => setValue(newValue)} fullHeight={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default EditItem;
