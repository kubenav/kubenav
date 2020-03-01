import {
  IonChip,
  IonGrid, IonLabel,
  IonRow,
} from '@ionic/react';
import { V1StatefulSet, V1StatefulSetUpdateStrategy } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import {labelSelector} from '../../../../utils/helpers';
import Conditions from '../../../kubernetes/Conditions';
import Configuration from '../../../kubernetes/Configuration';
import List from '../../../kubernetes/List';
import Metadata from '../../../kubernetes/Metadata';
import PodTemplate from '../../../kubernetes/PodTemplate';
import Row from '../../../kubernetes/Row';
import Status from '../../../kubernetes/Status';

interface IStatefulSetDetailsProps extends RouteComponentProps {
  item: V1StatefulSet;
  section: string;
  type: string;
}

const StatefulSetDetails: React.FunctionComponent<IStatefulSetDetailsProps> = ({ item, type }) => {
  const updateStrategy = (strategy: V1StatefulSetUpdateStrategy): string => {
    if (strategy.rollingUpdate && strategy.rollingUpdate.partition) {
      return `${strategy.type ? `${strategy.type}: ` : ''}Partition ${strategy.rollingUpdate.partition}`;
    }

    return strategy.type ? strategy.type : '';
  };

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.updateStrategy" title="Update Strategy" value={updateStrategy} />
          <Row
            obj={item}
            objKey="spec.selector.matchLabels"
            title="Selectors"
            value={(value) => Object.keys(value).map((label) => {
              return (
                <IonChip key={label} className="unset-chip-height">
                  <IonLabel>{label}: {value[label]}</IonLabel>
                </IonChip>
              )
            })}
          />
          <Row obj={item} objKey="spec.serviceName" title="Service Name" />
          <Row obj={item} objKey="spec.revisionHistoryLimit" title="Revision History Limit" />
          <Row obj={item} objKey="spec.podManagementPolicy" title="Pod Management Policy" />
          <Row obj={item} objKey="spec.replicas" title="Replicas" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.replicas" title="Total Replicas" />
          <Row obj={item} objKey="status.currentReplicas" title="Current Replicas" />
          <Row obj={item} objKey="status.readyReplicas" title="Ready Replicas" />
          <Row obj={item} objKey="status.updatedReplicas" title="Updated Replicas" />
          <Row obj={item} objKey="status.currentRevision" title="Current Revision" />
          <Row obj={item} objKey="status.updateRevision" title="Update Revision" />
          <Row obj={item} objKey="status.observedGeneration" title="Observed Generation" />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? (
        <IonRow>
          <List name="Pods" section="workloads" type="pods" namespace={item.metadata.namespace} selector={`labelSelector=${labelSelector(item.spec.selector)}`} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List name="Events" section="cluster" type="events" namespace={item.metadata.namespace} selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
        </IonRow>
      ) : null}

      {item.spec && item.spec.template ? <PodTemplate template={item.spec.template} /> : null}
    </IonGrid>
  )
};

export default StatefulSetDetails;
