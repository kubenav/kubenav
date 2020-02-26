import { Plugins } from '@capacitor/core';
import { isPlatform } from '@ionic/react';
import { KubenavPlugin as KubenavWebPlugin } from '@kubenav/kubenav-plugin';

import {
  IAWSCluster,
  IAWSTokens,
  ICluster,
  IClusters,
  IGoogleCluster,
  IGoogleProject,
  IGoogleTokens
} from '../declarations';
import { GOOGLE_REDIRECT_URI, SERVER } from './constants';
import { isJSON } from './helpers';
import {
  readAWSTokens,
  readGoogleClientID,
  readGoogleTokens,
  saveGoogleTokens
} from './storage';

const { KubenavPlugin } = Plugins;

// getAWSClusters returns all EKS clusters from AWS for the provided access key, secret access key and region.
// This function is only available for the native mobile apps, on all other platforms an error is returned.
// For the desktop implementation this is not needed, because we are using kubeconfig file from ~/.kube/config.
export const getAWSClusters = async (accessKeyId: string, secretAccessKey: string, region: string): Promise<IAWSCluster[]> => {
  let plugin: any;

  if (isPlatform('hybrid')) {
    plugin = KubenavPlugin;
  } else {
    plugin = KubenavWebPlugin;
  }

  try {
    let data = await plugin.awsGetClusters({
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      region: region,
    });

    if (data.data !== '') {
      return JSON.parse(data.data);
    } else {
      throw new Error('No cluster was found');
    }
  } catch (err) {
    throw err
  }
};

// getAWSToken returns a valid authentication token for API requests against a EKS cluster.
// This function is only available for the native mobile apps, on all other platforms an error is returned.
// For the desktop implementation this is not needed, because we are using kubeconfig file from ~/.kube/config.
export const getAWSToken = async (accessKeyId: string, secretAccessKey: string, region: string, clusterID: string): Promise<string> => {
  let plugin: any;

  if (isPlatform('hybrid')) {
    plugin = KubenavPlugin;
  } else {
    plugin = KubenavWebPlugin;
  }

  try {
    let data = await plugin.awsGetToken({
      accessKeyId: accessKeyId,
      secretAccessKey: secretAccessKey,
      region: region,
      clusterID: clusterID,
    });

    if (data.data !== '') {
      return JSON.parse(data.data).token;
    } else {
      throw new Error('Could not get AWS token');
    }
  } catch (err) {
    throw err
  }
};

