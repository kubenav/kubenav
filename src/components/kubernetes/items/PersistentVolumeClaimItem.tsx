import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1PersistentVolumeClaim } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface IPersistentVolumeClaimItemProps extends RouteComponentProps {
  item: V1PersistentVolumeClaim;
  section: string;
  type: string;
}

const PersistentVolumeClaimItem: React.FunctionComponent<IPersistentVolumeClaimItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}{item.status ? ` | Phase: ${item.status.phase}` : ''}{item.status && item.status.capacity ? ` | Capacity: ${item.status.capacity.storage}` : ''}</p>
      </IonLabel>
    </IonItem>
  )
};

export default PersistentVolumeClaimItem;
