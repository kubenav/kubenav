import { V1EventSource } from '@kubernetes/client-node';

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
