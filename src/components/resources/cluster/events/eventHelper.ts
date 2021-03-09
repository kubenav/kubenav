import { V1EventSource, V1ObjectReference } from '@kubernetes/client-node';

// eventSource is a helper function to generate a string which contains information for an event.
export const eventSource = (value: V1EventSource): string => {
  if (value.host && value.component) {
    return `${value.host}/${value.component}`;
  }

  if (value.host) {
    return value.host;
  }

  if (value.component) {
    return value.component;
  }

  return '';
};

// involvedObjectLink returns the link to the involved object for an event.
export const involvedObjectLink = (involvedObject: V1ObjectReference): string => {
  if (involvedObject.kind === 'CronJob') {
    return `/resources/workloads/cronjobs/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'DaemonSet') {
    return `/resources/workloads/daemonsets/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'Deployment') {
    return `/resources/workloads/deployments/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'Job') {
    return `/resources/workloads/jobs/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'Pod') {
    return `/resources/workloads/pods/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'ReplicaSet') {
    return `/resources/workloads/replicasets/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'ReplicationController') {
    return `/resources/workloads/replicationcontrollers/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'StatefulSet') {
    return `/resources/workloads/statefulsets/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'Endpoints') {
    return `/resources/discovery-and-loadbalancing/endpoints/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'HorizontalPodAutoscaler') {
    return `/resources/discovery-and-loadbalancing/horizontalpodautoscalers/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'Ingress') {
    return `/resources/discovery-and-loadbalancing/ingresses/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'NetworkPolicy') {
    return `/resources/discovery-and-loadbalancing/networkpolicies/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'Service') {
    return `/resources/discovery-and-loadbalancing/services/${involvedObject.namespace}/${involvedObject.name}`;
  } else if (involvedObject.kind === 'PersistentVolumeClaim') {
    return `/resources/config-and-storage/persistentvolumeclaims/${involvedObject.namespace}/${involvedObject.name}`;
  } else {
    return '';
  }
};
