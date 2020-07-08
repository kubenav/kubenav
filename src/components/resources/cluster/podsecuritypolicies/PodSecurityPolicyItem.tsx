import { IonItem, IonLabel } from '@ionic/react';
import { V1beta1PodSecurityPolicy } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';
import { timeDifference } from '../../../../utils/helpers';

interface IPodSecurityPolicyItemProps extends RouteComponentProps {
  item: V1beta1PodSecurityPolicy;
  section: string;
  type: string;
}

const PodSecurityPolicyItem: React.FunctionComponent<IPodSecurityPolicyItemProps> = ({
  item,
  section,
  type,
}: IPodSecurityPolicyItemProps) => {
  // - Age: The time when the namespace was created.
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
          Privileged: {item.spec && item.spec.privileged ? 'true' : 'false'}
          {item.spec && item.spec.allowedCapabilities
            ? ` | Capabilities: ${item.spec.allowedCapabilities.join(', ')}`
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

export default PodSecurityPolicyItem;
