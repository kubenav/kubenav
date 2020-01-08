import {
  IonCard,
  isPlatform,
} from '@ionic/react';
import React from 'react';

const IonCardEqualHeight: React.FunctionComponent = ({ children }) => {
  return (
    <IonCard className={isPlatform('ios') ? 'ios--card-equal-height' : 'default--card-equal-height'}>
      {children}
    </IonCard>
  )
};

export default IonCardEqualHeight;
