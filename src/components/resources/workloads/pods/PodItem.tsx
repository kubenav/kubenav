import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node'
import React, {useContext, useEffect, useState} from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext, IPodMetrics } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';
import { getReady, getResources, getRestarts, getStatus } from './podHelpers';

interface IPodItemProps extends RouteComponentProps {
  item: V1Pod;
  section: string;
  type: string;
}

const PodItem: React.FunctionComponent<IPodItemProps> = ({ item, section, type }) => {
  const context = useContext<IContext>(AppContext);

  const [metrics, setMetrics] = useState<IPodMetrics>();

  useEffect(() => {
    if (item.metadata && item.metadata.namespace && item.metadata.name) {
      (async() => {
        try {
          const data: IPodMetrics = await context.request('GET', `/apis/metrics.k8s.io/v1beta1/namespaces/${item.metadata!.namespace}/pods/${item.metadata!.name}`, '');
          setMetrics(data)
        } catch (err) {
          // TODO: Implement error handling.
        }
      })();
    }

    return () => {};
  }, [item, type]); /* eslint-disable-line */

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
  // - Resources: Show the requests and limits for CPU and Memory.
  // - Age: The time when the pod was created.
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <ItemStatus status={status} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Ready: {getReady(item)} | Restarts: {getRestarts(item)} | Status: {podStatus}
          {item.spec && item.spec.initContainers && item.spec.containers ? ` | ${getResources(item.spec.initContainers.concat(item.spec.containers), metrics)}` : item.spec && item.spec.containers ? ` | ${getResources(item.spec.containers, metrics)}` : ''}
          {item.metadata && item.metadata.creationTimestamp ? ` | Age: ${timeDifference(new Date().getTime(), new Date(item.metadata.creationTimestamp.toString()).getTime())}` : ''}
        </p>
      </IonLabel>
    </IonItem>
  )
};

export default PodItem;
