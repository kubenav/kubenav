import { IonItem, IonLabel } from '@ionic/react';
import { V1StorageClass } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface IStorageClassItemProps extends RouteComponentProps {
  item: V1StorageClass;
  section: string;
  type: string;
}

const StorageClassItem: React.FunctionComponent<IStorageClassItemProps> = ({
  item,
  section,
  type,
}: IStorageClassItemProps) => {
  // - Provisioner: Indicates the type of the provisioner.
  // - Reclaim Policy: Dynamically provisioned PersistentVolumes of this storage class are created with this reclaimPolicy.
  // - Volume Binding Mode: Indicates how PersistentVolumeClaims should be provisioned and bound.
  // - Allow Volume Expansion: Shows whether the storage class allow volume expand
  // - Age: The time when the service was created.
  return (
    <IonItem
      routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${
        item.metadata ? item.metadata.name : ''
      }`}
      routerDirection="forward"
    >
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          {item.provisioner ? `Provisioner:  ${item.provisioner}` : 'Provisioner: -'}
          {item.reclaimPolicy ? ` | Reclaim Policy: ${item.reclaimPolicy}` : ''}
          {item.volumeBindingMode ? ` | Volume Binding Mode: ${item.volumeBindingMode}` : ''}
          {item.allowVolumeExpansion ? ` | Allow Volume Expansion: ${item.allowVolumeExpansion}` : ''}
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

export default StorageClassItem;
