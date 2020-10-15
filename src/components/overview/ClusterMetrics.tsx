import { IonCol, IonRow } from '@ionic/react';
import { V1Container, V1NodeList, V1PodList } from '@kubernetes/client-node';
import React, { memo, useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext, INodeMetricsList } from '../../declarations';
import { kubernetesRequest } from '../../utils/api';
import { AppContext } from '../../utils/context';
import { formatResourceValue, isDarkMode } from '../../utils/helpers';
import ChartDetailsRadialBar, { IMetric } from '../plugins/prometheus/ChartDetailsRadialBar';

const podResources = (containers: V1Container[]): number[] => {
  let cpuRequests = 0;
  let cpuLimits = 0;
  let memoryRequests = 0;
  let memoryLimits = 0;

  for (const container of containers) {
    if (container.resources && container.resources.requests && container.resources.requests.hasOwnProperty('cpu')) {
      cpuRequests = cpuRequests + parseInt(formatResourceValue('cpu', container.resources.requests['cpu']));
    }

    if (container.resources && container.resources.limits && container.resources.limits.hasOwnProperty('cpu')) {
      cpuLimits = cpuLimits + parseInt(formatResourceValue('cpu', container.resources.limits['cpu']));
    }

    if (container.resources && container.resources.requests && container.resources.requests.hasOwnProperty('memory')) {
      memoryRequests = memoryRequests + parseInt(formatResourceValue('memory', container.resources.requests['memory']));
    }

    if (container.resources && container.resources.limits && container.resources.limits.hasOwnProperty('memory')) {
      memoryLimits = memoryLimits + parseInt(formatResourceValue('memory', container.resources.limits['memory']));
    }
  }

  return [cpuRequests, cpuLimits, memoryRequests, memoryLimits];
};

interface IMetrics {
  cpu: IMetric[];
  memory: IMetric[];
  pods: IMetric[];
}

const ClusterMetrics: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const { isError, data } = useQuery<IMetrics, Error>(
    ['ClusterMetrics', cluster ? cluster.id : ''],
    async () => {
      try {
        const nodeMetrics: INodeMetricsList = await kubernetesRequest(
          'GET',
          '/apis/metrics.k8s.io/v1beta1/nodes',
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const nodeList: V1NodeList = await kubernetesRequest(
          'GET',
          '/api/v1/nodes',
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const podList: V1PodList = await kubernetesRequest(
          'GET',
          '/api/v1/pods',
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        let cpuUsage = 0;
        let memoryUsage = 0;
        for (const metric of nodeMetrics.items) {
          cpuUsage = cpuUsage + parseInt(formatResourceValue('cpu', metric.usage ? metric.usage['cpu'] : '0'));
          memoryUsage =
            memoryUsage + parseInt(formatResourceValue('memory', metric.usage ? metric.usage['memory'] : '0'));
        }

        let cpuCapacity = 0;
        let memoryCapacity = 0;
        let podsCapacity = 0;
        for (const node of nodeList.items) {
          cpuCapacity =
            cpuCapacity +
            parseInt(
              formatResourceValue(
                'cpu',
                node.status && node.status.capacity && node.status.capacity['cpu'] ? node.status.capacity['cpu'] : '0',
              ),
            );
          memoryCapacity =
            memoryCapacity +
            parseInt(
              formatResourceValue(
                'memory',
                node.status && node.status.capacity && node.status.capacity['memory']
                  ? node.status.capacity['memory']
                  : '0',
              ),
            );
          podsCapacity =
            podsCapacity +
            parseInt(
              formatResourceValue(
                'memory',
                node.status && node.status.capacity && node.status.capacity['pods']
                  ? node.status.capacity['pods']
                  : '0',
              ),
            );
        }

        const podsUsage = podList.items.length;

        let cpuRequest = 0;
        let cpuLimit = 0;
        let memoryRequest = 0;
        let memoryLimit = 0;
        for (const pod of podList.items) {
          if (pod.spec) {
            const resources = podResources(pod.spec.containers);
            cpuRequest = cpuRequest + resources[0];
            cpuLimit = cpuLimit + resources[1];
            memoryRequest = memoryRequest + resources[2];
            memoryLimit = memoryLimit + resources[3];
          }
        }

        return {
          cpu: [
            { name: 'Capacity', value: cpuCapacity, fill: isDarkMode(context.settings.theme) ? '#50c8ff' : '#0cd1e8' },
            { name: 'Usage', value: cpuUsage, fill: isDarkMode(context.settings.theme) ? '#2fdf75' : '#10dc60' },
            { name: 'Request', value: cpuRequest, fill: isDarkMode(context.settings.theme) ? '#ffd534' : '#ffce00' },
            { name: 'Limit', value: cpuLimit, fill: isDarkMode(context.settings.theme) ? '#ff4961' : '#f04141' },
          ],
          memory: [
            {
              name: 'Capacity',
              value: memoryCapacity,
              fill: isDarkMode(context.settings.theme) ? '#50c8ff' : '#0cd1e8',
            },
            { name: 'Usage', value: memoryUsage, fill: isDarkMode(context.settings.theme) ? '#2fdf75' : '#10dc60' },
            { name: 'Request', value: memoryRequest, fill: isDarkMode(context.settings.theme) ? '#ffd534' : '#ffce00' },
            { name: 'Limit', value: memoryLimit, fill: isDarkMode(context.settings.theme) ? '#ff4961' : '#f04141' },
          ],
          pods: [
            { name: 'Capacity', value: podsCapacity, fill: isDarkMode(context.settings.theme) ? '#50c8ff' : '#0cd1e8' },
            { name: 'Usage', value: podsUsage, fill: isDarkMode(context.settings.theme) ? '#2fdf75' : '#10dc60' },
          ],
        };
      } catch (err) {
        throw err;
      }
    },
    { ...context.settings.queryConfig, refetchInterval: context.settings.queryRefetchInterval },
  );

  if (isError || data === undefined) {
    return null;
  } else {
    return (
      <IonRow>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
          <ChartDetailsRadialBar title="CPU" data={data && data.cpu ? data.cpu : undefined} unit="m" />
        </IonCol>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
          <ChartDetailsRadialBar title="Memory" data={data && data.memory ? data.memory : undefined} unit="Mi" />
        </IonCol>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
          <ChartDetailsRadialBar title="Pods" data={data && data.pods ? data.pods : undefined} unit="" />
        </IonCol>
      </IonRow>
    );
  }
};

export default memo(ClusterMetrics, (): boolean => {
  return true;
});
