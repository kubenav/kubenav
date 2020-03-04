import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Namespace } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';
import {timeDifference} from '../../../../utils/helpers';

interface INamespaceItemProps extends RouteComponentProps {
  item: V1Namespace;
  section: string;
  type: string;
}

const NamespaceItem: React.FunctionComponent<INamespaceItemProps> = ({ item, section, type }) => {
  // - Phase: The current lifecycle phase of the namespace.
  // - Age: The time when the namespace was created.
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Phase: {item.status && item.status.phase ? item.status.phase : '-'}
          {item.metadata && item.metadata.creationTimestamp ? ` | Age: ${timeDifference(new Date().getTime(), new Date(item.metadata.creationTimestamp.toString()).getTime())}` : ''}
        </p>
      </IonLabel>
    </IonItem>
  )
};

export default NamespaceItem;
