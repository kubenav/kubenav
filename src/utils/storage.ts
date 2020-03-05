import { IAppSettings, IAWSTokens, IClusters, IGoogleTokens } from '../declarations';
import {
  DEFAULT_SETTINGS,
  STORAGE_AWS_TOKENS,
  STORAGE_CLUSTER,
  STORAGE_CLUSTERS,
  STORAGE_GOOGLE_CLIENT_ID,
  STORAGE_GOOGLE_TOKENS,
  STORAGE_SETTINGS
} from './constants';

// readAWSTokens returns the tokens required for API requests against AWS. If there is no entry in the localStorage an
// empty object is returned. Therefore it must be checked if the needed region property exists.
export const readAWSTokens = (): IAWSTokens => {
  return localStorage.getItem(STORAGE_AWS_TOKENS) ? JSON.parse(localStorage.getItem(STORAGE_AWS_TOKENS) as string) : {};
};

// readCluster returns the saved active cluster from localStorage. If there is no value in the localStorage or the saved
// active cluster is not in the saved cluster, undefined is returned.
export const readCluster = (): string|undefined => {
  const clusters = readClusters();
  return localStorage.getItem(STORAGE_CLUSTER) !== null && localStorage.getItem(STORAGE_CLUSTER) !== ''
    ? localStorage.getItem(STORAGE_CLUSTER) as string
    : clusters && Object.keys(clusters).length > 0 ? Object.keys(clusters)[0] : undefined;
};

// readClusters returns the saved clusters from localStorage. If there are no saved clusters, undefined is returned.
export const readClusters = (): IClusters|undefined => {
  return localStorage.getItem(STORAGE_CLUSTERS) !== null && localStorage.getItem(STORAGE_CLUSTERS) !== ''
    ? JSON.parse(localStorage.getItem(STORAGE_CLUSTERS) as string) as IClusters : undefined;
};

// readGoogleClientID returns the Google client id from localStorage. If there is no client id, an empty string is
// returned. The user will then get an error message from Google, that a valid client id is required.
export const readGoogleClientID = (): string => {
  const clientID = localStorage.getItem(STORAGE_GOOGLE_CLIENT_ID);
  return clientID ? clientID : '';
};

// readGoogleTokens returns the tokens required for Google from localStorage.
export const readGoogleTokens = (): IGoogleTokens|undefined => {
  return localStorage.getItem(STORAGE_GOOGLE_TOKENS)
    ? JSON.parse(localStorage.getItem(STORAGE_GOOGLE_TOKENS)!) : undefined;
};

// readSettings returns the settings set by the user. If the user had not modified the settings yet, return the default
// settings.
export const readSettings = (): IAppSettings => {
  const settings = localStorage.getItem(STORAGE_SETTINGS);

  return settings ? JSON.parse(settings) : DEFAULT_SETTINGS;
};

// removeCluster removes the saved cluster from localStorage.
export const removeCluster = () => {
  localStorage.removeItem(STORAGE_CLUSTER);
};

// removeClusters removes the saved clusters from localStorage.
export const removeClusters = () => {
  localStorage.removeItem(STORAGE_CLUSTERS);
};

// saveAWSTokens saves the provided tokens to localStorage.
export const saveAWSTokens = (tokens: IAWSTokens) => {
  localStorage.setItem(STORAGE_AWS_TOKENS, JSON.stringify(tokens));
};

// saveCluster saves the given cluster id to localStorage.
export const saveCluster = (cluster: string) => {
  localStorage.setItem(STORAGE_CLUSTER, cluster);
};

// saveClusters saves the given clusters object to localStorage.
export const saveClusters = (clusters: IClusters) => {
  localStorage.setItem(STORAGE_CLUSTERS, JSON.stringify(clusters));
};

// saveGoogleTokens saves the returned Google tokens for authenticated API requests to the localStorage. Before the
// tokens are saved, the expire date is transformed for better access in the app.
export const saveGoogleTokens = (tokens: IGoogleTokens) => {
  const expiresData = new Date();
  expiresData.setSeconds( expiresData.getSeconds() + parseInt(tokens.expires_in) - 300);
  tokens.expires_in = expiresData.toDateString();
  localStorage.setItem(STORAGE_GOOGLE_TOKENS, JSON.stringify(tokens));
};

// saveGoogleClientID saves the Google client id to the localStorage.
export const saveGoogleClientID = (clientID: string) => {
  localStorage.setItem(STORAGE_GOOGLE_CLIENT_ID, clientID);
};

// saveSettings saves the users settings to the localStorage.
export const saveSettings = (settings: IAppSettings) => {
  localStorage.setItem(STORAGE_SETTINGS, JSON.stringify(settings));
};
