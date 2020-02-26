import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
} from '@ionic/react';
import React from 'react';

const Kubeconfig: React.FunctionComponent = () => {
  return (
    <IonCard>
      <img alt="GCP" src="/assets/card-header-kubernetes.png" />
      <IonCardHeader>
        <IonCardTitle>Import Kubeconfig</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">
          Choose this option to add clusters via Kubeconfig.
        </p>
        <p className="paragraph-margin-bottom">
          <b>Attention:</b> This only works if your Kubeconfig file contains the certificate in the
          <code>certificate-authority-data</code> field. If you only have a field <code>certificate-authority</code>
          with the path to the certificate this does not work.
        </p>
        <IonButton expand="block" href="/settings/clusters/kubeconfig">Import Kubeconfig</IonButton>
      </IonCardContent>
    </IonCard>
  );
};

export default Kubeconfig;
