import {
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonList,
} from '@ionic/react';
import { V1Toleration } from '@kubernetes/client-node';
import React from 'react';

import IonCardEqualHeight from '../misc/IonCardEqualHeight';

interface TolerationProps {
  tolerations: V1Toleration[];
}

const Tolerations: React.FunctionComponent<TolerationProps> = ({ tolerations }) => {
  return (
    <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>Taints and Tolerations</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          <IonList>
            {tolerations.filter((toleration) => !!toleration.key).map((toleration, index) => <IonItem key={index}>
              <IonLabel class="ion-text-wrap">
                <h2>Schedule on nodes with {toleration.key}{toleration.effect ? `: ${toleration.effect} taint.`: '.'} {toleration.tolerationSeconds ? `Evict after ${toleration.tolerationSeconds} seconds.` : ''}</h2>
              </IonLabel>
            </IonItem>)}
          </IonList>
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  )
};

export default Tolerations;
