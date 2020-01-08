import {
  IonChip,
  IonGrid, IonLabel,
  IonRow,
} from '@ionic/react';
import { V1Service, V1ServicePort } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { matchLabels } from '../../../utils';
import Configuration from '../Configuration';
import List from '../List';
import Metadata from '../Metadata';
import Row from '../Row';
import Status from '../Status';

interface IServiceProps extends RouteComponentProps {
  item: V1Service;
  section: string;
  type: string;
}

const Service: React.FunctionComponent<IServiceProps> = ({ item, type }) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.selector"
            title="Selectors"
            value={(value) => Object.keys(value).map((label) => {
              return (
                <IonChip key={label} className="unset-chip-height">
                  <IonLabel>{label}: {value[label]}</IonLabel>
                </IonChip>
              )
            })}
          />
          <Row obj={item} objKey="spec.type" title="Type" />
          <Row
            obj={item}
            objKey="spec.ports"
            title="Ports"
            value={(ports) => ports.map((port: V1ServicePort, index) => {
              return (
                <IonChip key={index} className="unset-chip-height">
                  <IonLabel>{port.name} {port.port}{port.nodePort}/{port.protocol} -> {port.targetPort}</IonLabel>
                </IonChip>
              )
            })}
          />
          <Row obj={item} objKey="spec.sessionAffinity" title="Session Affinity" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="spec.clusterIP" title="Cluster IP" defaultValue="None" />
          <Row
            obj={item}
            objKey="spec.externalIPs"
            title="External IPs"
            value={(externalIPs) => externalIPs.map((externalIP: string, index) => {
              return (
                <IonChip key={index} className="unset-chip-height">
                  <IonLabel>{externalIP}</IonLabel>
                </IonChip>
              )
            })}
            defaultValue="None"
          />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? (
        <IonRow>
          <List name="Endpoints" section="workloads" type="pods" namespace={item.metadata.namespace} selector={`labelSelector=${matchLabels(item.spec.selector)}`} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List name="Events" section="cluster" type="events" namespace={item.metadata.namespace} selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
        </IonRow>
      ) : null}
    </IonGrid>
  )
};

export default Service;
