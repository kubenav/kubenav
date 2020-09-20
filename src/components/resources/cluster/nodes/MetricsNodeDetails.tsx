import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close } from 'ionicons/icons';
import React, { useState } from 'react';

import Dashboard from '../../../plugins/prometheus/Dashboard';

interface IMetricsNodeDetailsProps {
  name: string;
}

const MetricsNodeDetails: React.FunctionComponent<IMetricsNodeDetailsProps> = ({ name }: IMetricsNodeDetailsProps) => {
  const [showModal, setShowModal] = useState(false);

  return (
    <React.Fragment>
      <IonItem button={true} onClick={() => setShowModal(true)}>
        <IonLabel>
          <h2>Node Details</h2>
        </IonLabel>
      </IonItem>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShowModal(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>Node Details</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Dashboard
            title="Node Details"
            charts={[
              {
                title: 'System Load',
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
                    label: 'Load 1m',
                    query: `max(node_load1{job="node-exporter", instance="${name}"})`,
                  },
                  {
                    label: 'Load 5m',
                    query: `max(node_load5{job="node-exporter", instance="${name}"})`,
                  },
                  {
                    label: 'Load 15m',
                    query: `max(node_load15{job="node-exporter", instance="${name}"})`,
                  },
                  {
                    label: 'Cores',
                    query: `count(count(node_cpu_seconds_total{job="node-exporter", instance="${name}"}) by (cpu))`,
                  },
                ],
              },
              {
                title: 'Usage per Core',
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
                    label: '{{ .cpu }}',
                    query: `sum by (cpu) (irate(node_cpu_seconds_total{job="node-exporter", mode!="idle", instance="${name}"}[5m]))`,
                  },
                ],
              },
              {
                title: 'CPU Usage (in Percent)',
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
                    label: 'Usage',
                    query: `max (sum by (cpu) (irate(node_cpu_seconds_total{job="node-exporter", mode!="idle", instance="${name}"}[2m])) ) * 100`,
                  },
                ],
              },
              {
                title: 'Memory Usage (in GiB)',
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
                    label: 'Used',
                    query: `max(node_memory_MemTotal_bytes{job="node-exporter", instance="${name}"} - node_memory_MemFree_bytes{job="node-exporter", instance="${name}"} - node_memory_Buffers_bytes{job="node-exporter", instance="${name}"} - node_memory_Cached_bytes{job="node-exporter", instance="${name}"}) / 1024 / 1024 / 1024`,
                  },
                  {
                    label: 'Buffers',
                    query: `max(node_memory_Buffers_bytes{job="node-exporter", instance="${name}"}) / 1024 / 1024 / 1024`,
                  },
                  {
                    label: 'Cached',
                    query: `max(node_memory_Cached_bytes{job="node-exporter", instance="${name}"}) / 1024 / 1024 / 1024`,
                  },
                  {
                    label: 'Free',
                    query: `max(node_memory_MemFree_bytes{job="node-exporter", instance="${name}"}) / 1024 / 1024 / 1024`,
                  },
                ],
              },
              {
                title: 'Network Received (in MiB)',
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
                    label: '{{ .device }}',
                    query: `rate(node_network_receive_bytes_total{job="node-exporter", instance="${name}", device!~"lo"}[5m]) / 1024 / 1024`,
                  },
                ],
              },
              {
                title: 'Network Transmitted (in MiB)',
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
                    label: '{{ .device }}',
                    query: `rate(node_network_transmit_bytes_total{job="node-exporter", instance="${name}", device!~"lo"}[5m]) / 1024 / 1024`,
                  },
                ],
              },
              {
                title: 'Disk I/O (in MiB)',
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
                    label: 'Read',
                    query: `max(rate(node_disk_read_bytes_total{job="node-exporter", instance="${name}"}[2m])) / 1024 / 1024`,
                  },
                  {
                    label: 'Write',
                    query: `max(rate(node_disk_written_bytes_total{job="node-exporter", instance="${name}"}[2m])) / 1024 / 1024`,
                  },
                ],
              },
              {
                title: 'Disk Space Usage (in Percent)',
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
                    label: '{{ .device }}',
                    query: `max by (instance, namespace, pod, device) ((node_filesystem_size_bytes{fstype=~"ext[234]|btrfs|xfs|zfs", instance="${name}"} - node_filesystem_avail_bytes{fstype=~"ext[234]|btrfs|xfs|zfs", instance="${name}"}) / node_filesystem_size_bytes{fstype=~"ext[234]|btrfs|xfs|zfs", instance="${name}"}) * 100`,
                  },
                ],
              },
            ]}
          />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default MetricsNodeDetails;
