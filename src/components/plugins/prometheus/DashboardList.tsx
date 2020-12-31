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
import { getProperty } from '../../../utils/helpers';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const getQueryParams = (item: any, params: string): string => {
  if (params) {
    const linkParts: string[] = [];

    for (const param of params.split('&')) {
      const parts = param.split('=');
      if (parts.length !== 2) {
        return '';
      }

      if (parts[1].startsWith('$.')) {
        linkParts.push(`${parts[0]}=${getProperty(item, parts[1].substring(2))}`);
      } else {
        linkParts.push(`${parts[0]}=${parts[1]}`);
      }
    }

    return `?${linkParts.join('&')}`;
  }

  return '';
};

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
        if (
          item &&
          item.metadata &&
          item.metadata.annotations &&
          item.metadata.annotations['kubenav.io/prometheus-dashboards']
        ) {
          const dashboards = item.metadata.annotations['kubenav.io/prometheus-dashboards'].split(',');
          const dashboardItems: IDashboardItem[] = [];

          for (const dashboard of dashboards) {
            const parts = dashboard.trim().split('?');
            const name = parts[0];
            const params = parts.length === 2 ? parts[1] : '';

            const cm = await kubernetesRequest(
              'GET',
              `/api/v1/namespaces/${context.settings.prometheusDashboardsNamespace}/configmaps/${name}`,
              '',
              context.settings,
              await context.kubernetesAuthWrapper(''),
            );

            dashboardItems.push({
              link: `/plugins/prometheus/${cm.metadata.namespace}/${name}${getQueryParams(item, params)}`,
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
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Prometheus Dashboards</IonCardTitle>
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
