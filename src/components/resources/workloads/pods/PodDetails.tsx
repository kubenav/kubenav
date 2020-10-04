import { IonCol, IonGrid, IonLabel, IonRouterLink, IonRow } from '@ionic/react';
import { V1Container, V1ContainerPort, V1Pod } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';
import { useQuery } from 'react-query';

import { IContext, IPodMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { IS_INCLUSTER } from '../../../../utils/constants';
import { AppContext } from '../../../../utils/context';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import List from '../../misc/list/List';
import Containers from './containers/Containers';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Port from '../../misc/template/Port';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';
import { getReady, getRestarts, getStatus } from './podHelpers';

interface IPodDetailsProps extends RouteComponentProps {
  item: V1Pod;
  section: string;
  type: string;
}

const PodDetails: React.FunctionComponent<IPodDetailsProps> = ({ item, type }: IPodDetailsProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { data } = useQuery<IPodMetrics, Error>(
    ['Pod', cluster ? cluster.id : '', item, type],
    async () =>
      await kubernetesRequest(
        'GET',
        `/apis/metrics.k8s.io/v1beta1/namespaces/${
          item.metadata && item.metadata.namespace ? item.metadata.namespace : ''
        }/pods/${item.metadata && item.metadata.name ? item.metadata.name : ''}`,
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    { ...context.settings.queryConfig, refetchInterval: context.settings.queryRefetchInterval },
  );

  const status = getStatus(item);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.priority" title="Priority" />
          <Row
            obj={item}
            objKey="spec.nodeName"
            title="Node"
            value={(nodeName: string) => (
              <IonRouterLink
                routerLink={`/resources/cluster/nodes/${item.metadata ? item.metadata.namespace : ''}/${nodeName}`}
                routerDirection="forward"
              >
                {nodeName}
              </IonRouterLink>
            )}
          />
          <Row
            obj={item}
            objKey="spec.serviceAccountName"
            title="Service Account"
            value={(serviceAccountName: string) => (
              <IonRouterLink
                routerLink={`/resources/config-and-storage/serviceaccounts/${
                  item.metadata ? item.metadata.namespace : ''
                }/${serviceAccountName}`}
                routerDirection="forward"
              >
                {serviceAccountName}
              </IonRouterLink>
            )}
          />
          <Row obj={item} objKey="spec.restartPolicy" title="Restart Policy" />
          <Row obj={item} objKey="spec.terminationGracePeriodSeconds" title="Termination Grace Period Seconds" />
          <Row
            obj={item}
            objKey="spec.containers"
            title="Ports"
            value={(containers) =>
              containers.map((container: V1Container) => {
                if (container.ports) {
                  return container.ports.map((port: V1ContainerPort, index: number) => {
                    return (
                      <Port
                        key={index}
                        enabled={!IS_INCLUSTER && (port.protocol === undefined || port.protocol === 'TCP')}
                        name={item.metadata && item.metadata.name ? item.metadata.name : ''}
                        namespace={item.metadata && item.metadata.namespace ? item.metadata.namespace : ''}
                        selector=""
                        port={port.containerPort}
                      >
                        <IonLabel>
                          {container.name}: {port.containerPort}
                          {port.protocol ? `/${port.protocol}` : ''}
                          {port.name ? ` (${port.name})` : ''}
                        </IonLabel>
                      </Port>
                    );
                  });
                }

                return null;
              })
            }
          />
        </Configuration>

        <Status>
          <IonRow>
            <IonCol size="auto">
              <b>Ready:</b>
            </IonCol>
            <IonCol>{getReady(item)}</IonCol>
          </IonRow>
          <IonRow>
            <IonCol size="auto">
              <b>Restarts:</b>
            </IonCol>
            <IonCol>{getRestarts(item)}</IonCol>
          </IonRow>
          <Row obj={status} objKey="phase" title="Phase" />
          {status.reason ? <Row obj={status} objKey="reason" title="Reason" /> : null}
          <Row obj={item} objKey="status.qosClass" title="QoS" />
          <Row obj={item} objKey="status.podIP" title="Pod IP" />
          <Row obj={item} objKey="status.hostIP" title="Host IP" />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      <IonRow>
        {item.spec && item.spec.initContainers && item.spec.initContainers.length > 0 ? (
          <Containers
            containers={item.spec.initContainers}
            logs={true}
            terminal={true}
            metrics={data ? data.containers : undefined}
            name={item.metadata ? item.metadata.name : ''}
            namespace={item.metadata ? item.metadata.namespace : ''}
            statuses={item.status && item.status.initContainerStatuses ? item.status.initContainerStatuses : undefined}
            title="Init Containers"
          />
        ) : null}
        {item.spec && item.spec.containers && item.spec.containers.length > 0 ? (
          <Containers
            containers={item.spec.containers}
            logs={true}
            terminal={true}
            metrics={data ? data.containers : undefined}
            name={item.metadata ? item.metadata.name : ''}
            namespace={item.metadata ? item.metadata.namespace : ''}
            statuses={item.status && item.status.containerStatuses ? item.status.containerStatuses : undefined}
            title="Containers"
          />
        ) : null}
      </IonRow>

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} />
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
          variables={[
            {
              name: 'Container',
              label: 'container',
              query: `kube_pod_container_info{namespace="${item.metadata ? item.metadata.namespace : ''}", pod="${
                item.metadata ? item.metadata.name : ''
              }"}`,
              values: [],
              value: '',
              allowAll: true,
            },
          ]}
          charts={[
            {
              title: 'CPU Usage',
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
                    item.metadata ? item.metadata.namespace : ''
                  }", image!="", pod="${
                    item.metadata ? item.metadata.name : ''
                  }", container=~"{{ .Container }}", container!="POD"}[4m]))`,
                },
                {
                  label: 'Requested',
                  query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", resource="cpu", pod="${
                    item.metadata ? item.metadata.name : ''
                  }", container=~"{{ .Container }}"})`,
                },
                {
                  label: 'Limit',
                  query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", resource="cpu", pod="${
                    item.metadata ? item.metadata.name : ''
                  }", container=~"{{ .Container }}"})`,
                },
              ],
            },
            {
              title: 'Memory Usage (in MiB)',
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
                    item.metadata ? item.metadata.namespace : ''
                  }", pod="${
                    item.metadata ? item.metadata.name : ''
                  }", container=~"{{ .Container }}", container!="POD"}) / 1024 / 1024`,
                },
                {
                  label: 'Requested',
                  query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", resource="memory", pod="${
                    item.metadata ? item.metadata.name : ''
                  }", container=~"{{ .Container }}"}) / 1024 / 1024`,
                },
                {
                  label: 'Limit',
                  query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", resource="memory", pod="${
                    item.metadata ? item.metadata.name : ''
                  }", container=~"{{ .Container }}"}) / 1024 / 1024`,
                },
                {
                  label: 'Cache',
                  query: `sum(container_memory_cache{job="kubelet", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", pod="${
                    item.metadata ? item.metadata.name : ''
                  }", container=~"{{ .Container }}", container!="POD"}) / 1024 / 1024`,
                },
              ],
            },
            {
              title: 'Network I/O (in MiB)',
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
                  label: 'RX',
                  query: `sort_desc(sum by (pod) (irate(container_network_receive_bytes_total{job="kubelet", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", pod="${item.metadata ? item.metadata.name : ''}"}[4m]))) / 1024 / 1024`,
                },
                {
                  label: 'TX',
                  query: `sort_desc(sum by (pod) (irate(container_network_transmit_bytes_total{job="kubelet", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", pod="${item.metadata ? item.metadata.name : ''}"}[4m]))) / 1024 / 1024`,
                },
              ],
            },
            {
              title: 'Total Restarts',
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
                  label: 'Restarts',
                  query: `max(kube_pod_container_status_restarts_total{job="kube-state-metrics", namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", pod="${item.metadata ? item.metadata.name : ''}", container=~"{{ .Container }}"})`,
                },
              ],
            },
          ]}
        />
      ) : null}
    </IonGrid>
  );
};

export default PodDetails;
