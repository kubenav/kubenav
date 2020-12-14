import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';

interface IDashboardItem {
  link: string;
  title: string;
  description: string;
}

interface IDashboardListProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const DashboardList: React.FunctionComponent<IDashboardListProps> = ({ item }: IDashboardListProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { isError, data, error } = useQuery<IDashboardItem[], Error>(
    ['PrometheusDashboardList', cluster ? cluster.id : '', item],
    async () => {
      try {
        if (item && item.metadata && item.metadata.annotations && item.metadata.annotations['kubenav.io/dashboards']) {
          const dashboards = item.metadata.annotations['kubenav.io/dashboards'].split(',');
          const dashboardItems: IDashboardItem[] = [];

          for (const dashboard of dashboards) {
            const name = dashboard.trim().split('?')[0];

            const cm = await kubernetesRequest(
              'GET',
              `/api/v1/namespaces/${context.settings.prometheusDashboardsNamespace}/configmaps/${name}`,
              '',
              context.settings,
              await context.kubernetesAuthWrapper(''),
            );

            dashboardItems.push({
              link: `/plugins/prometheus/${cm.metadata.namespace}/${dashboard.trim()}`,
              title: cm.data['title'] ? cm.data['title'] : '',
              description: cm.data['description'] ? cm.data['description'] : '',
            });
          }

          return dashboardItems;
        }

        return [];
      } catch (err) {
        throw err;
      }
    },
    { ...context.settings.queryConfig, refetchInterval: context.settings.queryRefetchInterval },
  );

  if ((data && data.length > 0) || isError) {
    return (
      <IonRow>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="12">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Dashboards</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              {isError ? (
                `Could not load dashboards: ${error}`
              ) : (
                <IonList>
                  {data
                    ? data.map((dashboard: IDashboardItem, index) => {
                        return (
                          <IonItem key={index} routerLink={dashboard.link} routerDirection="forward">
                            <IonLabel>
                              <h2>{dashboard.title}</h2>
                              <p>{dashboard.description}</p>
                            </IonLabel>
                          </IonItem>
                        );
                      })
                    : null}
                </IonList>
              )}
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>
    );
  } else {
    return null;
  }
};

export default DashboardList;
