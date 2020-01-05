import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Event } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../utils';
import { eventSource } from '../details/Event';

interface EventItemProps extends RouteComponentProps {
  item: V1Event;
  section: string;
  type: string;
}

const EventItem: React.FunctionComponent<EventItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.type ? `Type: ${item.type} | ` : ''}{item.reason ? `Reason: ${item.reason} | ` : ''}{item.lastTimestamp && item.firstTimestamp && item.count ? `Age: ${timeDifference(new Date().getTime(), new Date(item.lastTimestamp.toString()).getTime())} (${item.count}x over ${timeDifference(new Date(item.lastTimestamp.toString()).getTime(), new Date(item.firstTimestamp.toString()).getTime())}) | ` : ''}{item.source ? `From: ${eventSource(item.source)}` : ''}</h2>
        <p>{item.message ? item.message : ''}</p>
      </IonLabel>
    </IonItem>
  )
};

export default EventItem;
