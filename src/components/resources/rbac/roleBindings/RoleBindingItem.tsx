import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1RoleBinding } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface IRoleBindingItemProps extends RouteComponentProps {
  item: V1RoleBinding;
  section: string;
  type: string;
}

const RoleBindingItem: React.FunctionComponent<IRoleBindingItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}</p>
      </IonLabel>
    </IonItem>
  )
};

export default RoleBindingItem;
