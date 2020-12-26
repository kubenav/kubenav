import { IonChip, IonGrid, IonLabel, IonRow } from '@ionic/react';
import { V1DaemonSet, V1DaemonSetUpdateStrategy } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { labelSelector } from '../../../../utils/helpers';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import List from '../../misc/list/List';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface IDaemonSetDetailsProps extends RouteComponentProps {
  item: V1DaemonSet;
  section: string;
  type: string;
}

const DaemonSetDetails: React.FunctionComponent<IDaemonSetDetailsProps> = ({ item, type }: IDaemonSetDetailsProps) => {
  const context = useContext<IContext>(AppContext);

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
          <Row
            obj={item}
            objKey="spec.template.spec.nodeSelector"
            title="Node Selectors"
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
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.desiredNumberScheduled" title="Desired Number of Pods" />
          <Row obj={item} objKey="status.currentNumberScheduled" title="Current Number of Pods" />
          <Row obj={item} objKey="status.numberReady" title="Number of Ready Pods" />
          <Row obj={item} objKey="status.updatedNumberScheduled" title="Updated Number of Pods" />
          <Row obj={item} objKey="status.numberAvailable" title="Number of Available Pods" />
          <Row obj={item} objKey="status.numberUnavailable" title="Number of Unavailable Pods" />
          <Row obj={item} objKey="status.numberMisscheduled" title="Number of Misscheduled Pods" />
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
              unit: '',
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
                  query: `kube_daemonset_status_desired_number_scheduled{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", daemonset="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Current',
                  query: `kube_daemonset_status_current_number_scheduled{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", daemonset="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Ready',
                  query: `kube_daemonset_status_number_ready{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", daemonset="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Misscheduled',
                  query: `kube_daemonset_status_number_misscheduled{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", daemonset="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Updated',
                  query: `kube_daemonset_updated_number_scheduled{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", daemonset="${item.metadata ? item.metadata.name : ''}"}`,
                },
              ],
            },
          ]}
        />
      ) : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
      {context.settings.jaegerEnabled ? <TraceList item={item} /> : null}
    </IonGrid>
  );
};

export default DaemonSetDetails;
