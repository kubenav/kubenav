import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1PersistentVolumeClaim } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface IPersistentVolumeClaimItemProps extends RouteComponentProps {
  item: V1PersistentVolumeClaim;
  section: string;
  type: string;
}

const PersistentVolumeClaimItem: React.FunctionComponent<IPersistentVolumeClaimItemProps> = ({
 item,
 section,
 type,
}) => {
  // - Phase: The current phase of PersistentVolumeClaim.
  // - Capacity: The actual resources of the underlying volume.
  // - Access Modes: The actual access modes the volume backing the PVC has.
  // - Age: The time when the pvc was created.
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Phase: {item.status ? item.status.phase : '-'}
          {item.status && item.status.capacity ? ` | Capacity: ${item.status.capacity.storage}` : ''}
          {item.status && item.status.accessModes ? ` | Access Modes: ${item.status.accessModes.join(', ')}` : ''}
          {item.metadata && item.metadata.creationTimestamp ? ` | Age: ${timeDifference(new Date().getTime(), new Date(item.metadata.creationTimestamp.toString()).getTime())}` : ''}
        </p>
      </IonLabel>
    </IonItem>
  )
};

export default PersistentVolumeClaimItem;
