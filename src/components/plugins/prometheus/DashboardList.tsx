import { IonCard, IonCardContent, IonCol, IonList, IonRow } from '@ionic/react';
import React, { ReactElement } from 'react';

interface IDashboardListProps {
  children: ReactElement | ReactElement[] | (ReactElement | ReactElement[])[];
}

const DashboardList: React.FunctionComponent<IDashboardListProps> = ({ children }: IDashboardListProps) => {
  return (
    <IonRow>
      <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="12">
        <IonCard>
          <IonCardContent>
            <IonList>{children}</IonList>
          </IonCardContent>
        </IonCard>
      </IonCol>
    </IonRow>
  );
};

export default DashboardList;
