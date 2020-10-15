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

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import Dashboard from '../plugins/prometheus/Dashboard';
import Warnings from './Warnings';
import ClusterMetrics from './ClusterMetrics';

const OverviewPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

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
            {context.settings.enablePodMetrics ? <ClusterMetrics /> : null}
            <Warnings />

            {context.settings.prometheusEnabled ? (
              <Dashboard
                title="Metrics"
                charts={[
                  {
                    title: 'CPU Usage',
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
                        query: `sum(irate(container_cpu_usage_seconds_total{job="kubelet", image!="", container!="", container!="POD"}[4m]))`,
                      },
                      {
                        label: 'Requested',
                        query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", resource="cpu", container!=""})`,
                      },
                      {
                        label: 'Limit',
                        query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", resource="cpu", container!=""})`,
                      },
                      {
                        label: 'Allocatable',
                        query: `sum(kube_node_status_allocatable_cpu_cores{job="kube-state-metrics"})`,
                      },
                    ],
                  },
                  {
                    title: 'Memory Usage (in GiB)',
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
                        query: `sum(container_memory_usage_bytes{job="kubelet", container!="", container!="POD"}) / 1024 / 1024 / 1024`,
                      },
                      {
                        label: 'Requested',
                        query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", resource="memory", container!=""}) / 1024 / 1024 / 1024`,
                      },
                      {
                        label: 'Limit',
                        query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", resource="memory", container!=""}) / 1024 / 1024 / 1024`,
                      },
                      {
                        label: 'Cache',
                        query: `sum(container_memory_cache{job="kubelet", container!="", container!="POD"}) / 1024 / 1024 / 1024`,
                      },
                      {
                        label: 'Allocatable',
                        query: `sum(kube_node_status_allocatable_memory_bytes{job="kube-state-metrics"}) / 1024 / 1024 / 1024`,
                      },
                    ],
                  },
                  {
                    title: 'Pods',
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
                        query: `count(kube_pod_info{job="kube-state-metrics"})`,
                      },
                      {
                        label: 'Allocatable',
                        query: `sum(kube_node_status_allocatable_pods{job="kube-state-metrics"})`,
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
