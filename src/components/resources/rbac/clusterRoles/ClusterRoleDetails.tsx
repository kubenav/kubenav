import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1ClusterRole } from '@kubernetes/client-node';
import yaml from 'js-yaml';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Editor from '../../../misc/Editor';
import List from '../../misc/List';
import Metadata from '../../misc/template/Metadata';

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
                <Editor readOnly={true} value={yaml.safeDump(item.rules)} />
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
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default ClusterRoleDetails;
