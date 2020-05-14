import { IonItem, IonLabel } from '@ionic/react';
import { V1beta1CronJob } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface ICronJobItemProps extends RouteComponentProps {
  item: V1beta1CronJob;
  section: string;
  type: string;
}

const CronJobItem: React.FunctionComponent<ICronJobItemProps> = ({ item, section, type }: ICronJobItemProps) => {
  // - Last Schedule: Time when the cron job was scheduled the last time.
  // - Active: Indicator if the cron job is currently running.
  // - Schedule: Planned schedule for the cron job.
  // - Suspended: Indicator if the cron job is suspended.
  // - Age: The time when the cron job was created.
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
          Last Schedule:{' '}
          {item.status && item.status.lastScheduleTime
            ? timeDifference(new Date().getTime(), new Date(item.status.lastScheduleTime.toString()).getTime())
            : '-'}
          {item.status && item.status.active ? ' | Active: true' : ' | Active: false'}
          {item.spec && item.spec.schedule ? ` | Schedule: ${item.spec.schedule}` : ''}
          {item.spec && item.spec.suspend ? ' | Suspended: true' : ' | Suspended: false'}
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

export default CronJobItem;
