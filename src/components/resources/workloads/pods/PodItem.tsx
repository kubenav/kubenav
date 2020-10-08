import { IonItem, IonLabel } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';
import { getReady, getRestarts, getStatus } from './podHelpers';
import PodItemMetrics from './PodItemMetrics';

interface IPodItemProps extends RouteComponentProps {
  item: V1Pod;
  section: string;
  type: string;
}

const PodItem: React.FunctionComponent<IPodItemProps> = ({ item, section, type }: IPodItemProps) => {
  const context = useContext<IContext>(AppContext);

  const podStatus = getStatus(item);

  const status = (): string => {
    if (podStatus.phase === 'Running' || podStatus.phase === 'Succeeded') {
      return 'success';
    }

    if (podStatus.phase === 'Unknown') {
      return 'warning';
    }

    return 'danger';
  };

  // - Ready: The number of ready containers and the number of containers in the pod.
  // - Restarts: Number of restarts for the pod, using the sum of restarts for all containers.
  // - Status: Show the status of the pod, using the status of the running containers.
  // - Resources: Show the requests and limits for CPU and Memory.
  // - Age: The time when the pod was created.
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
          Ready: {getReady(item)} | Restarts: {getRestarts(item)} | Phase: {podStatus.phase}
          {podStatus.reason ? ` | Reason: ${podStatus.reason}` : ''}
          {context.settings.showPodMetricsInListViews ? <PodItemMetrics item={item} type={type} /> : null}
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

export default PodItem;
