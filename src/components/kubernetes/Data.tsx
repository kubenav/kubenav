import {
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
import { close } from 'ionicons/icons';
import React, { useState } from 'react';

import Editor from '../misc/Editor';

interface IDataProps {
  name: string;
  data: string;
}

const Data: React.FunctionComponent<IDataProps> = ({ name, data }) => {
  const [showModal, setShowModal] = useState(false);

  return (
    <React.Fragment>
      <IonItem onClick={() => setShowModal(true)}>
        <IonLabel>
          <h2>{name}</h2>
        </IonLabel>
      </IonItem>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start" onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
            </IonButtons>
            <IonTitle>{name}</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Editor readOnly={true} value={data} fullHeight={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  )
};

export default Data;
