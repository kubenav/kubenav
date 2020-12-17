import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonGrid,
  IonRouterLink,
  IonRow,
} from '@ionic/react';
import { V1Event } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { timeDifference } from '../../../../utils/helpers';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import { eventSource, involvedObjectLink } from './eventHelper';

interface IEventDetailsProps extends RouteComponentProps {
  item: V1Event;
  section: string;
  type: string;
}

const EventDetails: React.FunctionComponent<IEventDetailsProps> = ({ item, type }: IEventDetailsProps) => {
  const context = useContext<IContext>(AppContext);

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
              <Row
                obj={item.involvedObject}
                objKey="name"
                title="Name"
                value={(name: string) =>
                  involvedObjectLink(item.involvedObject) ? (
                    <IonRouterLink routerLink={involvedObjectLink(item.involvedObject)} routerDirection="forward">
                      {name}
                    </IonRouterLink>
                  ) : (
                    name
                  )
                }
              />
              <Row obj={item.involvedObject} objKey="namespace" title="Namespace" />
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
    </IonGrid>
  );
};

export default EventDetails;
