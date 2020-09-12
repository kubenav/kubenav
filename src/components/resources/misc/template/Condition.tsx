import React from 'react';
import {
  V1DeploymentCondition,
  V1JobCondition,
  V1NodeCondition,
  V1PersistentVolumeClaimCondition,
  V1PodCondition,
  V1ReplicaSetCondition,
  V1ReplicationControllerCondition,
  V1StatefulSetCondition,
} from '@kubernetes/client-node';

import { getProperty, timeDifference } from '../../../../utils/helpers';

export type TCondition =
  | V1DeploymentCondition
  | V1JobCondition
  | V1NodeCondition
  | V1PodCondition
  | V1PersistentVolumeClaimCondition
  | V1ReplicaSetCondition
  | V1ReplicationControllerCondition
  | V1StatefulSetCondition;

interface IConditionProps {
  condition: TCondition;
}

const Condition: React.FunctionComponent<IConditionProps> = ({ condition }: IConditionProps) => {
  return (
    <tr>
      <td>{condition.type}</td>
      <td>{condition.status}</td>
      {getProperty(condition, 'lastProbeTime') ? (
        <td>
          {timeDifference(new Date().getTime(), new Date(getProperty(condition, 'lastProbeTime').toString()).getTime())}
        </td>
      ) : null}
      {getProperty(condition, 'lastUpdateTime') ? (
        <td>
          {timeDifference(
            new Date().getTime(),
            new Date(getProperty(condition, 'lastUpdateTime').toString()).getTime(),
          )}
        </td>
      ) : null}
      {getProperty(condition, 'lastHeartbeatTime') ? (
        <td>
          {timeDifference(
            new Date().getTime(),
            new Date(getProperty(condition, 'lastHeartbeatTime').toString()).getTime(),
          )}
        </td>
      ) : null}
      <td>
        {condition.lastTransitionTime
          ? timeDifference(new Date().getTime(), new Date(condition.lastTransitionTime.toString()).getTime())
          : null}
      </td>
      <td>{condition.reason}</td>
      <td>{condition.message}</td>
    </tr>
  );
};

export default Condition;
