import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Role } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface RoleItemProps extends RouteComponentProps {
  item: V1Role;
  section: string;
  type: string;
}

const RoleItem: React.FunctionComponent<RoleItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}</p>
      </IonLabel>
    </IonItem>
  )
};

export default RoleItem;
