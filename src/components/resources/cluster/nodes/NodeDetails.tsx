import { IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1Node, V1NodeAddress } from '@kubernetes/client-node';
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext, INodeMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { formatResourceValue } from '../../../../utils/helpers';
import AddSSH from '../../../plugins/terminal/AddSSH';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import List from '../../misc/list/List';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';
import { getStatus } from './nodeHelpers';

interface INodeDetailsProps extends RouteComponentProps {
  item: V1Node;
  section: string;
  type: string;
}

const NodeDetails: React.FunctionComponent<INodeDetailsProps> = ({ item, type }: INodeDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  const [metrics, setMetrics] = useState<INodeMetrics>();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const data: INodeMetrics = await kubernetesRequest(
          'GET',
          `/apis/metrics.k8s.io/v1beta1/nodes/${item.metadata && item.metadata ? item.metadata.name : ''}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );
        setMetrics(data);
      } catch (err) {
        // TODO: Implement error handling.
      }
    };

    if (item.metadata && item.metadata.name) {
      fetchData();
    }
  }, [item, type, context]);

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
                            <td>{metrics && metrics.usage ? formatResourceValue(key, metrics.usage[key]) : null}</td>
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
    </IonGrid>
  );
};

export default NodeDetails;
