import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { add, close } from 'ionicons/icons';
import React, { useState } from 'react';

import AWS from './clusters/AWS';
import Google from './clusters/Google';
import Kubeconfig from './clusters/Kubeconfig';
import Manual from './clusters/Manual';

const AddCluster: React.FunctionComponent = () => {
  const [showModal, setShowModal] = useState<boolean>(false);

  return (
    <IonButtons slot="primary">
      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShowModal(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>Add Clusters</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Google />
          <AWS />
          <Kubeconfig />
          <Manual />
        </IonContent>
      </IonModal>
      <IonButton onClick={() => setShowModal(true)}>
        <IonIcon slot="icon-only" icon={add} />
      </IonButton>
    </IonButtons>
  );
};

export default AddCluster;
