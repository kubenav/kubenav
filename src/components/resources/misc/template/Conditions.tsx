import { IonCardContent, IonCardHeader, IonCardTitle, IonCol } from '@ionic/react';
import React from 'react';

import { getProperty } from '../../../../utils/helpers';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import Condition, { TCondition } from './Condition';

interface IConditions {
  [key: string]: TCondition;
}

interface IPodConditionsProps {
  conditions: TCondition[] | IConditions;
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
                {conditions instanceof Array
                  ? conditions.map((condition, index) => <Condition key={index} condition={condition} />)
                  : Object.keys(conditions).map((key) => <Condition key={key} condition={conditions[key]} />)}
              </tbody>
            </table>
          </div>
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  );
};

export default Conditions;
