import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1DaemonSet } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import ItemStatus from '../ItemStatus';

interface IDaemonSetItemProps extends RouteComponentProps {
  item: V1DaemonSet;
  section: string;
  type: string;
}

const DaemonSetItem: React.FunctionComponent<IDaemonSetItemProps> = ({ item, section, type }) => {
  let status = '';

  if (item.status) {
    if ((item.status.desiredNumberScheduled !== (item.status.currentNumberScheduled || item.status.updatedNumberScheduled || item.status.numberAvailable || item.status.numberReady) || (item.status.numberMisscheduled && item.status.numberMisscheduled > 0))) {
      status = 'danger';
    } else if (item.status.desiredNumberScheduled === (item.status.currentNumberScheduled && item.status.updatedNumberScheduled && item.status.numberAvailable && item.status.numberReady)) {
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

export default DaemonSetItem;
