import { IonItem, IonLabel } from '@ionic/react';
import { V1DaemonSet } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IDaemonSetItemProps extends RouteComponentProps {
  item: V1DaemonSet;
  section: string;
  type: string;
}

const DaemonSetItem: React.FunctionComponent<IDaemonSetItemProps> = ({ item, section, type }: IDaemonSetItemProps) => {
  const status = (): string => {
    if (item.status === undefined) {
      return 'warning';
    }

    if (item.status.numberMisscheduled > 0) {
      return 'danger';
    }

    if (
      item.status.desiredNumberScheduled === item.status.currentNumberScheduled &&
      item.status.desiredNumberScheduled === item.status.numberReady &&
      item.status.desiredNumberScheduled === item.status.updatedNumberScheduled &&
      item.status.desiredNumberScheduled === item.status.numberAvailable
    ) {
      return 'success';
    }

    if (
      item.status.currentNumberScheduled === 0 ||
      item.status.numberReady === 0 ||
      item.status.updatedNumberScheduled === 0 ||
      item.status.numberAvailable === 0 ||
      item.status.currentNumberScheduled === undefined ||
      item.status.numberReady === undefined ||
      item.status.updatedNumberScheduled === undefined ||
      item.status.numberAvailable === undefined
    ) {
      return 'danger';
    }

    return 'warning';
  };

  // - Desired: The total number of nodes that should be running the daemon pod.
  // - Current: The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod.
  // - Ready: The number of nodes that should be running the daemon pod and have one or more of the daemon pod running
  //   and ready.
  // - Updated: The total number of nodes that are running updated daemon pod.
  // - Available: The number of nodes that should be running the daemon pod and have one or more of the daemon pod
  //   running and available
  // - Age: The time when the daemon set was created.
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
          Desired: {item.status && item.status.desiredNumberScheduled ? item.status.desiredNumberScheduled : '0'}
          {item.status && item.status.currentNumberScheduled
            ? ` | Current: ${item.status.currentNumberScheduled}`
            : ' | Current: 0'}
          {item.status && item.status.numberReady ? ` | Ready: ${item.status.numberReady}` : ' | Ready: 0'}
          {item.status && item.status.updatedNumberScheduled
            ? ` | Updated: ${item.status.updatedNumberScheduled}`
            : ' | Updated: 0'}
          {item.status && item.status.numberAvailable
            ? ` | Available: ${item.status.numberAvailable}`
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

export default DaemonSetItem;
