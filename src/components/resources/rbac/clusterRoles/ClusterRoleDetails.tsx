import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1ClusterRole } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import List from '../../misc/list/List';
import Metadata from '../../misc/template/Metadata';
import Rules from '../misc/Rules';

interface IClusterRoleDetailsProps extends RouteComponentProps {
  item: V1ClusterRole;
  section: string;
  type: string;
}

const ClusterRoleDetails: React.FunctionComponent<IClusterRoleDetailsProps> = ({
  item,
  type,
}: IClusterRoleDetailsProps) => {
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

      {item.metadata && item.metadata.name ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace=""
            parent={item}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default ClusterRoleDetails;
