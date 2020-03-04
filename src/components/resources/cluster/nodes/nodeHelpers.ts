import { V1Node } from '@kubernetes/client-node'

const conditions = ['Ready', 'MemoryPressure', 'DiskPressure', 'PIDPressure', 'NetworkUnavailable'];

const isValidCondition = (conditionType: string): boolean => {
  for (let condition of conditions) {
    if (condition === conditionType) {
      return true;
    }
  }

  return false;
};

export const getStatus = (node: V1Node): string => {
  if (node.status && node.status.conditions) {
    for (let condition of node.status.conditions) {
      if (isValidCondition(condition.type) && condition.status === 'True') {
        return condition.type;
      }
    }
  }

  return 'Not Ready';
};

