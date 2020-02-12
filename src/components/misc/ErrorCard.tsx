import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
} from '@ionic/react';
import React from 'react';

interface IErrorCard {
  error: string;
  icon: string;
  text: string;
}

const ErrorCard: React.FunctionComponent<IErrorCard> = ({ error, icon, text }) => {
  return (
    <IonCard style={{textAlign: 'center'}}>
      <img alt={text} src={icon} style={{width: '128px', margin: 'auto'}} />
      <IonCardHeader>
        <IonCardTitle>{text}</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">{error}</p>
      </IonCardContent>
    </IonCard>
  );
};

export default ErrorCard;
