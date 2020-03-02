import {
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonGrid,
} from '@ionic/react';
import React from 'react';

import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';

const Status: React.FunctionComponent = ({ children }) => {
  return (
    <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>Status</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          <IonGrid>
            {children}
          </IonGrid>
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  )
};

export default Status;
