import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonList,
  IonRouterLink,
  IonRow,
  isPlatform,
} from '@ionic/react';
import { CoreV1EventList } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../declarations';
import { kubernetesRequest } from '../../utils/api';
import { AppContext } from '../../utils/context';
import useWindowWidth from '../../utils/useWindowWidth';
import { involvedObjectLink } from '../resources/cluster/events/eventHelper';
import { timeDifference } from '../../utils/helpers';

interface IEvent {
  name: string;
  namespace: string;
  routerLink: string;
  reason: string;
  message: string;
  lastTimestamp: string;
}

const Warnings: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();
  const width = useWindowWidth();

  const { isError, data } = useQuery<IEvent[], Error>(
    ['OverviewWarnings', cluster],
    async () => {
      try {
        const eventList: CoreV1EventList = await kubernetesRequest(
          'GET',
          `/api/v1/events?limit=${context.settings.queryLimit}&fieldSelector=type=Warning`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const events: IEvent[] = [];
        for (const event of eventList.items) {
          const name = event.metadata.name
            ? event.metadata.name.split('.').length > 0
              ? event.metadata.name.split('.')[0]
              : event.metadata.name
            : '';

          if (events.map((e) => e.name).indexOf(name) === -1) {
            events.push({
              name: name,
              namespace: event.metadata.namespace ? event.metadata.namespace : '',
              routerLink: involvedObjectLink(event.involvedObject),
              reason: event.reason ? event.reason : '',
              message: event.message ? event.message : '',
              lastTimestamp: event.lastTimestamp
                ? timeDifference(new Date().getTime(), new Date(event.lastTimestamp.toString()).getTime())
                : '',
            });
          }
        }

        return events;
      } catch (err) {
        throw err;
      }
    },
    { refetchInterval: context.settings.queryRefetchInterval },
  );

  if (isError || data === undefined) {
    return null;
  } else {
    return (
      <IonRow>
        <IonCol>
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Warnings</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              {isPlatform('hybrid') || isPlatform('mobile') || width < 992 ? (
                <IonList>
                  {data && data.length > 0
                    ? data.map((event, index) => {
                        return (
                          <IonItem
                            key={index}
                            routerLink={event.routerLink === '' ? undefined : event.routerLink}
                            routerDirection="forward"
                          >
                            <IonLabel class="ion-text-wrap">
                              <h2>
                                {event.name} ({event.namespace})
                              </h2>
                              <p>
                                {event.reason ? `${event.reason}: ` : ''}
                                {event.message}
                              </p>
                            </IonLabel>
                          </IonItem>
                        );
                      })
                    : null}
                </IonList>
              ) : (
                <div className="table">
                  <table>
                    <thead>
                      <tr>
                        <th>Name</th>
                        <th>Namespace</th>
                        <th>Last Seen</th>
                        <th>Reason</th>
                        <th>Message</th>
                      </tr>
                    </thead>
                    <tbody>
                      {data && data.length > 0
                        ? data.map((event, index) => {
                            return (
                              <tr key={index}>
                                <td>
                                  {event.routerLink === '' ? (
                                    event.name
                                  ) : (
                                    <IonRouterLink routerLink={event.routerLink} routerDirection="forward">
                                      {event.name}
                                    </IonRouterLink>
                                  )}
                                </td>
                                <td>{event.namespace}</td>
                                <td>{event.lastTimestamp}</td>
                                <td>{event.reason}</td>
                                <td>{event.message}</td>
                              </tr>
                            );
                          })
                        : null}
                    </tbody>
                  </table>
                </div>
              )}
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>
    );
  }
};

export default Warnings;
