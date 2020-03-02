import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { V1Volume } from '@kubernetes/client-node';
import { close } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, {useState} from 'react';

import Editor from '../../../../misc/Editor';

interface IVolumeProps {
  volume: V1Volume;
}

const Volume: React.FunctionComponent<IVolumeProps> = ({ volume }) => {
  const [showModal, setShowModal] = useState(false);

  let kind = '';
  let description = '';

  for (let key of Object.keys(volume)) {
    if (key && key !== 'name') {
      kind = key[0].toUpperCase() + key.slice(1);
      description = volume[key];
      break;
    }
  }

  return (
    <React.Fragment>
      <IonItem button={true} className="cursor-pointer" onClick={() => setShowModal(true)}>
        <IonLabel>
          <h2>{volume.name}</h2>
          <p>{kind}</p>
        </IonLabel>
      </IonItem>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShowModal(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{volume.name}</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Editor readOnly={true} value={yaml.safeDump(description)} fullHeight={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  )
};

export default Volume;
