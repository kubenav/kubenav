import { IonItem, IonLabel } from '@ionic/react';
import { V2beta1HorizontalPodAutoscaler } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IHorizontalPodAutoscalerItemProps extends RouteComponentProps {
  item: V2beta1HorizontalPodAutoscaler;
  section: string;
  type: string;
}

const HorizontalPodAutoscalerItem: React.FunctionComponent<IHorizontalPodAutoscalerItemProps> = ({
  item,
  section,
  type,
}: IHorizontalPodAutoscalerItemProps) => {
  const status = (): string => {
    if (item.spec === undefined || item.status === undefined || item.status.desiredReplicas === 0) {
      return 'warning';
    }

    if (
      item.status.currentReplicas === item.status.desiredReplicas &&
      item.status.desiredReplicas < item.spec.maxReplicas
    ) {
      return 'success';
    }

    if (item.status.currentReplicas === 0 || item.status.currentReplicas === undefined) {
      return 'danger';
    }

    return 'warning';
  };

  // - Desired: Desired number of replicas of pods managed by this autoscaler, as last calculated by the autoscaler.
  // - Current: Current number of replicas of pods managed by this autoscaler, as last seen by the autoscaler.
  // - Min: The lower limit for the number of replicas to which the autoscaler can scale down.
  // - Max: The upper limit for the number of replicas to which the autoscaler can scale up.
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
          {item.status && item.status.currentReplicas && item.status.desiredReplicas
            ? `Replicas: ${item.status.currentReplicas}/${item.status.desiredReplicas} | `
            : ''}
          {item.spec && item.spec.minReplicas ? `Min Replicas: ${item.spec.minReplicas} | ` : ''}
          {item.spec && item.spec.maxReplicas ? `Max Replicas: ${item.spec.maxReplicas} | ` : ''}
          {item.metadata && item.metadata.creationTimestamp
            ? `Age: ${timeDifference(
                new Date().getTime(),
                new Date(item.metadata.creationTimestamp.toString()).getTime(),
              )}`
            : ''}
        </p>
      </IonLabel>
    </IonItem>
  );
};

export default HorizontalPodAutoscalerItem;
