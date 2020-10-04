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
import { V1EventList } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../declarations';
import { kubernetesRequest } from '../../utils/api';
import { AppContext } from '../../utils/context';
import useWindowWidth from '../../utils/useWindowWidth';

interface IEvent {
  name: string;
  routerLink: string;
  reason: string;
  message: string;
}

const Warnings: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const width = useWindowWidth();

  const { data } = useQuery<IEvent[], Error>(
    ['OverviewWarnings'],
    async () => {
      try {
        const eventList: V1EventList = await kubernetesRequest(
          'GET',
          '/api/v1/events?limit=100&fieldSelector=type=Warning',
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
            let routerLink = '';
            if (event.involvedObject.kind === 'CronJob') {
              routerLink = `/resources/workloads/cronjobs/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'DaemonSet') {
              routerLink = `/resources/workloads/daemonsets/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'Deployment') {
              routerLink = `/resources/workloads/deployments/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'Job') {
              routerLink = `/resources/workloads/jobs/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'Pod') {
              routerLink = `/resources/workloads/pods/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'ReplicaSet') {
              routerLink = `/resources/workloads/replicasets/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'ReplicationController') {
              routerLink = `/resources/workloads/replicationcontrollers/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'StatefulSet') {
              routerLink = `/resources/workloads/statefulsets/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            } else if (event.involvedObject.kind === 'HorizontalPodAutoscaler') {
              routerLink = `/resources/discovery-and-loadbalancing/horizontalpodautoscalers/${event.involvedObject.namespace}/${event.involvedObject.name}`;
            }

            events.push({
              name: name,
              routerLink: routerLink,
              reason: event.reason ? event.reason : '',
              message: event.message ? event.message : '',
            });
          }
        }

        return events;
      } catch (err) {
        throw err;
      }
    },
    { ...context.settings.queryConfig, refetchInterval: context.settings.queryRefetchInterval },
  );

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
                            <h2>{event.name}</h2>
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
};

export default Warnings;
