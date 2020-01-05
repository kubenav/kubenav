import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Node } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface NodeItemProps extends RouteComponentProps {
  item: V1Node;
  section: string;
  type: string;
}

const NodeItem: React.FunctionComponent<NodeItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
      </IonLabel>
    </IonItem>
  )
};

export default NodeItem;
