import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonItemOption,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import * as jsonpatch from 'fast-json-patch';
import { close, create } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useContext, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import Editor from '../../../misc/Editor';

interface IEditItemProps {
  activator: TActivator;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
}

const EditItem: React.FunctionComponent<IEditItemProps> = ({ activator, item, url }: IEditItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [showModal, setShowModal] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [value, setValue] = useState<string>(yaml.safeDump(item));

  const handleSave = async () => {
    try {
      const yamlObj = yaml.safeLoad(value);
      if (yamlObj) {
        const diff = jsonpatch.compare(item, yamlObj);
        await kubernetesRequest(
          'PATCH',
          url,
          JSON.stringify(diff),
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );
        setShowModal(false);
      }
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
          header={`Could not save ${item.metadata ? item.metadata.name : ''}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      {activator === 'item-option' ? (
        <IonItemOption color="primary" onClick={() => setShowModal(true)}>
          <IonIcon slot="start" icon={create} />
          Edit
        </IonItemOption>
      ) : null}

      {activator === 'button' ? (
        <IonButton onClick={() => setShowModal(true)}>
          <IonIcon slot="icon-only" icon={create} />
        </IonButton>
      ) : null}

      {activator === 'item' ? (
        <IonItem button={true} detail={false} onClick={() => setShowModal(true)}>
          <IonIcon slot="end" color="primary" icon={create} />
          <IonLabel>Edit</IonLabel>
        </IonItem>
      ) : null}

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShowModal(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{item.metadata ? item.metadata.name : ''}</IonTitle>
            <IonButtons slot="primary">
              <IonButton onClick={() => handleSave()}>Save</IonButton>
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
