import { IonItem, IonLabel } from '@ionic/react';
import { V1Job } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import ItemStatus from '../../misc/template/ItemStatus';

// completions is a helper function to determine the number of completions of a job in the form succeeded/planned.
const completions = (item: V1Job): string => {
  if (item.spec && item.spec.completions && item.status && item.status.succeeded) {
    return `${item.status.succeeded}/${item.spec.completions}`;
  }

  if (item.spec && !item.spec.parallelism && item.status && item.status.succeeded) {
    return `${item.status.succeeded}/1`;
  }

  if (item.spec && item.spec.parallelism && item.status && item.status.succeeded) {
    if (item.spec.parallelism > 1) {
      return `${item.status.succeeded}/1 of ${item.spec.parallelism}`;
    }

    return `${item.status.succeeded}/1`;
  }

  return `0/${item.spec && item.spec.completions ? item.spec.completions : '-'}`;
};

interface IJobItemProps extends RouteComponentProps {
  item: V1Job;
  section: string;
  type: string;
}

const JobItem: React.FunctionComponent<IJobItemProps> = ({ item, section, type }: IJobItemProps) => {
  // status is used to display the status of the job. If the failed field is defined and larger then 0, we display the
  // error status.
  let status = 'success';

  if (item.status) {
    if (item.status.failed && item.status.failed > 0) {
      status = 'danger';
    }
  }

  // - Completions: Number of succeeded and planned completions
  // - Duration: Time the job needed to complete. If the completion time is not available we are using the current time
  //   as reference.
  // - Age: The time when the job was created.
  return (
    <IonItem
      routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${
        item.metadata ? item.metadata.name : ''
      }`}
      routerDirection="forward"
    >
      <ItemStatus status={status} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Completions: {completions(item)}
          {item.status && item.status.startTime
            ? ` | Duration: ${timeDifference(
                item.status.completionTime
                  ? new Date(item.status.completionTime.toString()).getTime()
                  : new Date().getTime(),
                new Date(item.status.startTime.toString()).getTime(),
              )}`
            : ''}
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

export default JobItem;
