import { V1Node } from '@kubernetes/client-node';

const conditions = ['Ready', 'MemoryPressure', 'DiskPressure', 'PIDPressure', 'NetworkUnavailable'];

const isValidCondition = (conditionType: string): boolean => {
  for (const condition of conditions) {
    if (condition === conditionType) {
      return true;
    }
  }

  return false;
};

export const getStatus = (node: V1Node): string => {
  if (node.spec && node.spec.unschedulable) {
    return 'Unschedulable';
  }

  if (node.status && node.status.conditions) {
    for (const condition of node.status.conditions) {
      if (isValidCondition(condition.type) && condition.status === 'True') {
        return condition.type;
      }
    }
  }

  return 'Not Ready';
};
