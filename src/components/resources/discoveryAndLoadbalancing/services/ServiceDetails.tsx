import { IonChip, IonGrid, IonLabel, IonRow } from '@ionic/react';
import { V1LoadBalancerIngress, V1Service, V1ServicePort } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { matchLabels } from '../../../../utils/helpers';
import List from '../../misc/List';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface IServiceDetailsProps extends RouteComponentProps {
  item: V1Service;
  section: string;
  type: string;
}

const ServiceDetails: React.FunctionComponent<IServiceDetailsProps> = ({ item, type }: IServiceDetailsProps) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.selector"
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
          <Row obj={item} objKey="spec.type" title="Type" />
          <Row
            obj={item}
            objKey="spec.ports"
            title="Ports"
            value={(ports) =>
              ports.map((port: V1ServicePort, index) => {
                return (
                  <IonChip key={index} className="unset-chip-height">
                    <IonLabel>
                      {port.name} {port.port} &nbsp;
                      {port.nodePort}/{port.protocol} &gt; {port.targetPort}
                    </IonLabel>
                  </IonChip>
                );
              })
            }
          />
          <Row
            obj={item}
            objKey="spec.loadBalancerSourceRanges"
            title="Load Balancer Source Ranges"
            value={(loadBalancerSourceRanges) =>
              loadBalancerSourceRanges.map((loadBalancerSourceRange: string, index) => {
                return (
                  <IonChip key={index} className="unset-chip-height">
                    <IonLabel>{loadBalancerSourceRange}</IonLabel>
                  </IonChip>
                );
              })
            }
          />
          <Row obj={item} objKey="spec.externalTrafficPolicy" title="External Traffic Policy" />
          <Row obj={item} objKey="spec.healthCheckNodePort" title="Health Check Node Port" />
          <Row obj={item} objKey="spec.publishNotReadyAddresses" title="Publish Not Ready Addresses" />
          <Row obj={item} objKey="spec.sessionAffinity" title="Session Affinity" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="spec.clusterIP" title="Cluster IP" defaultValue="None" />
          <Row
            obj={item}
            objKey="spec.externalIPs"
            title="External IPs"
            value={(externalIPs) =>
              externalIPs.map((externalIP: string, index) => {
                return (
                  <IonChip key={index} className="unset-chip-height">
                    <IonLabel>{externalIP}</IonLabel>
                  </IonChip>
                );
              })
            }
            defaultValue="None"
          />
          <Row obj={item} objKey="spec.externalName" title="External Name" defaultValue="None" />
          <Row obj={item} objKey="spec.loadBalancerIP" title="Load Balancer IP" />
          <Row
            obj={item}
            objKey="status.loadBalancer.ingress"
            title="Load Balancer"
            value={(ingress: V1LoadBalancerIngress[]) => ingress.map((ing) => Object.values(ing).join(', '))}
          />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? (
        <IonRow>
          <List
            name="Endpoints"
            section="workloads"
            type="pods"
            namespace={item.metadata.namespace}
            selector={`labelSelector=${matchLabels(item.spec.selector)}`}
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

export default ServiceDetails;
