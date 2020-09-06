import { IonItem, IonLabel } from '@ionic/react';
import { V1PersistentVolume } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IPersistentVolumeItemProps extends RouteComponentProps {
  item: V1PersistentVolume;
  section: string;
  type: string;
}

const PersistentVolumeItem: React.FunctionComponent<IPersistentVolumeItemProps> = ({
  item,
  section,
  type,
}: IPersistentVolumeItemProps) => {
  const status = (): string => {
    if (item.status === undefined || item.status.phase === 'Released' || item.status.phase === 'Available') {
      return 'warning';
    }

    if (item.status.phase === 'Failed') {
      return 'danger';
    }

    return 'success';
  };

  // - Phase: Indicates if a volume is available, bound to a claim, or released by a claim.
  // - Capacity: Resources of the volume.
  // - Access Modes: Contains all ways the volume can be mounted.
  // - Reclaim Policy: What happens to a persistent volume when released from its claim.
  // - Age: The time when the pv was created.
  return (
    <IonItem
      routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${
        item.metadata ? item.metadata.name : ''
      }`}
      routerDirection="forward"
    >
      <ItemStatus status={status()} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Phase: {item.status && item.status.phase ? item.status.phase : '-'}
          {item.spec && item.spec.capacity ? ` | Capacity: ${item.spec.capacity.storage}` : ''}
          {item.spec && item.spec.accessModes ? ` | Access Modes: ${item.spec.accessModes.join(', ')}` : ''}
          {item.spec && item.spec.persistentVolumeReclaimPolicy
            ? ` | Reclaim Policy: ${item.spec.persistentVolumeReclaimPolicy}`
            : ''}
          {item.metadata && item.metadata.creationTimestamp
            ? ` | Age: ${timeDifference(
                new Date().getTime(),
                new Date(item.metadata.creationTimestamp.toString()).getTime(),
              )}`
            : ''}
        </p>
      </IonLabel>
    </IonItem>
  );
};

export default PersistentVolumeItem;
