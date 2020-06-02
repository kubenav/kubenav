import { IonCard, IonCardContent, IonCardHeader, IonCardTitle } from '@ionic/react';
import React from 'react';

interface IErrorCard {
  error?: Error;
  icon: string;
  text: string;
}

const ErrorCard: React.FunctionComponent<IErrorCard> = ({ error, icon, text }: IErrorCard) => {
  return (
    <IonCard style={{ textAlign: 'center' }}>
      <img className="image-margin-top" alt={text} src={icon} style={{ width: '128px', margin: 'auto' }} />
      <IonCardHeader>
        <IonCardTitle>{text}</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">{error ? error.message : 'An unknown error occured.'}</p>
      </IonCardContent>
    </IonCard>
  );
};

export default ErrorCard;
