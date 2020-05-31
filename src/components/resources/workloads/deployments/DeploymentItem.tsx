import { IonItem, IonLabel } from '@ionic/react';
import { V1Deployment } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IDeploymentItemProps extends RouteComponentProps {
  item: V1Deployment;
  section: string;
  type: string;
}

const DeploymentItem: React.FunctionComponent<IDeploymentItemProps> = ({
  item,
  section,
  type,
}: IDeploymentItemProps) => {
  const status = (): string => {
    if (item.spec === undefined || item.status === undefined || item.spec.replicas === 0) {
      return 'warning';
    }

    if (
      item.spec.replicas === item.status.replicas &&
      item.spec.replicas === item.status.readyReplicas &&
      item.spec.replicas === item.status.updatedReplicas &&
      item.spec.replicas === item.status.availableReplicas
    ) {
      return 'success';
    }

    if (
      item.status.readyReplicas === 0 ||
      item.status.updatedReplicas === 0 ||
      item.status.availableReplicas === 0 ||
      item.status.readyReplicas === undefined ||
      item.status.updatedReplicas === undefined ||
      item.status.availableReplicas === undefined
    ) {
      return 'danger';
    }

    return 'warning';
  };

  // - Desired: Number of desired pods.
  // - Current: Total number of non-terminated pods targeted by this deployment.
  // - Ready: Total number of non-terminated pods targeted by this deployment.
  // - Updated: Total number of non-terminated pods targeted by this deployment that have the desired template spec.
  // - Available: Total number of available pods (ready for at least minReadySeconds) targeted by this deployment.
  // - Age: The time when the deployment was created.
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
          Desired: {item.spec && item.spec.replicas ? item.spec.replicas : '0'}
          {item.status && item.status.replicas ? ` | Current: ${item.status.replicas}` : ' | Current: 0'}
          {item.status && item.status.readyReplicas ? ` | Ready: ${item.status.readyReplicas}` : ' | Ready: 0'}
          {item.status && item.status.updatedReplicas ? ` | Updated: ${item.status.updatedReplicas}` : ' | Updated: 0'}
          {item.status && item.status.availableReplicas
            ? ` | Available: ${item.status.availableReplicas}`
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

export default DeploymentItem;
