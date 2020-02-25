import { IAWSTokens, IClusters, IGoogleTokens } from '../declarations';
import { STORAGE_AWS_TOKENS, STORAGE_CLUSTER, STORAGE_CLUSTERS, STORAGE_GOOGLE_CLIENT_ID, STORAGE_GOOGLE_TOKENS } from './constants';

// getAWSTokens returns the tokens required for API requests against AWS.
// If there is no entry in the localStorage an empty object is returned.
// Therefore it must be checked if the needed region property exists.
export const getAWSTokens = (): IAWSTokens => {
  return localStorage.getItem(STORAGE_AWS_TOKENS) ? JSON.parse(localStorage.getItem(STORAGE_AWS_TOKENS) as string) : {};
};

// getCluster returns the saved active cluster from localStorage.
// If there is no value in the localStorage or the saved active cluster is not in the saved cluster, undefined is returned.
export const getCluster = (): string|undefined => {
  const clusters = getClusters();
  return localStorage.getItem(STORAGE_CLUSTER) !== null && localStorage.getItem(STORAGE_CLUSTER) !== '' ? localStorage.getItem(STORAGE_CLUSTER) as string : clusters && Object.keys(clusters).length > 0 ? Object.keys(clusters)[0] : undefined;
};

// getClusters returns the saved clusters from localStorage.
// If there are no saved clusters, undefined is returned.
export const getClusters = (): IClusters|undefined => {
  return localStorage.getItem(STORAGE_CLUSTERS) !== null && localStorage.getItem(STORAGE_CLUSTERS) !== '' ? JSON.parse(localStorage.getItem(STORAGE_CLUSTERS) as string) as IClusters : undefined;
};

// getGoogleClientID returns the Google client id from localStorage.
// If there is no client id, an empty string is returned.
// The user will then get an error message from Google, that a valid client id is required.
export const getGoogleClientID = (): string => {
  const clientID = localStorage.getItem(STORAGE_GOOGLE_CLIENT_ID);
  return clientID ? clientID : '';
};

// getGoogleTokens returns the tokens required for Google from localStorage.
export const getGoogleTokens = (): IGoogleTokens|undefined => {
  return localStorage.getItem(STORAGE_GOOGLE_TOKENS) ? JSON.parse(localStorage.getItem(STORAGE_GOOGLE_TOKENS)!) : undefined;
};

// removeCluster removes the saved cluster from localStorage.
export const removeCluster = () => {
  localStorage.removeItem(STORAGE_CLUSTER);
};

// removeClusters removes the saved clusters from localStorage.
export const removeClusters = () => {
  localStorage.removeItem(STORAGE_CLUSTERS);
};

// setAWSTokens saves the provided tokens to localStorage.
export const setAWSTokens = (tokens: IAWSTokens) => {
  localStorage.setItem(STORAGE_AWS_TOKENS, JSON.stringify(tokens));
};

// setCluster saves the given cluster id to localStorage.
export const setCluster = (cluster: string) => {
  localStorage.setItem(STORAGE_CLUSTER, cluster);
};

// setClusters saves the given clusters object to localStorage.
export const setClusters = (clusters: IClusters) => {
  localStorage.setItem(STORAGE_CLUSTERS, JSON.stringify(clusters));
};

// setGoogleTokens saves the returned Google tokens for authenticated API requests to the localStorage.
// Before the tokens are saved, the expire date is transformed for better access in the app.
export const setGoogleTokens = (tokens: IGoogleTokens) => {
  const expiresData = new Date();
  expiresData.setSeconds( expiresData.getSeconds() + parseInt(tokens.expires_in) - 300);
  tokens.expires_in = expiresData.toDateString();
  localStorage.setItem(STORAGE_GOOGLE_TOKENS, JSON.stringify(tokens));
};

// setGoogleClientID saves the Google client id to the localStorage.
export const setGoogleClientID = (clientID: string) => {
  localStorage.setItem(STORAGE_GOOGLE_CLIENT_ID, clientID);
};
