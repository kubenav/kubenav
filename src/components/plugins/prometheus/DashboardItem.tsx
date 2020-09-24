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
import { close } from 'ionicons/icons';
import React, { useState } from 'react';

import Dashboard, { IDashboardProps } from './Dashboard';

const DashboardItem: React.FunctionComponent<IDashboardProps> = ({ title, variables, charts }: IDashboardProps) => {
  const [showModal, setShowModal] = useState(false);

  return (
    <React.Fragment>
      <IonItem button={true} onClick={() => setShowModal(true)}>
        <IonLabel>
          <h2>{title}</h2>
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
            <IonTitle>{title}</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Dashboard variables={variables} charts={charts} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default DashboardItem;
