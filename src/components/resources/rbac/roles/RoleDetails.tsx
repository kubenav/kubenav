import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1Role } from '@kubernetes/client-node';
import yaml from 'js-yaml';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Editor from '../../../misc/Editor';
import List from '../../misc/List';
import Metadata from '../../misc/template/Metadata';

interface IRoleDetailsProps extends RouteComponentProps {
  item: V1Role;
  section: string;
  type: string;
}

const RoleDetails: React.FunctionComponent<IRoleDetailsProps> = ({ item, type }) => {
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

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace={item.metadata.namespace}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default RoleDetails;
