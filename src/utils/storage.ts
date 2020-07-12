import {
  IAppSettings,
  IClusterAuthProviderAWS,
  IClusterAuthProviderAzure,
  IClusterAuthProviderGoogle,
  IClusterAuthProviderOIDC,
  IClusters,
  TAuthProvider,
} from '../declarations';
import {
  DEFAULT_SETTINGS,
  STORAGE_CLUSTER,
  STORAGE_CLUSTERS,
  STORAGE_SETTINGS,
  STORAGE_TEMPORARY_CREDENTIALS,
} from './constants';

// readCluster returns the saved active cluster from localStorage. If there is no value in the localStorage or the saved
// active cluster is not in the saved cluster, undefined is returned.
export const readCluster = (): string | undefined => {
  const clusters = readClusters();
  return localStorage.getItem(STORAGE_CLUSTER) !== null && localStorage.getItem(STORAGE_CLUSTER) !== ''
    ? (localStorage.getItem(STORAGE_CLUSTER) as string)
    : clusters && Object.keys(clusters).length > 0
    ? Object.keys(clusters)[0]
    : undefined;
};

// readClusters returns the saved clusters from localStorage. If there are no saved clusters, undefined is returned.
export const readClusters = (): IClusters | undefined => {
  return localStorage.getItem(STORAGE_CLUSTERS) !== null && localStorage.getItem(STORAGE_CLUSTERS) !== ''
    ? (JSON.parse(localStorage.getItem(STORAGE_CLUSTERS) as string) as IClusters)
    : undefined;
};

// readSettings returns the settings set by the user. If the user had not modified the settings yet, return the default
// settings. We have to check the parsed settings from localStorage key by key, because on older version it is possible,
// that a key is missing.
export const readSettings = (): IAppSettings => {
  const settingsFromStorage = localStorage.getItem(STORAGE_SETTINGS);

  if (settingsFromStorage) {
    const settings = JSON.parse(settingsFromStorage);
    return {
      darkMode: settings.hasOwnProperty('darkMode') ? settings.darkMode : DEFAULT_SETTINGS.darkMode,
      timeout: settings.timeout ? settings.timeout : DEFAULT_SETTINGS.timeout,
      sshKey: settings.sshKey ? settings.sshKey : DEFAULT_SETTINGS.sshKey,
      sshPort: settings.sshPort ? settings.sshPort : DEFAULT_SETTINGS.sshPort,
      sshUser: settings.sshUser ? settings.sshUser : DEFAULT_SETTINGS.sshUser,
    };
  }

  return DEFAULT_SETTINGS;
};

// readTemporaryCredentials returns the temporary stored creedentials for a cloud provider or ODIC from localStorage.
export const readTemporaryCredentials = (
  authProvider: TAuthProvider,
):
  | undefined
  | IClusterAuthProviderAWS
  | IClusterAuthProviderAzure
  | IClusterAuthProviderGoogle
  | IClusterAuthProviderOIDC => {
  const credentials = localStorage.getItem(STORAGE_TEMPORARY_CREDENTIALS);

  if (credentials === null) {
    return undefined;
  } else if (authProvider === 'aws') {
    return JSON.parse(credentials) as IClusterAuthProviderAWS;
  } else if (authProvider === 'azure') {
    return JSON.parse(credentials) as IClusterAuthProviderAzure;
  } else if (authProvider === 'google') {
    return JSON.parse(credentials) as IClusterAuthProviderGoogle;
  } else if (authProvider === 'oidc') {
    return JSON.parse(credentials) as IClusterAuthProviderOIDC;
  } else {
    return undefined;
  }
};

// removeCluster removes the saved cluster from localStorage.
export const removeCluster = (): void => {
  localStorage.removeItem(STORAGE_CLUSTER);
};

// removeClusters removes the saved clusters from localStorage.
export const removeClusters = (): void => {
  localStorage.removeItem(STORAGE_CLUSTERS);
};

// removeTemporaryCredentials removes the temporary saved credentials from localStorage.
export const removeTemporaryCredentials = (): void => {
  localStorage.removeItem(STORAGE_TEMPORARY_CREDENTIALS);
};

// saveCluster saves the given cluster id to localStorage.
export const saveCluster = (cluster: string): void => {
  localStorage.setItem(STORAGE_CLUSTER, cluster);
};

// saveClusters saves the given clusters object to localStorage.
export const saveClusters = (clusters: IClusters): void => {
  localStorage.setItem(STORAGE_CLUSTERS, JSON.stringify(clusters));
};

// saveSettings saves the users settings to the localStorage.
export const saveSettings = (settings: IAppSettings): void => {
  localStorage.setItem(STORAGE_SETTINGS, JSON.stringify(settings));
};

// saveTemporaryCredentials saves the credentials for a cloud provider or OIDC temporary to the localStorage.
export const saveTemporaryCredentials = (
  credentials:
    | IClusterAuthProviderAWS
    | IClusterAuthProviderAzure
    | IClusterAuthProviderGoogle
    | IClusterAuthProviderOIDC,
): void => {
  localStorage.setItem(STORAGE_TEMPORARY_CREDENTIALS, JSON.stringify(credentials));
};
