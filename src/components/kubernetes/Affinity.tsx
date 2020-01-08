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
import { V1NodeAffinity, V1PodAffinity, V1PodAntiAffinity } from '@kubernetes/client-node'
import { close } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useCallback, useState } from 'react';

import Editor from '../misc/Editor';

interface AffinityProps {
  title: string
  affinity: V1NodeAffinity | V1PodAffinity | V1PodAntiAffinity;
}

const Affinity: React.FunctionComponent<AffinityProps> = ({ title, affinity }) => {
  const [showModal, setShowModal] = useState(false);

  return (
    <React.Fragment>
      <IonItem onClick={() => setShowModal(true)}>
        <IonLabel>
          <h2>{title}</h2>
        </IonLabel>
      </IonItem>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start" onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
            </IonButtons>
            <IonTitle>{title}</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Editor readOnly={true} value={yaml.safeDump(affinity)} fullHeight={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  )
};

export default Affinity;
