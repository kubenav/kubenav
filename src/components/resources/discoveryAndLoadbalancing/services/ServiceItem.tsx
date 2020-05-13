import { IonItem, IonLabel } from '@ionic/react';
import { V1Service } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface IServiceItemProps extends RouteComponentProps {
  item: V1Service;
  section: string;
  type: string;
}

const ServiceItem: React.FunctionComponent<IServiceItemProps> = ({ item, section, type }) => {
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
          Type: {item.spec && item.spec.type ? item.spec.type : '-'}
          {item.spec && item.spec.clusterIP ? ` | Cluster IP: ${item.spec.clusterIP}` : ''}
          {item.spec && item.spec.externalIPs ? ` | External IPs: ${item.spec.externalIPs.join(', ')}` : ''}
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

export default ServiceItem;
