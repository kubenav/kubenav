import { IonItem, IonLabel } from '@ionic/react';
import { V1StatefulSet } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IStatefulSetItemProps extends RouteComponentProps {
  item: V1StatefulSet;
  section: string;
  type: string;
}

const StatefulSetItem: React.FunctionComponent<IStatefulSetItemProps> = ({
  item,
  section,
  type,
}: IStatefulSetItemProps) => {
  const status = (): string => {
    if (item.spec === undefined || item.status === undefined || item.spec.replicas === 0) {
      return 'warning';
    }

    if (item.spec.updateStrategy && item.spec.updateStrategy.type && item.spec.updateStrategy.type === 'OnDelete') {
      if (item.status.replicas === item.status.readyReplicas && item.status.replicas === item.status.updatedReplicas) {
        return 'success';
      }
    }

    if (
      item.status.replicas === item.status.currentReplicas &&
      item.status.replicas === item.status.readyReplicas &&
      item.status.replicas === item.status.updatedReplicas
    ) {
      return 'success';
    }

    if (
      item.status.currentReplicas === 0 ||
      item.status.readyReplicas === 0 ||
      item.status.updatedReplicas === 0 ||
      item.status.currentReplicas === undefined ||
      item.status.readyReplicas === undefined ||
      item.status.updatedReplicas === undefined
    ) {
      return 'danger';
    }

    return 'warning';
  };

  // - Desired: Number of Pods created by the stateful set controller.
  // - Current: Number of Pods created by the stateful set controller from the stateful set version indicated by
  //   currentRevision.
  // - Ready: Number of Pods created by the stateful set controller that have a Ready Condition.
  // - Updated: Number of Pods created by the stateful set controller from the stateful set version indicated by
  //   updateRevision.
  // - Age: The time when the stateful set was created.
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
          Desired: {item.status && item.status.replicas ? item.status.replicas : '0'}
          {item.spec &&
          item.spec.updateStrategy &&
          item.spec.updateStrategy.type &&
          item.spec.updateStrategy.type !== 'OnDelete'
            ? item.status && item.status.currentReplicas
              ? ` | Current: ${item.status.currentReplicas}`
              : ' | Current: 0'
            : null}
          {item.status && item.status.readyReplicas ? ` | Ready: ${item.status.readyReplicas}` : ' | Ready: 0'}
          {item.status && item.status.updatedReplicas ? ` | Updated: ${item.status.updatedReplicas}` : ' | Updated: 0'}
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

export default StatefulSetItem;
