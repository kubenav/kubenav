import { IonItem, IonLabel } from '@ionic/react';
import { V1Event } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import { eventSource } from './eventHelper';

interface IEventItemProps extends RouteComponentProps {
  item: V1Event;
  section: string;
  type: string;
}

const EventItem: React.FunctionComponent<IEventItemProps> = ({ item, section, type }) => {
  // - Type: Type of this event (Normal, Warning), new types could be added in the future.
  // - Reason: A short, machine understandable string that gives the reason for the transition into the object's
  //   current status.
  // - Age: The time when the event occurred the last time and the time when it occurred first. It also includes the
  //   number of times this event has occurred.
  // - Source: Source for the event.
  // - Message: A human-readable description of the status of this operation.
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
          {item.type ? `Type: ${item.type}` : ''}
          {item.reason ? ` | Reason: ${item.reason}` : ''}
          {item.lastTimestamp && item.firstTimestamp && item.count
            ? ` | Age: ${timeDifference(new Date().getTime(), new Date(item.lastTimestamp.toString()).getTime())} (${
                item.count
              }x over ${timeDifference(
                new Date(item.lastTimestamp.toString()).getTime(),
                new Date(item.firstTimestamp.toString()).getTime(),
              )})`
            : ''}
          {item.source ? ` | From: ${eventSource(item.source)}` : ''}
          {item.message ? ` | Message: ${item.message}` : ''}
        </p>
      </IonLabel>
    </IonItem>
  );
};

export default EventItem;
