import { IonCol, IonRow } from '@ionic/react';
import { V1Node } from '@kubernetes/client-node';
import { V1Container, V1PodList } from '@kubernetes/client-node';
import React, { memo, useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext, INodeMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { formatResourceValue, isDarkMode } from '../../../../utils/helpers';
import ChartDetailsRadialBar, { IMetric } from '../../../plugins/prometheus/ChartDetailsRadialBar';

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

interface INodeMetricsProps {
  item: V1Node;
  metrics: INodeMetrics;
}

const NodeMetrics: React.FunctionComponent<INodeMetricsProps> = ({ item, metrics }: INodeMetricsProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const { data } = useQuery<IMetrics, Error>(
    ['NodeMetrics', cluster ? cluster.id : ''],
    async () => {
      try {
        const podList: V1PodList = await kubernetesRequest(
          'GET',
          `/api/v1/pods?fieldSelector=spec.nodeName=${item.metadata ? item.metadata.name : ''}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const cpuUsage = parseInt(formatResourceValue('cpu', metrics.usage ? metrics.usage['cpu'] : '0'));
        const cpuCapacity = parseInt(
          formatResourceValue(
            'cpu',
            item.status && item.status.capacity && item.status.capacity['cpu'] ? item.status.capacity['cpu'] : '0',
          ),
        );

        const memoryUsage = parseInt(formatResourceValue('memory', metrics.usage ? metrics.usage['memory'] : '0'));
        const memoryCapacity = parseInt(
          formatResourceValue(
            'memory',
            item.status && item.status.capacity && item.status.capacity['memory']
              ? item.status.capacity['memory']
              : '0',
          ),
        );

        const podsUsage = podList.items.length;
        const podsCapacity = parseInt(
          formatResourceValue(
            'memory',
            item.status && item.status.capacity && item.status.capacity['pods'] ? item.status.capacity['pods'] : '0',
          ),
        );

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
};

export default memo(NodeMetrics, (): boolean => {
  return true;
});
