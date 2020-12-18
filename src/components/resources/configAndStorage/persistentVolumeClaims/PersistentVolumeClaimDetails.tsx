import { IonGrid, IonRow } from '@ionic/react';
import { V1PersistentVolumeClaim } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import List from '../../misc/list/List';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface IPersistentVolumeClaimDetailsProps extends RouteComponentProps {
  item: V1PersistentVolumeClaim;
  section: string;
  type: string;
}

const PersistentVolumeClaimDetails: React.FunctionComponent<IPersistentVolumeClaimDetailsProps> = ({
  item,
  type,
}: IPersistentVolumeClaimDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.storageClassName" title="Storage Class Name" />
          <Row
            obj={item}
            objKey="spec.accessModes"
            title="Access Modes"
            value={(accessModes) => accessModes.join(', ')}
          />
          <Row obj={item} objKey="spec.volumeMode" title="Volume Mode" />
          <Row obj={item} objKey="spec.volumeName" title="Volume Name" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.phase" title="Phase" />
          <Row
            obj={item}
            objKey="status.accessModes"
            title="Access Modes"
            value={(accessModes) => accessModes.join(', ')}
          />

          {item.status && item.status.capacity
            ? Object.keys(item.status.capacity).map((key) => (
                <Row
                  key={key}
                  obj={item}
                  objKey={`status.capacity.${key}`}
                  title={key[0].toUpperCase() + key.slice(1)}
                />
              ))
            : null}
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

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
          charts={[
            {
              title: 'Volume Space Usage',
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
                  label: 'Used Space',
                  query: `(
                    sum without(instance, node) (kubelet_volume_stats_capacity_bytes{namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", persistentvolumeclaim="${item.metadata ? item.metadata.name : ''}"})
                    -
                    sum without(instance, node) (kubelet_volume_stats_available_bytes{namespace="${
                      item.metadata ? item.metadata.namespace : ''
                    }", persistentvolumeclaim="${item.metadata ? item.metadata.name : ''}"})
                  ) / 1024 / 1024 / 1024`,
                },
                {
                  label: 'Total Space',
                  query: `sum without(instance, node) (kubelet_volume_stats_capacity_bytes{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", persistentvolumeclaim="${item.metadata ? item.metadata.name : ''}"}) / 1024 / 1024 / 1024`,
                },
              ],
            },
            {
              title: 'Volume inodes Usage',
              unit: '',
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
                  label: 'Used inodes',
                  query: `sum without(instance, node) (kubelet_volume_stats_inodes_used{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", persistentvolumeclaim="${item.metadata ? item.metadata.name : ''}"})`,
                },
                {
                  label: 'Total inodes',
                  query: `sum without(instance, node) (kubelet_volume_stats_inodes{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", persistentvolumeclaim="${item.metadata ? item.metadata.name : ''}"})`,
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

export default PersistentVolumeClaimDetails;
