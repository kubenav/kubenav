import { IonItem, IonLabel } from '@ionic/react';
import { V1ReplicaSet } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IReplicaSetItemProps extends RouteComponentProps {
  item: V1ReplicaSet;
  section: string;
  type: string;
}

const ReplicaSetItem: React.FunctionComponent<IReplicaSetItemProps> = ({
  item,
  section,
  type,
}: IReplicaSetItemProps) => {
  const status = (): string => {
    if (item.spec === undefined || item.status === undefined) {
      return 'warning';
    }

    if (item.spec.replicas === 0) {
      return 'success';
    }

    if (
      item.spec.replicas === item.status.replicas &&
      item.spec.replicas === item.status.readyReplicas &&
      item.spec.replicas === item.status.availableReplicas
    ) {
      return 'success';
    }

    if (
      item.status.readyReplicas === 0 ||
      item.status.availableReplicas === 0 ||
      item.status.readyReplicas === undefined ||
      item.status.availableReplicas === undefined
    ) {
      return 'danger';
    }

    return 'warning';
  };

  // - Desired: Replicas is the number of desired replicas.
  // - Current: Replicas is the most recently observed number of replicas.
  // - Ready: The number of ready replicas for this replica set.
  // - Available: The number of available replicas (ready for at least minReadySeconds) for this replica set.
  // - Age: The time when the replica set was created.
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
          Desired: {item.spec && item.spec.replicas ? item.spec.replicas : '0'}
          {item.status && item.status.replicas ? ` | Current: ${item.status.replicas}` : ' | Current: 0'}
          {item.status && item.status.readyReplicas ? ` | Ready: ${item.status.readyReplicas}` : ' | Ready: 0'}
          {item.status && item.status.availableReplicas
            ? ` | Available: ${item.status.availableReplicas}`
            : ' | Available: 0'}
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

export default ReplicaSetItem;
