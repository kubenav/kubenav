import { IonItem, IonLabel } from '@ionic/react';
import { V1Role } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface IRoleItemProps extends RouteComponentProps {
  item: V1Role;
  section: string;
  type: string;
}

const RoleItem: React.FunctionComponent<IRoleItemProps> = ({ item, section, type }: IRoleItemProps) => {
  return (
    <IonItem
      routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${
        item.metadata ? item.metadata.name : ''
      }`}
      routerDirection="forward"
    >
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
      </IonLabel>
    </IonItem>
  );
};

export default RoleItem;
