import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1beta1CronJob } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface ICronJobItemProps extends RouteComponentProps {
  item: V1beta1CronJob;
  section: string;
  type: string;
}

const CronJobItem: React.FunctionComponent<ICronJobItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Namespace: {item.metadata ? item.metadata.namespace : '-'}
          | Last Time Schedule : {item.status && item.status.lastScheduleTime
          ? timeDifference(new Date().getTime(), new Date(item.status.lastScheduleTime.toString()).getTime()) : '-'}
        </p>
      </IonLabel>
    </IonItem>
  )
};

export default CronJobItem;
