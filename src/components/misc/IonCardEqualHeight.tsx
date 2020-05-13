import { IonCard, isPlatform } from '@ionic/react';
import React, { ReactElement } from 'react';

interface IIonCardEqualHeight {
  children: ReactElement;
}

const IonCardEqualHeight: React.FunctionComponent<IIonCardEqualHeight> = ({ children }: IIonCardEqualHeight) => {
  return (
    <IonCard className={isPlatform('ios') ? 'ios--card-equal-height' : 'default--card-equal-height'}>
      {children}
    </IonCard>
  );
};

export default IonCardEqualHeight;
