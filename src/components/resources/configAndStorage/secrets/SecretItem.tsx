import { IonItem, IonLabel } from '@ionic/react';
import { V1Secret } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface ISecretItemProps extends RouteComponentProps {
  item: V1Secret;
  section: string;
  type: string;
}

const SecretItem: React.FunctionComponent<ISecretItemProps> = ({ item, section, type }: ISecretItemProps) => {
  // - Data: Number of data entries in the secret.
  // - Type: Used to facilitate programmatic handling of secret data.
  // - Age: The time when the secret was created.
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
          Data: {item.data ? Object.keys(item.data).length : 0}
          {item.type ? ` | Type: ${item.type}` : ''}
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

export default SecretItem;
