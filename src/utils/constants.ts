import { ITerminalOptions } from 'xterm';

import { IAppSettings } from '../declarations';

export const CUSTOM_URI_SCHEME = 'io.kubenav.kubenav';
export const SERVER = 'http://localhost:14122';
export const VERSION = process.env.REACT_APP_VERSION;

export const DEFAULT_SETTINGS: IAppSettings = {
  darkMode: window.matchMedia('(prefers-color-scheme: dark)').matches,
  timeout: 60,
};

export const GOOGLE_OAUTH2_ENDPOINT = 'https://accounts.google.com/o/oauth2/v2/auth';
export const GOOGLE_REDIRECT_URI = `${CUSTOM_URI_SCHEME}:/settings/clusters/google`;
export const GOOGLE_RESPONSE_TYPE = 'code';
export const GOOGLE_SCOPE = 'https://www.googleapis.com/auth/cloud-platform';

export const OIDC_REDIRECT_URL = `${CUSTOM_URI_SCHEME}:/settings/clusters/oidc/redirect`;
export const OIDC_REDIRECT_URL_WEB = 'https://kubenav.io/oidc.html';

export const STORAGE_AWS_TOKENS = 'aws';
export const STORAGE_AZURE_CREDENTIALS = 'azure';
export const STORAGE_CLUSTER = 'cluster';
export const STORAGE_CLUSTERS = 'clusters';
export const STORAGE_GOOGLE_CLIENT_ID = 'google_clientid';
export const STORAGE_GOOGLE_TOKENS = 'google';
export const STORAGE_OIDC_PROVIDERS = 'oidc';
export const STORAGE_OIDC_PROVIDERS_LAST = 'oidc_last';
export const STORAGE_SETTINGS = 'settings';

export const LOG_TAIL_LINES = 1000;
export const LOG_TERMINAL_OPTIONS = (darkMode: boolean): ITerminalOptions => {
  return {
    fontSize: 12,
    bellStyle: 'sound',
    cursorBlink: true,
    disableStdin: true,
    convertEol: true,
    scrollback: 10000,
    theme: darkMode ? TERMINAL_DARK_THEME : TERMINAL_LIGHT_THEME,
  };
};

export const TERMINAL_DARK_THEME = {
  foreground: '#d8dee9',
  background: '#2e3440',
  cursor: '#d8dee9',
  selection: '#434c5ecc',
  black: '#3b4251',
  red: '#bf6069',
  green: '#a3be8b',
  yellow: '#eacb8a',
  blue: '#81a1c1',
  magenta: '#b48dac',
  cyan: '#88c0d0',
  white: '#e5e9f0',
  brightBlack: '#4c556a',
  brightRed: '#bf6069',
  brightGreen: '#a3be8b',
  brightYellow: '#eacb8a',
  brightBlue: '#81a1c1',
  brightMagenta: '#b48dac',
  brightCyan: '#8fbcbb',
  brightWhite: '#eceef4',
};
export const TERMINAL_LIGHT_THEME = {
  foreground: '#000000',
  background: '#ffffff',
  cursor: '#000000',
  selection: '#b5d5ff',
  black: '#4f4f4f',
  red: '#a91b1b',
  green: '#00a237',
  yellow: '#f9f0d1',
  blue: '#00529b',
  magenta: '#ef61a2',
  cyan: '#98d9ef',
  white: '#feffff',
  brightBlack: '#797979',
  brightRed: '#e62000',
  brightGreen: '#96dab1',
  brightYellow: '#f4d600',
  brightBlue: '#3981c6',
  brightMagenta: '#ffb3ae',
  brightCyan: '#00f9fe',
  brightWhite: '#feffff',
};
