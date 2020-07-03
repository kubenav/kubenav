import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonGrid,
  IonItem,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import { V1ComponentStatus } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Metadata from '../../misc/template/Metadata';

interface IComponentStatusDetailsProps extends RouteComponentProps {
  item: V1ComponentStatus;
  section: string;
  type: string;
}

const ComponentStatusDetails: React.FunctionComponent<IComponentStatusDetailsProps> = ({
  item,
  type,
}: IComponentStatusDetailsProps) => {
  return (
    <IonGrid>
      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.conditions ? (
        <IonRow>
          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Conditions</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {item.conditions.map((condition, index) => (
                    <IonItem key={index}>
                      <IonLabel class="ion-text-wrap">
                        <h2>
                          {condition.status !== 'True' && condition.status !== 'Healthy' ? 'Unhealthy' : 'Healthy'}
                        </h2>
                        <p>
                          {condition.message}
                          {condition.error ? ` | Error: ${condition.error}` : ''}
                        </p>
                      </IonLabel>
                    </IonItem>
                  ))}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default ComponentStatusDetails;
