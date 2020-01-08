import {
  IonGrid,
  IonRow,
} from '@ionic/react';
import { V1PersistentVolumeClaim } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Conditions from '../Conditions';
import Configuration from '../Configuration';
import List from '../List';
import Metadata from '../Metadata';
import Row from '../Row';
import Status from '../Status';

interface IPersistentVolumeClaimProps extends RouteComponentProps {
  item: V1PersistentVolumeClaim;
  section: string;
  type: string;
}

const PersistentVolumeClaim: React.FunctionComponent<IPersistentVolumeClaimProps> = ({ item, type }) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.storageClassName" title="Storage Class Name" />
          <Row obj={item} objKey="spec.accessModes" title="Access Modes" value={(accessModes) => accessModes.join(', ')} />
          <Row obj={item} objKey="spec.volumeMode" title="Volume Mode" />
          <Row obj={item} objKey="spec.volumeName" title="Volume Name" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.phase" title="Phase" />
          <Row obj={item} objKey="status.accessModes" title="Access Modes" value={(accessModes) => accessModes.join(', ')} />
          {item.status && item.status.capacity ? Object.keys(item.status.capacity).map((key) => <Row key={key} obj={item} objKey={`status.capacity.${key}`} title={key[0].toUpperCase() + key.slice(1)} />) : null}
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} />
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

export default PersistentVolumeClaim;
