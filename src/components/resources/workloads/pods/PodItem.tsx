import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';
import { getReady, getRestarts, getStatus } from './podHelpers';

interface IPodItemProps extends RouteComponentProps {
  item: V1Pod;
  section: string;
  type: string;
}

const PodItem: React.FunctionComponent<IPodItemProps> = ({ item, section, type }) => {
  // Get the status of the pod. If the status is running or completed we set the status to success.  If the pod stuck
  // in the pending state, we set the status to warning. If none of these conditions applies we set the status to error.
  const podStatus = getStatus(item);
  let status = 'danger';

  if (podStatus === 'Pending') {
    status = 'warning';
  }

  if (podStatus === 'Running' || podStatus === 'Completed') {
    status = 'success';
  }

  // - Ready: The number of ready containers and the number of containers in the pod.
  // - Restarts: Number of restarts for the pod, using the sum of restarts for all containers.
  // - Status: Show the status of the pod, using the status of the running containers.
  // - Age: The time when the daemon set was created.
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <ItemStatus status={status} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Ready: {getReady(item)} | Restarts: {getRestarts(item)} | Status: {podStatus}
          {item.metadata && item.metadata.creationTimestamp ? ` | Age: ${timeDifference(new Date().getTime(), new Date(item.metadata.creationTimestamp.toString()).getTime())}` : ''}
        </p>
      </IonLabel>
    </IonItem>
  )
};

export default PodItem;
