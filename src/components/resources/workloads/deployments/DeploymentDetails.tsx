import { IonChip, IonGrid, IonLabel, IonRow } from '@ionic/react';
import { V1Deployment, V1DeploymentStrategy } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { labelSelector } from '../../../../utils/helpers';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import List from '../../misc/list/List';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface IDeploymentDetailsProps extends RouteComponentProps {
  item: V1Deployment;
  section: string;
  type: string;
}

const DeploymentDetails: React.FunctionComponent<IDeploymentDetailsProps> = ({
  item,
  type,
}: IDeploymentDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  const updateStrategy = (strategy: V1DeploymentStrategy): string => {
    if (strategy.rollingUpdate && strategy.rollingUpdate.maxSurge && strategy.rollingUpdate.maxUnavailable) {
      return `${strategy.type ? `${strategy.type}: ` : ''}Max Surge ${
        strategy.rollingUpdate.maxSurge
      }, Max Unavailable ${strategy.rollingUpdate.maxUnavailable}`;
    }

    return strategy.type ? strategy.type : '';
  };

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.strategy" title="Update Strategy" value={updateStrategy} />
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
          <Row obj={item} objKey="spec.minReadySeconds" title="Min Ready Seconds" />
          <Row obj={item} objKey="spec.revisionHistoryLimit" title="Revision History Limit" />
          <Row obj={item} objKey="spec.replicas" title="Replicas" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.replicas" title="Current Replicas" />
          <Row obj={item} objKey="status.readyReplicas" title="Ready Replicas" />
          <Row obj={item} objKey="status.updatedReplicas" title="Updated Replicas" />
          <Row obj={item} objKey="status.availableReplicas" title="Available Replicas" />
          <Row obj={item} objKey="status.unavailableReplicas" title="Unavailable Replicas" />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? (
        <IonRow>
          <List
            name="Pods"
            section="workloads"
            type="pods"
            namespace={item.metadata.namespace}
            parent={item}
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
            parent={item}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}

      {context.settings.prometheusEnabled ? (
        <Dashboard
          title="Metrics"
          charts={[
            {
              title: 'Pods',
              size: {
                xs: '12',
                sm: '12',
                md: '12',
                lg: '12',
                xl: '12',
              },
              type: 'area',
              queries: [
                {
                  label: 'Desired',
                  query: `kube_deployment_spec_replicas{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", deployment="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Current',
                  query: `kube_deployment_status_replicas{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", deployment="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Updated',
                  query: `kube_deployment_status_replicas_updated{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", deployment="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Available',
                  query: `kube_deployment_status_replicas_available{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", deployment="${item.metadata ? item.metadata.name : ''}"}`,
                },
              ],
            },
          ]}
        />
      ) : null}
    </IonGrid>
  );
};

export default DeploymentDetails;
