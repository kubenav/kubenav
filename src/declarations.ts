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

export interface IAppPage {
  icon: string;
  singleText: string;
  pluralText: string;
  listURL: (namespace: string) => string;
  listItemComponent: React.FunctionComponent<any>;
  detailsURL: (namespace: string, name: string) => string;
  detailsComponent: React.FunctionComponent<any>;
}

export interface IAppPages {
  [key: string]: IAppPage
}

export interface IAppSection {
  title: string;
  pages: IAppPages;
}

export interface IAppSections {
  [key: string]: IAppSection
}

export interface ICluster {
  id: string;
  name: string;
  url: string;
  certificateAuthorityData: string;
  clientCertificateData: string;
  clientKeyData: string;
  token: string;
  namespace: string;
}

export interface IClusters {
  [key: string]: ICluster;
}

export interface IContainerMetrics {
  'name'?: string;
  'usage'?: IMetricsUsage;
}

export interface IContext {
  clusters?: IClusters;
  cluster?: string;

  addCluster: (newCluster: ICluster) => void;
  changeCluster: (id: string) => void;
  deleteCluster: (id: string) => void;
  editCluster: (editCluster: ICluster) => void;
  setNamespace: (namespace: string) => void;
  request: (method: string, url: string, body: string, alternativeCluster?: ICluster) => Promise<any>;
}

export interface IKubeconfig {
  clusters: IKubeconfigClusterRef[];
  contexts: IKubeconfigContextRef[];
  users: IKubeconfigUserRef[];
}

export interface IKubeconfigCluster {
  'certificate-authority-data': string;
  server: string;
}

export interface IKubeconfigClusterRef {
  cluster: IKubeconfigCluster;
  name: string;
}

export interface IKubeconfigContextRef {
  context: IKubeconfigContext;
  name: string;
}

export interface IKubeconfigContext {
  cluster: string;
  user: string;
}

export interface IKubeconfigUser {
  'client-certificate-data'?: string;
  'client-key-data'?: string;
  token?: string
}

export interface IKubeconfigUserRef {
  name: string;
  user: IKubeconfigUser;
}

export interface IMetricsUsage {
  [key: string]: string;
}

export interface INodeMetrics {
  'apiVersion'?: string;
  'metadata'?: V1ObjectMeta;
  'timestamp'?: Date;
  'window'?: number;
  'usage'?: IMetricsUsage;
}

export interface INodeMetricsList {
  'apiVersion'?: string;
  'items': Array<INodeMetrics>;
  'kind'?: string;
  'metadata'?: V1ListMeta;
}

export interface IPodMetrics {
  'apiVersion'?: string;
  'metadata'?: V1ObjectMeta;
  'timestamp'?: Date;
  'window'?: number;
  'containers'?: Array<IContainerMetrics>;
}

export interface IPodMetricsList {
  'apiVersion'?: string;
  'items': Array<IPodMetrics>;
  'kind'?: string;
  'metadata'?: V1ListMeta;
}

export type TCondition = V1DeploymentCondition | V1JobCondition | V1NodeCondition | V1PodCondition | V1PersistentVolumeClaimCondition | V1ReplicaSetCondition | V1ReplicationControllerCondition | V1StatefulSetCondition;
