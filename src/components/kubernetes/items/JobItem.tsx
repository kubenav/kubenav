import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Job } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import ItemStatus from '../ItemStatus';

interface JobItemProps extends RouteComponentProps {
  item: V1Job;
  section: string;
  type: string;
}

const JobItem: React.FunctionComponent<JobItemProps> = ({ item, section, type }) => {
  let status = 'success';

  if (item.status) {
    if (item.status.failed && item.status.failed > 0) {
      status = 'danger';
    } else if (item.status.failed && item.status.failed === 0 && item.status.succeeded && item.status.succeeded === 0) {
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

export default JobItem;
