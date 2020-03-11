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

export interface IAppSettings {
  darkMode: boolean;
  editorTheme: string;
}

export interface IAWSCluster {
  CertificateAuthority: IAWSClusterCertificateAuthority;
  Endpoint: string;
  Name: string;
}

export interface IAWSClusterCertificateAuthority {
  Data: string;
}

export interface IAWSToken {
  accessKeyID: string;
  secretKey: string;
}

export interface IAWSTokens {
  [key: string]: IAWSToken;
}

export interface IAzureCluster {
  name: string;
  kubeconfig: IKubeconfig;
}

export interface IAzureCredentials {
  subscriptionID: string;
  clientID: string;
  clientSecret: string;
  tenantID: string;
  resourceGroupName: string;
  admin: boolean;
}

export interface ICluster {
  id: string;
  name: string;
  url: string;
  certificateAuthorityData: string;
  clientCertificateData: string;
  clientKeyData: string;
  token: string;
  username: string;
  password: string;
  authProvider: string;
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
  settings: IAppSettings;

  addCluster: (newCluster: ICluster[]) => void;
  changeCluster: (id: string) => void;
  deleteCluster: (id: string) => void;
  editCluster: (editCluster: ICluster) => void;
  editSettings: (settings: IAppSettings) => void;
  setNamespace: (namespace: string) => void;
  request: (method: string, url: string, body: string, alternativeCluster?: ICluster) => Promise<any>;
}

export interface IGoogleTokens {
  access_token: string;
  expires_in: string;
  id_token: string;
  refresh_token: string;
  token_type: string;
}

export interface IGoogleProject {
  projectId: string;
}

export interface IGoogleCluster {
  name: string,
  masterAuth: IGoogleClusterMasterAuth;
  endpoint: string;
  location: string;
}

export interface IGoogleClusterMasterAuth {
  username?: string;
  password?: string;
  clusterCaCertificate: string;
  clientCertificate?: string;
  clientKey?: string;
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
  token?: string;
  username?: string;
  password?: string;
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

export type TCondition = V1DeploymentCondition
  | V1JobCondition
  | V1NodeCondition
  | V1PodCondition
  | V1PersistentVolumeClaimCondition
  | V1ReplicaSetCondition
  | V1ReplicationControllerCondition
  | V1StatefulSetCondition;

export type TActivator = 'button' | 'item-option';
