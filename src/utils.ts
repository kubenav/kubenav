import { isPlatform } from '@ionic/react';
import { V1LabelSelector, V1Subject } from '@kubernetes/client-node';

import { GOOGLE_CLIENT_ID_ANDROID, GOOGLE_CLIENT_ID_IOS, GOOGLE_REDIRECT_URI } from './constants';
import { IGoogleCluster, IGoogleProject, IGoogleTokens } from './declarations';

export const formatBytes = (bytes: number, si: boolean): string => {
  const thresh = si ? 1000 : 1024;
  const units = si ? ['kB','MB','GB','TB','PB','EB','ZB','YB'] : ['KiB','MiB','GiB','TiB','PiB','EiB','ZiB','YiB'];

  if (Math.abs(bytes) < thresh) {
    return bytes + ' B';
  }

  let u = -1;

  do {
    bytes /= thresh;
    ++u;
  } while(Math.abs(bytes) >= thresh && u < units.length - 1);

  return bytes.toFixed(1)+' '+units[u];
};

export const formatResourceValue = (type: string, value: string): string => {
  if (value === '' || value === undefined) {
    return '';
  }

  if (type === 'cpu') {
    if (value.slice(-1) === 'm') {
      return value;
    }

    if (value.slice(-1) === 'n') {
      return Math.round(parseInt(value.slice(0, -1)) / 1000000) + 'm';
    }

    return (parseInt(value) * 1000) + 'm';
  }

  if (type === 'memory') {
    if (value.slice(-2) === 'Ki') {
      return Math.round(parseInt(value.slice(0, -2)) / 1024) + 'Mi';
    }

    if (value.slice(-2) === 'Mi') {
      return value;
    }

    if (value.slice(-2) === 'Gi') {
      return Math.round(parseInt(value.slice(0, -2)) * 1024) + 'Mi';
    }

    return value;
  }

  if (type === 'ephemeral-storage') {
    if (value.slice(-2) === 'Ki') {
      return Math.round(parseInt(value.slice(0, -2)) / 1024 / 1024) + 'Gi';
    }

    if (value.slice(-2) === 'Mi') {
      return Math.round(parseInt(value.slice(0, -2)) / 1024) + 'Gi';
    }

    if (value.slice(-2) === 'Gi') {
      return value;
    }

    return Math.round(parseInt(value) / 1024 / 1024 / 1024) + 'Gi';
  }

  return value
};

export const getGoogleAccessToken = async (refreshToken: string): Promise<IGoogleTokens> => {
  const response = await fetch(`https://oauth2.googleapis.com/token?refresh_token=${refreshToken}&client_id=${getGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=refresh_token`, {
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

export const getGoogleClientID = () => {
  if (isPlatform('hybrid') && isPlatform('ios')) {
    return GOOGLE_CLIENT_ID_IOS;
  } else if (isPlatform('hybrid') && isPlatform('ios')) {
    return GOOGLE_CLIENT_ID_ANDROID;
  } else {
    return '';
  }
};

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

export const getGoogleTokens = async (code: string): Promise<IGoogleTokens> => {
  const response = await fetch(`https://oauth2.googleapis.com/token?code=${code}&client_id=${getGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=authorization_code`, {
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

export const getProperty = (obj: any, key: string) => {
  return key.split('.').reduce((o, x) => {
    return (typeof o == 'undefined' || o === null) ? o : o[x];
  }, obj);
};

export const  isBase64 = (str: string): boolean => {
  const len = str.length;
  const firstPaddingChar = str.indexOf('=');

  if (str === '') {
    return false;
  }

  if (!len || len % 4 !== 0 || /[^A-Z0-9+/=]/i.test(str)) {
    return false;
  }

  return firstPaddingChar === -1 || firstPaddingChar === len - 1 || (firstPaddingChar === len - 2 && str[len - 1] === '=');
};

export const isJSON = (data: any): boolean => {
  try {
    JSON.parse(data);
  } catch (err) {
    return false;
  }

  return true;
};

export const isNamespaced = (type: string): boolean => {
  return !(type === 'persistentvolumes' || type === 'clusterroles' || type === 'clusterrolebindings' || type === 'customresourcedefinitions' || type === 'namespaces' || type === 'nodes');
};

export const labelSelector = (labelSelector: V1LabelSelector): string => {
  if (labelSelector.matchLabels) {
    return matchLabels(labelSelector.matchLabels);
  }

  return '';
};

export const matchLabels = (labels: {[key: string]: string}): string => {
  let selectors: string[] = [];

  for (let label in labels) {
    selectors.push(`${label}=${labels[label]}`);
  }

  return selectors.join(',');
};

export const randomString = (length: number): string => {
  let result = '';
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charactersLength = characters.length;

  for ( let i = 0; i < length; i++ ) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }

  return result;
};

export const saveGoogleTokens = (tokens: IGoogleTokens) => {
  const expiresData = new Date();
  expiresData.setSeconds( expiresData.getSeconds() + parseInt(tokens.expires_in) - 300);
  tokens.expires_in = expiresData.toDateString();
  localStorage.setItem('google', JSON.stringify(tokens));
};

export const subjectLink = (subject: V1Subject): string => {
  if (subject.kind === 'ServiceAccount') {
    return `/kubernetes/config-and-storage/serviceaccounts/${subject.namespace}/${subject.name}`;
  }

  return '';
};

export const timeDifference = (current: number, previous: number): string => {
  const msPerMinute = 60 * 1000;
  const msPerHour = msPerMinute * 60;
  const msPerDay = msPerHour * 24;
  const msPerMonth = msPerDay * 30;
  const msPerYear = msPerDay * 365;

  const elapsed = current - previous;

  if (elapsed < msPerMinute) {
    return Math.round(elapsed/1000) + ' Seconds';
  } else if (elapsed < msPerHour) {
    return Math.round(elapsed/msPerMinute) + ' Minutes';
  } else if (elapsed < msPerDay ) {
    return Math.round(elapsed/msPerHour ) + ' Hours';
  } else if (elapsed < msPerMonth) {
    return Math.round(elapsed/msPerDay) + ' Days';
  } else if (elapsed < msPerYear) {
    return Math.round(elapsed/msPerMonth) + ' Months';
  } else {
    return Math.round(elapsed/msPerYear ) + ' Years';
  }
};
