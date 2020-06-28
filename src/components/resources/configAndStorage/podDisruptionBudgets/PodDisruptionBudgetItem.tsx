import { IonItem, IonLabel } from '@ionic/react';
import { V1beta1PodDisruptionBudget } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IPodDisruptionBudgetItemProps extends RouteComponentProps {
  item: V1beta1PodDisruptionBudget;
  section: string;
  type: string;
}

const PodDisruptionBudgetItem: React.FunctionComponent<IPodDisruptionBudgetItemProps> = ({
  item,
  section,
  type,
}: IPodDisruptionBudgetItemProps) => {
  const status = (): string => {
    if (item.status === undefined || item.status.expectedPods === 0) {
      return 'warning';
    }

    if (
      item.status.currentHealthy === undefined ||
      item.status.desiredHealthy === undefined ||
      item.status.currentHealthy < item.status.desiredHealthy
    ) {
      return 'danger';
    }

    return 'success';
  };

  // - Min Available: An eviction is allowed if at least minAvailable pods selected by selector will still be available after the eviction.
  // - Max Unavailable: An eviction is allowed if at most maxUnavailable pods selected by selector are unavailable after the eviction.
  // - Allowed Disruptions: Number of pod disruptions that are currently allowed.
  // - Age: The time when the secret was created.
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
          Min Available: {item.spec && item.spec.minAvailable ? item.spec.minAvailable : 'N/A'} | Max Unavailable:{' '}
          {item.spec && item.spec.maxUnavailable ? item.spec.maxUnavailable : 'N/A'} | Allowed Disruptions:{' '}
          {item.status && item.status.disruptionsAllowed ? item.status.disruptionsAllowed : 'N/A'}
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

export default PodDisruptionBudgetItem;
