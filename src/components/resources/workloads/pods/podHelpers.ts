import { V1Container, V1Pod } from '@kubernetes/client-node';

import { IPodMetrics } from '../../../../declarations';
import { formatResourceValue } from '../../../../utils/helpers';

// getReady returns the number of ready containers for a pod and the number of container which should be ready. The
// function returns a string 'number of ready containers / number of containers'.
export const getReady = (pod: V1Pod): string => {
  let shouldReady = 0;
  let isReady = 0;

  if (pod.status && pod.status.containerStatuses) {
    for (let container of pod.status.containerStatuses) {
      shouldReady = shouldReady + 1;
      if (container.ready) {
        isReady = isReady + 1;
      }
    }
  }

  return `${isReady}/${shouldReady}`;
};

// getResources returns the summed up usage and resources over each container for a pod. It returns a string in the
// following format: CPU usage (request/limit) | Memory: usage (request/limit)
export const getResources = (containers: V1Container[], metrics: IPodMetrics|undefined): string => {
  let cpuRequests = 0;
  let cpuLimits = 0;
  let cpuUsage = 0;
  let memoryRequests = 0;
  let memoryLimits = 0;
  let memoryUsage = 0;

  for (let container of containers) {
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

  if (metrics && metrics.containers) {
    for (let container of metrics.containers) {
      if (container.usage && container.usage.hasOwnProperty('cpu')) {
        cpuUsage = cpuUsage + parseInt(formatResourceValue('cpu', container.usage['cpu']))
      }

      if (container.usage && container.usage.hasOwnProperty('memory')) {
        memoryUsage = memoryUsage + parseInt(formatResourceValue('memory', container.usage['memory']))
      }
    }
  }

  return `CPU: ${cpuUsage}m (${cpuRequests}m/${cpuLimits}m) | Memory: ${memoryUsage}Mi (${memoryRequests}Mi/${memoryLimits}Mi)`;
};

// getRestarts returns the number of restarts for the pod, using the sum of container restarts.
export const getRestarts = (pod: V1Pod): number => {
  let restarts = 0;

  if (pod.status && pod.status.containerStatuses) {
    for (let container of pod.status.containerStatuses) {
      if (container.restartCount) {
        restarts = restarts + container.restartCount;
      }
    }
  }

  return restarts;
};

// getStatus returns the status of the pod. If there is a problem with the state of one of the containers, we are
// immediately returning and do not check the remaining containers.
export const getStatus = (pod: V1Pod): string => {
  if (pod.status && pod.status.containerStatuses) {
    for (let container of pod.status.containerStatuses) {
      if (container.state && container.state.waiting) {
        return container.state.waiting.reason ? container.state.waiting.reason : '';
      }

      if (container.state && container.state.terminated) {
        return container.state.terminated.reason ? container.state.terminated.reason : '';
      }
    }
  }

  return 'Running';
};
