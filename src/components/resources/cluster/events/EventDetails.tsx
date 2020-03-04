import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonGrid,
  IonRow,
} from '@ionic/react';
import { V1Event } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import { eventSource } from './eventHelper';

interface IEventDetailsProps extends RouteComponentProps {
  item: V1Event;
  section: string;
  type: string;
}

const EventDetails: React.FunctionComponent<IEventDetailsProps> = ({ item, type }) => {
  return (
    <IonGrid>
      <IonRow>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Details</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <Row
                obj={item}
                objKey="lastTimestamp"
                title="Last Seen"
                value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())}
              />
              <Row
                obj={item}
                objKey="firstTimestamp"
                title="First Seen"
                value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())}
              />
              <Row obj={item} objKey="count" title="Count" />
              <Row obj={item} objKey="message" title="Message" />
              <Row obj={item} objKey="kind" title="Kind" />
              <Row obj={item} objKey="type" title="Type" />
              <Row obj={item} objKey="reason" title="Reason" />
              <Row obj={item} objKey="source" title="Source" value={eventSource} />
            </IonCardContent>
          </IonCard>
        </IonCol>

        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Involved Object</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <Row obj={item.involvedObject} objKey="apiVersion" title="API Version" />
              <Row obj={item.involvedObject} objKey="kind" title="Kind" />
              <Row obj={item.involvedObject} objKey="name" title="Name" />
              <Row obj={item.involvedObject} objKey="namespace" title="Namespace" />
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}
    </IonGrid>
  )
};

export default EventDetails;
