import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1Role } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import List from '../../misc/list/List';
import Metadata from '../../misc/template/Metadata';
import Rules from '../misc/Rules';

interface IRoleDetailsProps extends RouteComponentProps {
  item: V1Role;
  section: string;
  type: string;
}

const RoleDetails: React.FunctionComponent<IRoleDetailsProps> = ({ item, type }: IRoleDetailsProps) => {
  return (
    <IonGrid>
      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.rules ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Rules</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <Rules rules={item.rules} />
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace={item.metadata.namespace}
            parent={item}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default RoleDetails;
