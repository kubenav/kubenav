import {
  IonButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardSubtitle,
  IonCardTitle,
  IonContent,
  IonGrid,
  IonHeader,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../declarations';
import { kubernetesRequest } from '../../utils/api';
import { AppContext } from '../../utils/context';
import LoadingErrorCard from '../misc/LoadingErrorCard';
import Dashboard from '../plugins/prometheus/Dashboard';
import Warnings from './Warnings';
import ClusterMetrics from './ClusterMetrics';

const OverviewPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { isError, isFetching, data, error } = useQuery<boolean, Error>(
    ['OverviewPage', cluster],
    async () => {
      try {
        if (!cluster) {
          return false;
        }

        const data = await kubernetesRequest(
          'GET',
          '',
          '',
          context.settings,
          await context.kubernetesAuthWrapper(cluster.id),
        );

        if (data && data.paths) {
          return true;
        } else {
          return false;
        }
      } catch (err) {
        return false;
      }
    },
    context.settings.queryConfig,
  );

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Overview</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {context.clusters && context.cluster ? (
          <IonGrid>
            {(isError || !data) && !isFetching ? (
              <LoadingErrorCard
                cluster={context.cluster}
                clusters={context.clusters}
                error={error as Error}
                icon="/assets/icons/kubernetes/kubernetes.png"
                text="Could not get connect to Cluster"
              />
            ) : null}

            {context.settings.enablePodMetrics ? <ClusterMetrics /> : null}

            <Warnings />

            {context.settings.prometheusEnabled ? (
              <Dashboard
                title="Metrics"
                charts={[
                  {
                    title: 'CPU Usage',
                    unit: 'Cores',
                    size: {
                      xs: '12',
                      sm: '12',
                      md: '12',
                      lg: '12',
                      xl: '6',
                    },
                    type: 'area',
                    queries: [
                      {
                        label: 'Current',
                        query: `sum(max(rate(container_cpu_usage_seconds_total{id="/"}[2m])) by (node))`,
                      },
                      {
                        label: 'Requested',
                        query: `sum(kube_pod_container_resource_requests{resource="cpu", container!=""})`,
                      },
                      {
                        label: 'Limit',
                        query: `sum(kube_pod_container_resource_limits{resource="cpu", container!=""})`,
                      },
                      {
                        label: 'Allocatable',
                        query: `sum(kube_node_status_allocatable_cpu_cores)`,
                      },
                    ],
                  },
                  {
                    title: 'Memory Usage',
                    unit: 'GiB',
                    size: {
                      xs: '12',
                      sm: '12',
                      md: '12',
                      lg: '12',
                      xl: '6',
                    },
                    type: 'area',
                    queries: [
                      {
                        label: 'Current',
                        query: `sum(max(container_memory_working_set_bytes{id="/"}) by (node)) / 1024 / 1024 / 1024`,
                      },
                      {
                        label: 'Requested',
                        query: `sum(kube_pod_container_resource_requests{resource="memory", container!=""}) / 1024 / 1024 / 1024`,
                      },
                      {
                        label: 'Limit',
                        query: `sum(kube_pod_container_resource_limits{resource="memory", container!=""}) / 1024 / 1024 / 1024`,
                      },
                      {
                        label: 'Allocatable',
                        query: `sum(kube_node_status_allocatable_memory_bytes) / 1024 / 1024 / 1024`,
                      },
                    ],
                  },
                  {
                    title: 'Pods',
                    unit: '',
                    size: {
                      xs: '12',
                      sm: '12',
                      md: '12',
                      lg: '12',
                      xl: '12',
                    },
                    type: 'area',
                    queries: [
                      {
                        label: 'Current',
                        query: `count(kube_pod_info)`,
                      },
                      {
                        label: 'Allocatable',
                        query: `sum(kube_node_status_allocatable_pods)`,
                      },
                    ],
                  },
                ]}
              />
            ) : null}
          </IonGrid>
        ) : (
          <IonCard>
            <img alt="kubenav" src="/assets/card-header.png" />
            <IonCardHeader>
              <IonCardSubtitle>Welcome to kubenav</IonCardSubtitle>
              <IonCardTitle>Introduction</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <p className="paragraph-margin-bottom">
                Welcome to the kubenav app. Once you have added a cluster, you can start the exploration of them within
                the kubenav app. To add a new Kubernetes cluster to the app use the button <b>Add a Cluster</b> or the
                <b> Clusters</b> item from the menu.
              </p>
              <IonButton expand="block" routerLink="/settings/clusters" routerDirection="none">
                Add a Cluster
              </IonButton>
            </IonCardContent>
          </IonCard>
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(OverviewPage, (): boolean => {
  return true;
});
