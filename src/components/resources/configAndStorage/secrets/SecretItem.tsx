import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Secret } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface ISecretItemProps extends RouteComponentProps {
  item: V1Secret;
  section: string;
  type: string;
}

const SecretItem: React.FunctionComponent<ISecretItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}</p>
      </IonLabel>
    </IonItem>
  )
};

export default SecretItem;
