import { IonItem, IonLabel } from '@ionic/react';
import { V1Node } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';
import { useQuery } from 'react-query';

import { IContext, INodeMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { formatResourceValue, timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';
import { getStatus } from './nodeHelpers';

interface INodeItemProps extends RouteComponentProps {
  item: V1Node;
  section: string;
  type: string;
}

const NodeItem: React.FunctionComponent<INodeItemProps> = ({ item, section, type }: INodeItemProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { data } = useQuery<INodeMetrics, Error>(
    ['NodeDetails', cluster ? cluster.id : '', item, type],
    async () =>
      await kubernetesRequest(
        'GET',
        `/apis/metrics.k8s.io/v1beta1/nodes/${item.metadata && item.metadata.name ? item.metadata.name : ''}`,
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    { refetchInterval: context.settings.queryRefetchInterval },
  );

  // Get the node status. Only when the node status is ready we will set our status to success. For ever other node
  // statuses like disk pressure, memory pressure, etc. we set the status to danger.
  const nodeStatus = getStatus(item);

  const status = (): string => {
    if (nodeStatus === 'Unschedulable') {
      return 'warning';
    } else if (nodeStatus === 'Ready') {
      return 'success';
    }

    return 'danger';
  };

  // - Status: Shows the current node status.
  // - Version: Kubelet Version reported by the node.
  // - Kernel: Kernel Version reported by the node from \'uname -r\' (e.g. 3.16.0-0.bpo.4-amd64).
  // - Age: The time when the node was created.
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
          Status: {nodeStatus}
          {data && data.usage && data.usage.cpu && item.status && item.status.capacity && item.status.capacity.cpu
            ? ` | CPU: ${formatResourceValue('cpu', data.usage.cpu)} (${formatResourceValue(
                'cpu',
                item.status.capacity.cpu,
              )})`
            : ''}
          {data && data.usage && data.usage.memory && item.status && item.status.capacity && item.status.capacity.memory
            ? ` | Memory: ${formatResourceValue('memory', data.usage.memory)} (${formatResourceValue(
                'memory',
                item.status.capacity.memory,
              )})`
            : ''}
          {item.status && item.status.nodeInfo && item.status.nodeInfo.kubeletVersion
            ? ` | Version: ${item.status.nodeInfo.kubeletVersion}`
            : ''}
          {item.status && item.status.nodeInfo && item.status.nodeInfo.kernelVersion
            ? ` | Kernel: ${item.status.nodeInfo.kernelVersion}`
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

export default NodeItem;
