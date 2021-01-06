import { IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1Node, V1NodeAddress } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';
import { useQuery } from 'react-query';

import { IContext, INodeMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { formatResourceValue } from '../../../../utils/helpers';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import List from '../../misc/list/List';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';
import AddSSH from './AddSSH';
import { getStatus } from './nodeHelpers';
import NodeMetrics from './NodeMetrics';

interface INodeDetailsProps extends RouteComponentProps {
  item: V1Node;
  section: string;
  type: string;
}

const NodeDetails: React.FunctionComponent<INodeDetailsProps> = ({ item, type }: INodeDetailsProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { data } = useQuery<INodeMetrics, Error>(
    ['NodeDetails', cluster ? cluster.id : '', item, type],
    async () =>
      await kubernetesRequest(
        'GET',
        `/apis/metrics.k8s.io/v1beta1/nodes/${item.metadata && item.metadata.name ? item.metadata.name : ''}`,
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    { ...context.settings.queryConfig, refetchInterval: context.settings.queryRefetchInterval },
  );

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="status.nodeInfo.architecture" title="Architecture" />
          <Row obj={item} objKey="status.nodeInfo.bootID" title="Boot ID" />
          <Row obj={item} objKey="status.nodeInfo.containerRuntimeVersion" title="Container Runtime Version" />
          <Row obj={item} objKey="status.nodeInfo.kernelVersion" title="Kernel Version" />
          <Row obj={item} objKey="status.nodeInfo.kubeProxyVersion" title="KubeProxy Version" />
          <Row obj={item} objKey="status.nodeInfo.kubeletVersion" title="Kubelet Version" />
          <Row obj={item} objKey="status.nodeInfo.machineID" title="Machine ID" />
          <Row obj={item} objKey="status.nodeInfo.operatingSystem" title="Operating System" />
          <Row obj={item} objKey="status.nodeInfo.osImage" title="OS Image" />
          <Row obj={item} objKey="spec.podCIDR" title="Pod CIDR" />
          <Row obj={item} objKey="status.nodeInfo.systemUUID" title="System UUID" />
        </Configuration>

        <Status>
          <IonRow>
            <IonCol size="auto">
              <b>Status:</b>
            </IonCol>
            <IonCol>{getStatus(item)}</IonCol>
          </IonRow>
          <Row
            obj={item}
            objKey="status.addresses"
            title="Addresses"
            value={(addresses: V1NodeAddress[]) =>
              addresses.map((address, index) => (
                <AddSSH
                  key={index}
                  type={address.type}
                  node={item.metadata && item.metadata.name ? item.metadata.name : ''}
                  ip={address.address}
                />
              ))
            }
          />
          <Row obj={item} objKey="status.phase" title="Phase" />
          <Row
            obj={item}
            objKey="spec.unschedulable"
            title="Unschedulable"
            value={(unschedulable) => (unschedulable ? 'true' : 'false')}
          />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {data && context.settings.enablePodMetrics ? <NodeMetrics item={item} metrics={data} /> : null}

      <IonRow>
        {item.status && item.status.capacity && item.status.allocatable ? (
          <IonCol>
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Resources</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <div className="table">
                  <table>
                    <thead>
                      <tr>
                        <th>Key</th>
                        <th>Capacity</th>
                        <th>Allocatable</th>
                        <th>Usage</th>
                      </tr>
                    </thead>
                    <tbody>
                      {Object.keys(item.status.capacity).map((key) => {
                        return (
                          <tr key={key}>
                            <td>{key}</td>
                            <td>
                              {formatResourceValue(
                                key,
                                item.status && item.status.capacity ? item.status.capacity[key] : '',
                              )}
                            </td>
                            <td>
                              {formatResourceValue(
                                key,
                                item.status && item.status.allocatable ? item.status.allocatable[key] : '',
                              )}
                            </td>
                            <td>{data && data.usage ? formatResourceValue(key, data.usage[key]) : null}</td>
                          </tr>
                        );
                      })}
                    </tbody>
                  </table>
                </div>
              </IonCardContent>
            </IonCardEqualHeight>
          </IonCol>
        ) : null}
      </IonRow>

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name ? (
        <IonRow>
          <List
            name="Pods"
            section="workloads"
            type="pods"
            namespace=""
            parent={item}
            selector={`fieldSelector=spec.nodeName=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace=""
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
                  query: `sum(max(rate(container_cpu_usage_seconds_total{id="/", node="${
                    item.metadata ? item.metadata.name : ''
                  }"}[2m])))`,
                },
                {
                  label: 'Requested',
                  query: `sum(kube_pod_container_resource_requests{node="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="cpu", container!=""})`,
                },
                {
                  label: 'Limit',
                  query: `sum(kube_pod_container_resource_limits{node="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="cpu", container!=""})`,
                },
                {
                  label: 'Allocatable',
                  query: `sum(kube_node_status_allocatable_cpu_cores{node="${
                    item.metadata ? item.metadata.name : ''
                  }"})`,
                },
              ],
            },
            {
              title: 'Memory Usage',
              unit: 'GiB',
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
                  query: `sum(max(container_memory_working_set_bytes{id="/", node="${
                    item.metadata ? item.metadata.name : ''
                  }"})) / 1024 / 1024 / 1024`,
                },
                {
                  label: 'Requested',
                  query: `sum(kube_pod_container_resource_requests{node="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="memory", container!=""}) / 1024 / 1024 / 1024`,
                },
                {
                  label: 'Limit',
                  query: `sum(kube_pod_container_resource_limits{node="${
                    item.metadata ? item.metadata.name : ''
                  }", resource="memory", container!=""}) / 1024 / 1024 / 1024`,
                },
                {
                  label: 'Allocatable',
                  query: `sum(kube_node_status_allocatable_memory_bytes{node="${
                    item.metadata ? item.metadata.name : ''
                  }"}) / 1024 / 1024 / 1024`,
                },
              ],
            },
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
                  label: 'Current',
                  query: `count(kube_pod_info{node="${item.metadata ? item.metadata.name : ''}"})`,
                },
                {
                  label: 'Allocatable',
                  query: `sum(kube_node_status_allocatable_pods{node="${item.metadata ? item.metadata.name : ''}"})`,
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

export default NodeDetails;
