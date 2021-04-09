import { IonButton, IonButtons, IonContent, IonHeader, IonIcon, IonModal, IonTitle, IonToolbar } from '@ionic/react';
import { add, close } from 'ionicons/icons';
import React, { useState } from 'react';

import { TActivator } from '../../../declarations';
import AWS from './aws/AWS';
import Azure from './azure/Azure';
import DigitalOcean from './digitalocean/DigitalOcean';
import Google from './google/Google';
import Kubeconfig from './kubeconfig/Kubeconfig';
import Manual from './manual/Manual';
import OIDC from './oidc/OIDC';
import Rancher from './rancher/Rancher';

interface IAddCluster {
  activator: TActivator;
}

const AddCluster: React.FunctionComponent<IAddCluster> = ({ activator }: IAddCluster) => {
  const [showModal, setShowModal] = useState<boolean>(false);

  return (
    <React.Fragment>
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
          <Google close={() => setShowModal(false)} />
          <AWS close={() => setShowModal(false)} />
          <Azure close={() => setShowModal(false)} />
          <DigitalOcean close={() => setShowModal(false)} />
          <Rancher close={() => setShowModal(false)} />
          <OIDC close={() => setShowModal(false)} />
          <Kubeconfig />
          <Manual />
        </IonContent>
      </IonModal>

      {activator === 'button' ? (
        <IonButtons slot="primary">
          <IonButton onClick={() => setShowModal(true)}>
            <IonIcon slot="icon-only" icon={add} />
          </IonButton>
        </IonButtons>
      ) : (
        <IonButton expand="block" onClick={() => setShowModal(true)}>
          Add a Cluster
        </IonButton>
      )}
    </React.Fragment>
  );
};

export default AddCluster;
