import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonList, IonRow } from '@ionic/react';
import React from 'react';

import MetricsNodeDetails from './MetricsNodeDetails';

interface IMetricsProps {
  name: string;
}

const Metrics: React.FunctionComponent<IMetricsProps> = ({ name }: IMetricsProps) => {
  return (
    <IonRow>
      <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="12">
        <IonCard>
          <IonCardHeader>
            <IonCardTitle>More Metrics</IonCardTitle>
          </IonCardHeader>
          <IonCardContent>
            <IonList>
              <MetricsNodeDetails name={name} />
            </IonList>
          </IonCardContent>
        </IonCard>
      </IonCol>
    </IonRow>
  );
};

export default Metrics;
