import { IonChip, IonGrid, IonLabel, IonRow } from '@ionic/react';
import { V1beta1PodDisruptionBudget } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { labelSelector } from '../../../../utils/helpers';
import List from '../../misc/List';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface IPodDisruptionBudgetDetailsProps extends RouteComponentProps {
  item: V1beta1PodDisruptionBudget;
  section: string;
  type: string;
}

const PodDisruptionBudgetDetails: React.FunctionComponent<IPodDisruptionBudgetDetailsProps> = ({
  item,
  type,
}: IPodDisruptionBudgetDetailsProps) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.selector.matchLabels"
            title="Selectors"
            value={(value) =>
              Object.keys(value).map((label) => {
                return (
                  <IonChip key={label} className="unset-chip-height">
                    <IonLabel>
                      {label}: {value[label]}
                    </IonLabel>
                  </IonChip>
                );
              })
            }
          />
          <Row obj={item} objKey="spec.minAvailable" title="Min Available" />
          <Row obj={item} objKey="spec.maxUnavailable" title="Max Unavailable" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.currentHealthy" title="Current Healthy" />
          <Row obj={item} objKey="status.desiredHealthy" title="Desired Healthy" />
          <Row obj={item} objKey="status.disruptionsAllowed" title="Disruptions Allowed" />
          <Row obj={item} objKey="status.expectedPods" title="Expected Pods" />
          <Row obj={item} objKey="status.observedGeneration" title="Observed Generation" />
          <Row
            obj={item}
            objKey="status.disruptedPods"
            title="Disrupted Pods"
            value={(value) =>
              Object.keys(value).map((disruptedPod) => {
                return (
                  <IonChip key={disruptedPod} className="unset-chip-height">
                    <IonLabel>
                      {disruptedPod}: {value[disruptedPod]}
                    </IonLabel>
                  </IonChip>
                );
              })
            }
          />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? (
        <IonRow>
          <List
            name="Pods"
            section="workloads"
            type="pods"
            namespace={item.metadata.namespace}
            selector={`labelSelector=${labelSelector(item.spec.selector)}`}
          />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace={item.metadata.namespace}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default PodDisruptionBudgetDetails;
