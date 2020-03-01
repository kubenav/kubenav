import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
} from '@ionic/react';
import React from 'react';

const Manual: React.FunctionComponent = () => {
  return (
    <IonCard>
      <img alt="GCP" src="/assets/card-header-kubernetes.png" />
      <IonCardHeader>
        <IonCardTitle>Manual Configuration</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">
          Choose this option to add a cluster manually. You have to provide a name, the server and a certificate.
          You can choose between username and password, token or a client certificate and key for the authentication.
        </p>
        <IonButton expand="block" href="/settings/clusters/manual">Add a Cluster</IonButton>
      </IonCardContent>
    </IonCard>
  );
};

export default Manual;
