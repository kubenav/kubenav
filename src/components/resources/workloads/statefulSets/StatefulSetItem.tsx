import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1StatefulSet } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import ItemStatus from '../../../kubernetes/ItemStatus';

interface IStatefulSetItemProps extends RouteComponentProps {
  item: V1StatefulSet;
  section: string;
  type: string;
}

const StatefulSetItem: React.FunctionComponent<IStatefulSetItemProps> = ({ item, section, type }) => {
  let status = '';

  if (item.status) {
    if (item.status.replicas !== item.status.readyReplicas) {
      status = 'danger';
    } else if (item.status.replicas === (item.status.readyReplicas && item.status.updatedReplicas)) {
      status = 'success';
    } else {
      status = 'warning';
    }
  }

  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <ItemStatus status={status} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}</p>
      </IonLabel>
    </IonItem>
  )
};

export default StatefulSetItem;
