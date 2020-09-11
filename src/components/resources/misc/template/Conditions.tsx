import { IonCardContent, IonCardHeader, IonCardTitle, IonCol } from '@ionic/react';
import React from 'react';

import { TCondition } from '../../../../declarations';
import { getProperty, timeDifference } from '../../../../utils/helpers';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';

interface IPodConditionsProps {
  conditions: TCondition[];
}

const Conditions: React.FunctionComponent<IPodConditionsProps> = ({ conditions }: IPodConditionsProps) => {
  return (
    <IonCol>
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>Conditions</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          <div className="table">
            <table>
              <thead>
                <tr>
                  <th>Type</th>
                  <th>Status</th>
                  {getProperty(conditions[0], 'lastProbeTime') ? <th>Last Probe Time</th> : null}
                  {getProperty(conditions[0], 'lastUpdateTime') ? <th>Last Update Time</th> : null}
                  {getProperty(conditions[0], 'lastHeartbeatTime') ? <th>Last Heartbeat Time</th> : null}
                  <th>Last Transition Time</th>
                  <th>Reason</th>
                  <th>Message</th>
                </tr>
              </thead>
              <tbody>
                {conditions.map((condition, index) => (
                  <tr key={index}>
                    <td>{condition.type}</td>
                    <td>{condition.status}</td>
                    {getProperty(condition, 'lastProbeTime') ? (
                      <td>
                        {timeDifference(
                          new Date().getTime(),
                          new Date(getProperty(condition, 'lastProbeTime').toString()).getTime(),
                        )}
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
                        ? timeDifference(
                            new Date().getTime(),
                            new Date(condition.lastTransitionTime.toString()).getTime(),
                          )
                        : null}
                    </td>
                    <td>{condition.reason}</td>
                    <td>{condition.message}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  );
};

export default Conditions;
