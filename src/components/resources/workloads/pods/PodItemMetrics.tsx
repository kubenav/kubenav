import { V1Pod } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext, IPodMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { getResources } from './podHelpers';

interface IPodItemMetricsProps {
  item: V1Pod;
  type: string;
}

const PodItemMetrics: React.FunctionComponent<IPodItemMetricsProps> = ({ item, type }: IPodItemMetricsProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { data } = useQuery<IPodMetrics, Error>(
    ['Pod', cluster ? cluster.id : '', item, type],
    async () =>
      await kubernetesRequest(
        'GET',
        `/apis/metrics.k8s.io/v1beta1/namespaces/${
          item.metadata && item.metadata.namespace ? item.metadata.namespace : ''
        }/pods/${item.metadata && item.metadata.name ? item.metadata.name : ''}`,
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    { refetchInterval: context.settings.queryRefetchInterval },
  );

  return (
    <span>
      {item.spec && item.spec.initContainers && item.spec.containers
        ? ` | ${getResources(item.spec.initContainers.concat(item.spec.containers), data)}`
        : item.spec && item.spec.containers
        ? ` | ${getResources(item.spec.containers, data)}`
        : ''}
    </span>
  );
};

export default PodItemMetrics;
