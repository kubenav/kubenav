import { V1Pod } from '@kubernetes/client-node'

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
