import { IonButton, IonCard, IonCardContent, IonCardHeader, IonCardTitle } from '@ionic/react';
import React from 'react';

import { IClusters } from '../../declarations';

interface ILoadingErrorCard {
  cluster?: string;
  clusters?: IClusters;
  error: Error | null;
  icon: string;
  text: string;
}

const LoadingErrorCard: React.FunctionComponent<ILoadingErrorCard> = ({
  cluster,
  clusters,
  error,
  icon,
  text,
}: ILoadingErrorCard) => {
  return (
    <IonCard style={{ textAlign: 'center' }}>
      <img className="image-margin-top" alt={text} src={icon} style={{ width: '128px', margin: 'auto' }} />
      <IonCardHeader>
        <IonCardTitle>{text}</IonCardTitle>
      </IonCardHeader>
      {!clusters ? (
        <IonCardContent>
          <p className="paragraph-margin-bottom">
            Welcome to the kubenav app. After you added a cluster you can start the exploration of them within the
            kubenav app. To add a new Kubernetes cluster to the app use the button <b>Add a Cluster</b> or the
            <b> Clusters</b> item from the menu.
          </p>
          <IonButton expand="block" routerLink="/settings/clusters" routerDirection="none">
            Add a Cluster
          </IonButton>
        </IonCardContent>
      ) : null}

      {clusters && !cluster ? (
        <IonCardContent>
          <p className="paragraph-margin-bottom">You have to select an active cluster before you can proceed.</p>
          <IonButton expand="block" routerLink="/settings/clusters" routerDirection="none">
            Select a Cluster
          </IonButton>
        </IonCardContent>
      ) : null}

      {clusters && cluster ? (
        <IonCardContent>
          <p className="paragraph-margin-bottom">{error ? error.message : 'An unknown error occured.'}</p>
        </IonCardContent>
      ) : null}
    </IonCard>
  );
};

export default LoadingErrorCard;
