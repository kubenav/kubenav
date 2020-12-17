import { IonGrid, IonRow } from '@ionic/react';
import { V1Namespace } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface INamespaceDetailsProps extends RouteComponentProps {
  item: V1Namespace;
  section: string;
  type: string;
}

const NamespaceDetails: React.FunctionComponent<INamespaceDetailsProps> = ({ item, type }: INamespaceDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.finalizers"
            title="Finalizers"
            value={(finalizers) => finalizers.join(', ')}
            defaultValue="-"
          />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.phase" title="Phase" />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {context.settings.prometheusEnabled ? (
        <Dashboard
          title="Metrics"
          charts={[
            {
              title: 'CPU Usage',
              unit: 'Cores',
              size: {
                xs: '12',
                sm: '12',
                md: '12',
                lg: '12',
                xl: '6',
              },
              type: 'area',
              queries: [
                {
                  label: 'Current',
                  query: `sum(irate(container_cpu_usage_seconds_total{job="kubelet", namespace="${
                    item.metadata ? item.metadata.name : ''
                  }", image!="", container!="", container!="POD"}[4m]))`,
                },
                {
                  label: 'Requested',
                  query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="cpu", container!=""})`,
                },
                {
                  label: 'Limit',
                  query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="cpu", container!=""})`,
                },
              ],
            },
            {
              title: 'Memory Usage',
              unit: 'MiB',
              size: {
                xs: '12',
                sm: '12',
                md: '12',
                lg: '12',
                xl: '6',
              },
              type: 'area',
              queries: [
                {
                  label: 'Current',
                  query: `sum(container_memory_usage_bytes{job="kubelet", namespace="${
                    item.metadata ? item.metadata.name : ''
                  }", container!="", container!="POD"}) / 1024 / 1024`,
                },
                {
                  label: 'Requested',
                  query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="memory", container!=""}) / 1024 / 1024`,
                },
                {
                  label: 'Limit',
                  query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="memory", container!=""}) / 1024 / 1024`,
                },
                {
                  label: 'Cache',
                  query: `sum(container_memory_cache{job="kubelet", namespace="${
                    item.metadata ? item.metadata.name : ''
                  }", container!="", container!="POD"}) / 1024 / 1024`,
                },
              ],
            },
          ]}
        />
      ) : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
    </IonGrid>
  );
};

export default NamespaceDetails;
