import {
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonList,
} from '@ionic/react';
import { V1Volume } from '@kubernetes/client-node';
import React from 'react';

import IonCardEqualHeight from '../misc/IonCardEqualHeight';
import Volume from './Volume';

interface VolumesProps {
  volumes: V1Volume[];
}

const Volumes: React.FunctionComponent<VolumesProps> = ({ volumes }) => {
  return (
    <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>Volumes</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          <IonList>
            {volumes.map((volume, index) => <Volume key={index} volume={volume} />)}
          </IonList>
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  )
};

export default Volumes;
