import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Node } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';
import { getStatus } from './nodeHelpers';

interface INodeItemProps extends RouteComponentProps {
  item: V1Node;
  section: string;
  type: string;
}

const NodeItem: React.FunctionComponent<INodeItemProps> = ({ item, section, type }) => {
  // Get the node status. Only when the node status is ready we will set our status to success. For ever other node
  // statuses like disk pressure, memory pressure, etc. we set the status to danger.
  const nodeStatus = getStatus(item);
  let status = 'danger';

  if (nodeStatus === 'Ready') {
    status = 'success';
  }

  // - Status: Shows the current node status.
  // - Version: Kubelet Version reported by the node.
  // - Kernel: Kernel Version reported by the node from \'uname -r\' (e.g. 3.16.0-0.bpo.4-amd64).
  // - Age: The time when the node was created.
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <ItemStatus status={status} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Status: {nodeStatus}
          {item.status && item.status.nodeInfo && item.status.nodeInfo.kubeletVersion ? ` | Version: ${item.status.nodeInfo.kubeletVersion}` : ''}
          {item.status && item.status.nodeInfo && item.status.nodeInfo.kernelVersion ? ` | Kernel: ${item.status.nodeInfo.kernelVersion}` : ''}
          {item.metadata && item.metadata.creationTimestamp ? ` | Age: ${timeDifference(new Date().getTime(), new Date(item.metadata.creationTimestamp.toString()).getTime())}` : ''}
        </p>
      </IonLabel>
    </IonItem>
  )
};

export default NodeItem;
