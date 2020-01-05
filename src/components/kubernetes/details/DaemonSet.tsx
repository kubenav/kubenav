import {
  IonChip,
  IonGrid,
  IonLabel,
  IonRow,
} from '@ionic/react';
import { V1DaemonSet, V1DaemonSetUpdateStrategy } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { labelSelector } from '../../../utils';
import Configuration from '../Configuration';
import List from '../List';
import Metadata from '../Metadata';
import PodTemplate from '../PodTemplate';
import Row from '../Row';
import Status from '../Status';

interface DaemonSetProps extends RouteComponentProps {
  item: V1DaemonSet;
  section: string;
  type: string;
}

const DaemonSet: React.FunctionComponent<DaemonSetProps> = ({ item, type }) => {
  const updateStrategy = (strategy: V1DaemonSetUpdateStrategy): string => {
    if (strategy.rollingUpdate && strategy.rollingUpdate.maxUnavailable) {
      return `${strategy.type ? `${strategy.type}: ` : ''}Max Unavailable ${strategy.rollingUpdate.maxUnavailable}`;
    }

    return strategy.type ? strategy.type : '';
  };

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.minReadySeconds" title="Min Ready Seconds" />
          <Row obj={item} objKey="spec.updateStrategy" title="Update Strategy" value={updateStrategy} />
          <Row obj={item} objKey="spec.revisionHistoryLimit" title="Revision History Limit" />
          <Row obj={item} objKey="spec.selector.matchLabels" title="Selectors" value={(value) => Object.keys(value).map((label) => <IonChip key={label} className="unset-chip-height">
            <IonLabel>{label}: {value[label]}</IonLabel>
          </IonChip>)} />
          <Row obj={item} objKey="spec.template.spec.nodeSelector" title="Node Selectors" value={(value) => Object.keys(value).map((label) => <IonChip key={label} className="unset-chip-height">
            <IonLabel>{label}: {value[label]}</IonLabel>
          </IonChip>)} />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.currentNumberScheduled" title="Current Number Scheduled" />
          <Row obj={item} objKey="status.desiredNumberScheduled" title="Desired Number Scheduled" />
          <Row obj={item} objKey="status.numberAvailable" title="Number Available" />
          <Row obj={item} objKey="status.numberMisscheduled" title="Number Misscheduled" />
          <Row obj={item} objKey="status.numberReady" title="Number Ready" />
          <Row obj={item} objKey="status.numberUnavailable" title="Number Unavailable" />
          <Row obj={item} objKey="status.updatedNumberScheduled" title="Updated Number Scheduled" />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? <IonRow>
        <List name="Pods" section="workloads" type="pods" namespace={item.metadata.namespace} selector={`labelSelector=${labelSelector(item.spec.selector)}`} />
      </IonRow> : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? <IonRow>
        <List name="Events" section="cluster" type="events" namespace={item.metadata.namespace} selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
      </IonRow> : null}

      {item.spec && item.spec.template ? <PodTemplate template={item.spec.template} /> : null}
    </IonGrid>
  )
};

export default DaemonSet;
