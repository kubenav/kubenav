import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Namespace } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface INamespaceItemProps extends RouteComponentProps {
  item: V1Namespace;
  section: string;
  type: string;
}

const NamespaceItem: React.FunctionComponent<INamespaceItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
      </IonLabel>
    </IonItem>
  )
};

export default NamespaceItem;
