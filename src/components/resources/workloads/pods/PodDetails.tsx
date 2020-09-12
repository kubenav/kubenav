import { IonCardHeader, IonCardTitle, IonCol, IonGrid, IonLabel, IonRouterLink, IonRow } from '@ionic/react';
import { V1Container, V1ContainerPort, V1Pod } from '@kubernetes/client-node';
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext, IPodMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { IS_INCLUSTER } from '../../../../utils/constants';
import { AppContext } from '../../../../utils/context';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import Prometheus from '../../../plugins/Prometheus';
import List from '../../misc/list/List';
import Containers from './Containers';
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

  const [metrics, setMetrics] = useState<IPodMetrics>();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data: IPodMetrics = await kubernetesRequest(
          'GET',
          `/apis/metrics.k8s.io/v1beta1/namespaces/${
            item.metadata && item.metadata.namespace ? item.metadata.namespace : ''
          }/pods/${item.metadata && item.metadata.name ? item.metadata.name : ''}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );
        setMetrics(data);
      } catch (err) {
        // TODO: Implement error handling.
      }
    };

    if (item.metadata && item.metadata.namespace && item.metadata.name) {
      fetchData();
    }
  }, [item, type, context]);

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
                          {container.name}: {port.containerPort} {port.name ? `(${port.name})` : ''}
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
            metrics={metrics ? metrics.containers : undefined}
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
            metrics={metrics ? metrics.containers : undefined}
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
        <IonRow>
          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Memory Usage (in MiB)</IonCardTitle>
              </IonCardHeader>
              <Prometheus
                queries={[
                  {
                    label: 'Current',
                    query: `sum(container_memory_usage_bytes{job="kubelet", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", pod="${
                      item.metadata ? item.metadata.name : ''
                    }", container!="", container!="POD"}) / 1024 / 1024`,
                  },
                  {
                    label: 'Requested',
                    query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", resource="memory", pod="${item.metadata ? item.metadata.name : ''}"}) / 1024 / 1024`,
                  },
                  {
                    label: 'Limit',
                    query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", resource="memory", pod="${item.metadata ? item.metadata.name : ''}"}) / 1024 / 1024`,
                  },
                  {
                    label: 'Cache',
                    query: `sum(container_memory_cache{job="kubelet", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", pod="${
                      item.metadata ? item.metadata.name : ''
                    }", container!="", container!="POD"}) / 1024 / 1024`,
                  },
                ]}
              />
            </IonCardEqualHeight>
          </IonCol>

          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>CPU Usage</IonCardTitle>
              </IonCardHeader>
              <Prometheus
                queries={[
                  {
                    label: 'Current',
                    query: `sum(irate(container_cpu_usage_seconds_total{job="kubelet", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", image!="", pod="${
                      item.metadata ? item.metadata.name : ''
                    }", container!="", container!="POD"}[4m]))`,
                  },
                  {
                    label: 'Requested',
                    query: `sum(kube_pod_container_resource_requests{job="kube-state-metrics", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", resource="cpu", pod="${item.metadata ? item.metadata.name : ''}"})`,
                  },
                  {
                    label: 'Limit',
                    query: `sum(kube_pod_container_resource_limits{job="kube-state-metrics", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", resource="cpu", pod="${item.metadata ? item.metadata.name : ''}"})`,
                  },
                ]}
              />
            </IonCardEqualHeight>
          </IonCol>

          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Network I/O (in MiB)</IonCardTitle>
              </IonCardHeader>
              <Prometheus
                queries={[
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
                ]}
              />
            </IonCardEqualHeight>
          </IonCol>

          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Total Restarts</IonCardTitle>
              </IonCardHeader>
              <Prometheus
                queries={[
                  {
                    label: 'Restarts',
                    query: `max(kube_pod_container_status_restarts_total{job="kube-state-metrics", namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", pod="${item.metadata ? item.metadata.name : ''}"})`,
                  },
                ]}
              />
            </IonCardEqualHeight>
          </IonCol>
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default PodDetails;