// getCluster returns the cluster from the current Kubeconfig context.
// This is only needed for development in the browser.
// For the mobile app the active cluster is retrieved from localStorage and for desktop the current context is also saved in localStorage at startup.
export const getCluster = async (): Promise<string|undefined> => {
  const response = await fetch(`${SERVER}/cluster`, {
    method: 'GET',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json.cluster;
  }

  return undefined;
};

// getClusters returns all clusters from the Kubeconfig file on desktop.
export const getClusters = async (): Promise<IClusters|undefined> => {
  const response = await fetch(`${SERVER}/clusters`, {
    method: 'GET',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json.clusters;
  }

  return undefined;
};

// getGoogleAccessToken returns a valid access token for Google.
// Therefore we read the saved tokens from the localStorage.
// If the access token is expired, we request a new token from the Google API and save it.
// Then the correct token is returned.
const getGoogleAccessToken = async (): Promise<string> => {
  const tokens = readGoogleTokens();
  if (!tokens) {
    throw new Error('Could not get access token.')
  }

  const expiresData = new Date(tokens.expires_in);
  let accessToken = tokens.access_token;

  if (expiresData.getTime() < new Date().getTime()) {
    const newTokens = await getGoogleAccessTokenAPI(tokens.refresh_token);
    saveGoogleTokens({
      access_token: newTokens.access_token,
      expires_in: newTokens.expires_in,
      id_token: tokens.id_token,
      refresh_token: tokens.refresh_token,
      token_type: tokens.token_type,
    });
    return newTokens.access_token;
  }

  return accessToken;
};

// getGoogleAccessTokenAPI uses the refresh token to get a new valid access token for GKE clusters.
// Therefore a valid refresh token is required.
export const getGoogleAccessTokenAPI = async (refreshToken: string): Promise<IGoogleTokens> => {
  const response = await fetch(`https://oauth2.googleapis.com/token?refresh_token=${refreshToken}&client_id=${readGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=refresh_token`, {
    method: 'POST',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json;
  }

  if (json.error && json.error_description) {
    throw new Error(`${json.error}: ${json.error_description}`);
  } else {
    throw new Error('An unknown error occurred.');
  }
};

// getGoogleClusters returns all available GKE clusters for the provided project.
// For the authentication against the Google API a valid access token is required.
export const getGoogleClusters = async (token: string, project: string): Promise<IGoogleCluster[]> => {
  const response = await fetch(`https://container.googleapis.com/v1/projects/${project}/locations/-/clusters`, {
    headers: {
      'Authorization': `Bearer ${token}`,
    },
    method: 'GET',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json.clusters;
  }

  if (json.error.message) {
    throw new Error(json.error.message);
  } else {
    throw new Error('An unknown error occurred.');
  }
};

// getGoogleProjects returns all available projects for the authenticated user, from the Google API.
// Therefor a valid access token is required.
export const getGoogleProjects = async (token: string): Promise<IGoogleProject[]> => {
  const response = await fetch('https://cloudresourcemanager.googleapis.com/v1/projects', {
    headers: {
      'Authorization': `Bearer ${token}`,
    },
    method: 'GET',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json.projects;
  }

  if (json.error.message) {
    throw new Error(json.error.message);
  } else {
    throw new Error('An unknown error occurred.');
  }
};

// getGoogleTokens is used to retrieve a refresh token from the Google API.
// This converts the returned code after the login via Google into an refresh token.
// See: https://developers.google.com/identity/protocols/OpenIDConnect#exchangecode
export const getGoogleTokens = async (code: string): Promise<IGoogleTokens> => {
  const response = await fetch(`https://oauth2.googleapis.com/token?code=${code}&client_id=${readGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=authorization_code`, {
    method: 'POST',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json;
  }

  if (json.error && json.error_description) {
    throw new Error(`${json.error}: ${json.error_description}`);
  } else {
    throw new Error('An unknown error occurred.');
  }
};

// kubernetesRequest is used for operations against the Kubernetes API server.
// Before the request is execute the provided authentication provider is checked.
// If the authentication provider is Google and client certificates or username and password are not configured, an valid access token is requested.
// If the authentication provider is AWS, an valid access token is requested.
// The region and name for the selected cluster is saved in the cluster id, so we can reuse it to get a access token for the Kubernetes API server.
export const kubernetesRequest = async (method: string, url: string, body: string, cluster: ICluster): Promise<any> => {
  let plugin: any;

  if (isPlatform('hybrid')) {
    plugin = KubenavPlugin;
  } else {
    plugin = KubenavWebPlugin;
  }

  try {
    if (cluster.authProvider === 'google') {
      if (!(cluster.clientCertificateData !== '' && cluster.clientKeyData !== '')) {
        if (!(cluster.password !== '' && cluster.password !== '')) {
          cluster.token = await getGoogleAccessToken();
        }
      }
    }

    if (cluster.authProvider === 'aws') {
      const tokens: IAWSTokens = readAWSTokens();
      const parts = cluster.id.split('_');

      if (parts.length < 3) {
        throw new Error('Invalid cluster id for authentication provider AWS.')
      }

      if (!tokens.hasOwnProperty(parts[1])) {
        throw new Error('Could not find credentials for cluster.')
      }

      cluster.token = await getAWSToken(tokens[parts[1]].accessKeyID, tokens[parts[1]].secretKey, parts[1], parts.slice(2, parts.length).join('_'));
    }

    let data = await plugin.request({
      server: SERVER,
      cluster: cluster ? cluster.id : '',
      method: method,
      url: cluster ? cluster.url + url : '',
      body: body,
      certificateAuthorityData: cluster ? cluster.certificateAuthorityData : '',
      clientCertificateData: cluster ? cluster.clientCertificateData : '',
      clientKeyData: cluster ? cluster.clientKeyData : '',
      token: cluster ? cluster.token : '',
      username: cluster ? cluster.username : '',
      password: cluster ? cluster.password : '',
    });

    if (isJSON(data.data)) {
      return JSON.parse(data.data);
    } else {
      return data.data;
    }
  } catch (err) {
    throw err;
  }
};
