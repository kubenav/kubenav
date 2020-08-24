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
  V1StatefulSetCondition,
} from '@kubernetes/client-node';
import React from 'react';
import { Terminal } from 'xterm';

export interface IAppPage {
  icon: string;
  singleText: string;
  pluralText: string;
  listURL: (namespace: string) => string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  listItemComponent: React.FunctionComponent<any>;
  detailsURL: (namespace: string, name: string) => string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  detailsComponent: React.FunctionComponent<any>;
}

export interface IAppPages {
  [key: string]: IAppPage;
}

export interface IAppSection {
  title: string;
  pages: IAppPages;
}

export interface IAppSections {
  [key: string]: IAppSection;
}

export interface IAppSettings {
  darkMode: boolean;
  timeout: number;
  sshKey: string;
  sshPort: string;
  sshUser: string;
  proxyEnabled: boolean;
  proxyAddress: string;
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
  insecureSkipTLSVerify: boolean;
  authProvider: TAuthProvider;
  authProviderAWS?: IClusterAuthProviderAWS;
  authProviderAzure?: IClusterAuthProviderAzure;
  authProviderGoogle?: IClusterAuthProviderGoogle;
  authProviderOIDC?: IClusterAuthProviderOIDC;
  namespace: string;
}

export interface IClusterAuthProviderAWS {
  accessKeyID: string;
  clusterID: string;
  region: string;
  secretKey: string;
}

export interface IClusterAuthProviderAzure {
  admin: boolean;
  clientID: string;
  clientSecret: string;
  resourceGroupName: string;
  subscriptionID: string;
  tenantID: string;
}

export interface IClusterAuthProviderGoogle {
  accessToken: string;
  clientID: string;
  expiresIn: string;
  idToken: string;
  refreshToken: string;
  tokenType: string;
  clusterID?: string;
}

export interface IClusterAuthProviderOIDC {
  clientID: string;
  clientSecret: string;
  idToken: string;
  idpIssuerURL: string;
  refreshToken: string;
  certificateAuthority: string;
  accessToken: string;
  expiry: number;
  clusterID?: string;
}

export interface IClusters {
  [key: string]: ICluster;
}

export interface IContainerMetrics {
  name?: string;
  usage?: IMetricsUsage;
}

export interface IContext {
  clusters?: IClusters;
  cluster?: string;
  settings: IAppSettings;

  addCluster: (newCluster: ICluster[]) => void;
  changeCluster: (id: string) => void;
  currentCluster: () => ICluster | undefined;
  deleteCluster: (id: string) => void;
  editCluster: (editCluster: ICluster) => void;
  editSettings: (settings: IAppSettings) => void;
  setNamespace: (namespace: string) => void;
  kubernetesAuthWrapper: (clusterID: string) => Promise<ICluster>;
}

export interface IGoogleTokensAPIResponse {
  // eslint-disable-next-line @typescript-eslint/naming-convention
  access_token: string;
  error: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  error_description: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  expires_in: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  id_token: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  refresh_token: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  token_type: string;
}

export interface IGoogleProject {
  projectId: string;
}

export interface IGoogleCluster {
  name: string;
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
  'insecure-skip-tls-verify': boolean;
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
  apiVersion?: string;
  metadata?: V1ObjectMeta;
  timestamp?: Date;
  window?: number;
  usage?: IMetricsUsage;
}

export interface INodeMetricsList {
  apiVersion?: string;
  items: Array<INodeMetrics>;
  kind?: string;
  metadata?: V1ListMeta;
}

export interface IOIDCProvider {
  name: string;
  clientID: string;
  clientSecret: string;
  idToken: string;
  idpIssuerURL: string;
  refreshToken: string;
  certificateAuthority: string;
  accessToken: string;
  expiry: number;
}

export interface IOIDCProviders {
  [key: string]: IOIDCProvider;
}

export interface IOIDCProviderTokenAPIResponse {
  error: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  id_token: string;
  message: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  refresh_token: string;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  access_token: string;
  expiry: number;
}

export interface IPodMetrics {
  apiVersion?: string;
  metadata?: V1ObjectMeta;
  timestamp?: Date;
  window?: number;
  containers?: Array<IContainerMetrics>;
}

export interface IPodMetricsList {
  apiVersion?: string;
  items: Array<IPodMetrics>;
  kind?: string;
  metadata?: V1ListMeta;
}

export interface IPortForwarding {
  id: string;
  podName: string;
  podNamespace: string;
  podPort: number;
  localPort: number;
}

export interface IPortForwardingContext {
  portForwardings: IPortForwarding[];
  add: (portForwarding: IPortForwarding) => Promise<void>;
}

export interface IPortForwardingResponse {
  id: string;
  podPort: number;
  localPort: number;
}

export interface ITerminal {
  name: string;
  shell?: Terminal;
  eventSource?: EventSource;
  webSocket?: WebSocket;
}

export interface ITerminalContext {
  terminals: ITerminal[];

  add: (term: ITerminal) => void;
}

export interface ITerminalResponse {
  id: string;
}

export type TActivator = 'block-button' | 'button' | 'item' | 'item-option';

// DEPRECATED: The value '' can be removed when the migration is done.
export type TAuthProvider = '' | 'aws' | 'azure' | 'google' | 'kubeconfig' | 'oidc';

export type TCondition =
  | V1DeploymentCondition
  | V1JobCondition
  | V1NodeCondition
  | V1PodCondition
  | V1PersistentVolumeClaimCondition
  | V1ReplicaSetCondition
  | V1ReplicationControllerCondition
  | V1StatefulSetCondition;

export type TSyncType = 'context' | 'namespace';
