import { IonItem, IonLabel } from '@ionic/react';
import { V1Endpoints } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface IEndpointItemProps extends RouteComponentProps {
  item: V1Endpoints;
  section: string;
  type: string;
}

const EndpointItem: React.FunctionComponent<IEndpointItemProps> = ({ item, section, type }: IEndpointItemProps) => {
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

export default EndpointItem;
