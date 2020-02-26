export const CUSTOM_URI_SCHEME = 'io.kubenav.kubenav';
export const SERVER = process.env.NODE_ENV === 'production' ? '' : 'http://localhost:14122';
export const VERSION = process.env.REACT_APP_VERSION;

export const GOOGLE_OAUTH2_ENDPOINT = 'https://accounts.google.com/o/oauth2/v2/auth';
export const GOOGLE_REDIRECT_URI = `${CUSTOM_URI_SCHEME}:/settings/clusters/google`;
export const GOOGLE_RESPONSE_TYPE = 'code';
export const GOOGLE_SCOPE = 'https://www.googleapis.com/auth/cloud-platform';

export const STORAGE_AWS_TOKENS = 'aws';
export const STORAGE_CLUSTER = 'cluster';
export const STORAGE_CLUSTERS = 'clusters';
export const STORAGE_GOOGLE_CLIENT_ID = 'google_clientid';
export const STORAGE_GOOGLE_TOKENS = 'google';
