import {
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonList,
} from '@ionic/react';
import { V1Affinity } from '@kubernetes/client-node'
import React from 'react';

import IonCardEqualHeight from '../misc/IonCardEqualHeight';
import Affinity from './Affinity';

interface AffinitiesProps {
  affinities: V1Affinity;
}

const Affinities: React.FunctionComponent<AffinitiesProps> = ({ affinities }) => {
  const title = (affinity: string): string => {
    return affinity[0].toUpperCase() + affinity.slice(1);
  };

  return (
    <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>Affinities and Anti-Affinities</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          <IonList>
            {Object.keys(affinities).map((affinity, index) => <Affinity key={index} title={title(affinity)} affinity={affinities[affinity]} />)}
          </IonList>
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  )
};

export default Affinities;
