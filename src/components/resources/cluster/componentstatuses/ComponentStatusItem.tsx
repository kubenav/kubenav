import { IonItem, IonLabel } from '@ionic/react';
import { V1ComponentStatus } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

interface IComponentStatus {
  status: string;
  message: string;
}

interface IComponentStatusItemProps extends RouteComponentProps {
  item: V1ComponentStatus;
  section: string;
  type: string;
}

const ComponentStatusItem: React.FunctionComponent<IComponentStatusItemProps> = ({
  item,
  section,
  type,
}: IComponentStatusItemProps) => {
  const getStatus = (): IComponentStatus => {
    if (item.conditions === undefined || item.conditions.length === 0) {
      return { status: 'warning', message: '' };
    }

    for (const condition of item.conditions) {
      if (condition.status !== 'True' && condition.status !== 'Healthy') {
        return { status: 'danger', message: condition.message ? condition.message : '' };
      }
    }

    return { status: 'success', message: item.conditions[0].message ? item.conditions[0].message : '' };
  };

  const status = getStatus();

  // - Status: Status of the condition for a component.
  // - Message: Message about the condition for a component.
  // - Age: The time when the namespace was created.
  return (
    <IonItem
      routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${
        item.metadata ? item.metadata.name : ''
      }`}
      routerDirection="forward"
    >
      <ItemStatus status={status.status} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Status: {status.status === 'success' ? 'Healthy' : 'Unhealthy'} | Message: {status.message}
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

export default ComponentStatusItem;
