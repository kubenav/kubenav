import { IonGrid, IonRow } from '@ionic/react';
import { V1PersistentVolume } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import List from '../../misc/list/List';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface IPersistentVolumeDetailsProps extends RouteComponentProps {
  item: V1PersistentVolume;
  section: string;
  type: string;
}

const PersistentVolumeDetails: React.FunctionComponent<IPersistentVolumeDetailsProps> = ({
  item,
  type,
}: IPersistentVolumeDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.storageClassName" title="Storage Class Name" />
          <Row obj={item} objKey="spec.persistentVolumeReclaimPolicy" title="Reclaim Policy" />
          <Row
            obj={item}
            objKey="spec.accessModes"
            title="Access Modes"
            value={(accessModes) => accessModes.join(', ')}
          />
          <Row
            obj={item}
            objKey="spec.mountOptions"
            title="Mount Options"
            value={(mountOptions) => mountOptions.join(', ')}
          />
          <Row obj={item} objKey="spec.volumeMode" title="Volume Mode" />
          {item.spec && item.spec.capacity
            ? Object.keys(item.spec.capacity).map((key) => (
                <Row key={key} obj={item} objKey={`spec.capacity.${key}`} title={key[0].toUpperCase() + key.slice(1)} />
              ))
            : null}
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.phase" title="Phase" />
          <Row obj={item} objKey="status.reason" title="Reason" />
          <Row obj={item} objKey="status.message" title="Message" />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

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
              title: 'Capacity (in GiB)',
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
                  label: 'Capacity',
                  query: `kube_persistentvolume_capacity_bytes{persistentvolume="${
                    item.metadata ? item.metadata.name : ''
                  }"} / 1024 / 1024 / 1024`,
                },
              ],
            },
          ]}
        />
      ) : null}
    </IonGrid>
  );
};

export default PersistentVolumeDetails;
