import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
} from '@ionic/react';
import React from 'react';

interface ILoadingErrorCard {
  error: string;
  exists: boolean;
  icon: string;
  text: string;
}

const LoadingErrorCard: React.FunctionComponent<ILoadingErrorCard> = ({ error, exists, icon, text }) => {
  return (
    <IonCard style={{textAlign: 'center'}}>
      <img alt={text} src={icon} style={{width: '128px', margin: 'auto'}} />
      <IonCardHeader>
        <IonCardTitle>{text}</IonCardTitle>
      </IonCardHeader>
      {exists ? (
        <IonCardContent>
          <p className="paragraph-margin-bottom">{error}</p>
        </IonCardContent>
      ) : (
        <IonCardContent>
          <p className="paragraph-margin-bottom">
            You have to select an active cluster before you can proceed.
          </p>
          <IonButton expand="block" routerLink="/settings/clusters" routerDirection="none">Select a Cluster</IonButton>
        </IonCardContent>
      )}
    </IonCard>
  );
};

export default LoadingErrorCard;
