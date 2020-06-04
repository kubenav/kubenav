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
  // - Egress Rules: List of egress rules to be applied to the selected pods.
  // - Ingress Rules: List of ingress rules to be applied to the selected pods.
  // - Policy Types: List of rule types that the NetworkPolicy relates to.
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
