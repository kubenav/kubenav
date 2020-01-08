import {
  V1DeploymentCondition,
  V1JobCondition,
  V1ListMeta,
  V1NodeCondition,
  V1ObjectMeta,
  V1PersistentVolumeClaimCondition,
  V1PodCondition,
  V1ReplicaSetCondition,
  V1ReplicationControllerCondition,
  V1StatefulSetCondition
} from '@kubernetes/client-node';
import React from 'react';

export interface AppPage {
  icon: string;
  singleText: string;
  pluralText: string;
  listURL: (namespace: string) => string;
  listItemComponent: React.FunctionComponent<any>;
  detailsURL: (namespace: string, name: string) => string;
  detailsComponent: React.FunctionComponent<any>;
}

export interface AppPages {
  [key: string]: AppPage
}

export interface AppSection {
  title: string;
  pages: AppPages;
}

export interface AppSections {
  [key: string]: AppSection
}

export interface Cluster {
  id: string;
  name: string;
  url: string;
  certificateAuthorityData: string;
  clientCertificateData: string;
  clientKeyData: string;
  token: string;
  namespace: string;
}

export interface Clusters {
  [key: string]: Cluster;
}

export interface ContainerMetrics {
  'name'?: string;
  'usage'?: MetricsUsage;
}

export interface Context {
  clusters: Clusters;
  cluster: string;

  addCluster: (newCluster: Cluster) => void;
  changeCluster: (id: string) => void;
  deleteCluster: (id: string) => void;
  editCluster: (editCluster: Cluster) => void;
  setNamespace: (namespace: string) => void;
  request: (method: string, url: string, body: string) => Promise<any>;
}

export interface Kubeconfig {
  clusters: KubeconfigClusterRef[];
  contexts: KubeconfigContextRef[];
  users: KubeconfigUserRef[];
}

export interface KubeconfigCluster {
  'certificate-authority-data': string;
  server: string;
}

export interface KubeconfigClusterRef {
  cluster: KubeconfigCluster;
  name: string;
}

export interface KubeconfigContextRef {
  context: KubeconfigContext;
  name: string;
}

export interface KubeconfigContext {
  cluster: string;
  user: string;
}

export interface KubeconfigUser {
  'client-certificate-data'?: string;
  'client-key-data'?: string;
  token?: string
}

export interface KubeconfigUserRef {
  name: string;
  user: KubeconfigUser;
}

export interface MetricsUsage {
  [key: string]: string;
}

export interface NodeMetrics {
  'apiVersion'?: string;
  'metadata'?: V1ObjectMeta;
  'timestamp'?: Date;
  'window'?: number;
  'usage'?: MetricsUsage;
}

export interface NodeMetricsList {
  'apiVersion'?: string;
  'items': Array<NodeMetrics>;
  'kind'?: string;
  'metadata'?: V1ListMeta;
}

export interface PodMetrics {
  'apiVersion'?: string;
  'metadata'?: V1ObjectMeta;
  'timestamp'?: Date;
  'window'?: number;
  'containers'?: Array<ContainerMetrics>;
}

export interface PodMetricsList {
  'apiVersion'?: string;
  'items': Array<PodMetrics>;
  'kind'?: string;
  'metadata'?: V1ListMeta;
}

export type Condition = V1DeploymentCondition | V1JobCondition | V1NodeCondition | V1PodCondition | V1PersistentVolumeClaimCondition | V1ReplicaSetCondition | V1ReplicationControllerCondition | V1StatefulSetCondition;
