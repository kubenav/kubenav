import {
  IonGrid,
  IonRow,
} from '@ionic/react';
import { V1PersistentVolume } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Configuration from '../Configuration';
import List from '../List';
import Metadata from '../Metadata';
import Row from '../Row';
import Status from '../Status';

interface IPersistentVolumeProps extends RouteComponentProps {
  item: V1PersistentVolume;
  section: string;
  type: string;
}

const PersistentVolume: React.FunctionComponent<IPersistentVolumeProps> = ({ item, type }) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.storageClassName" title="Storage Class Name" />
          <Row obj={item} objKey="spec.persistentVolumeReclaimPolicy" title="Reclaim Policy" />
          <Row obj={item} objKey="spec.accessModes" title="Access Modes" value={(accessModes) => accessModes.join(', ')} />
          <Row obj={item} objKey="spec.mountOptions" title="Mount Options" value={(mountOptions) => mountOptions.join(', ')} />
          <Row obj={item} objKey="spec.volumeMode" title="Volume Mode" />
          {item.spec && item.spec.capacity ? Object.keys(item.spec.capacity).map((key) => <Row key={key} obj={item} objKey={`spec.capacity.${key}`} title={key[0].toUpperCase() + key.slice(1)} />) : null}
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.phase" title="Phase" />
          <Row obj={item} objKey="status.reason" title="Reason" />
          <Row obj={item} objKey="status.message" title="Message" />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.name ? (
        <IonRow>
          <List name="Events" section="cluster" type="events" namespace="" selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
        </IonRow>
      ) : null}
    </IonGrid>
  )
};

export default PersistentVolume;
