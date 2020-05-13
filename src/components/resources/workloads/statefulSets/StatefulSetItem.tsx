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

const StatefulSetItem: React.FunctionComponent<IStatefulSetItemProps> = ({ item, section, type }) => {
  // The stateful set status is set to success when the number of desired replicas is equal to the number of ready
  // replicas and updated replicas. When the update strategy is not OnDelete we also use the number of current replicas
  // to set the status. If the spec and status field is missing there must be an other error and we set the status to
  // warning.
  let status = 'danger';

  if (item.spec && item.status) {
    if (item.spec.updateStrategy && item.spec.updateStrategy.type && item.spec.updateStrategy.type === 'OnDelete') {
      if (item.status.replicas === (item.status.readyReplicas && item.status.updatedReplicas)) {
        status = 'success';
      }
    } else {
      if (
        item.status.replicas ===
        (item.status.currentReplicas && item.status.readyReplicas && item.status.updatedReplicas)
      ) {
        status = 'success';
      }
    }
  } else {
    status = 'warning';
  }

  //updateStrategy:
  //type: OnDelete

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
      <ItemStatus status={status} />
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
