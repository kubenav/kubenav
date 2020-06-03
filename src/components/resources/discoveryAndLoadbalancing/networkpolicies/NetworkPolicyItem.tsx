import { IonItem, IonLabel } from '@ionic/react';
import { V1NetworkPolicy } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface INetworkPolicyItemProps extends RouteComponentProps {
  item: V1NetworkPolicy;
  section: string;
  type: string;
}

const NetworkPolicyItem: React.FunctionComponent<INetworkPolicyItemProps> = ({
  item,
  section,
  type,
}: INetworkPolicyItemProps) => {
  // - Type: Type of the service, which determines how the Service is exposed.
  // - Cluster IP: IP address of the service and is usually assigned randomly by the master.
  // - External IPs: List of IP addresses for which nodes in the cluster will also accept traffic for this service.
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
          Egress Rules: {item.spec && item.spec.egress ? item.spec.egress.length : 0}
          {' | '}Ingress Rules: {item.spec && item.spec.ingress ? item.spec.ingress.length : 0}
          {' | '}Policy Types: {item.spec && item.spec.policyTypes ? item.spec.policyTypes.join(', ') : ''}
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

export default NetworkPolicyItem;
