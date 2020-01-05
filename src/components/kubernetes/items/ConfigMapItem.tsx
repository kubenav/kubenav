import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1ConfigMap } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface ConfigMapItemProps extends RouteComponentProps {
  item: V1ConfigMap;
  section: string;
  type: string;
}

const ConfigMapItem: React.FunctionComponent<ConfigMapItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}</p>
      </IonLabel>
    </IonItem>
  )
};

export default ConfigMapItem;
