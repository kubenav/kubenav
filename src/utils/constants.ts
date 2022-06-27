import { ITerminalOptions } from 'xterm';

import { IAppSettings } from '../declarations';

export const CUSTOM_URI_SCHEME = 'io.kubenav.kubenav';
export const INCLUSTER_URL = process.env.REACT_APP_INCLUSTER === 'true' ? '' : 'http://localhost:14122';
export const IS_INCLUSTER = process.env.REACT_APP_INCLUSTER === 'true' ? true : false;
export const VERSION = process.env.REACT_APP_VERSION;
export const DEBUG_MOBILE_FRONTEND = process.env.DEBUG_MOBILE_FRONTEND === 'true' ? true : false;

export const DEFAULT_SETTINGS: IAppSettings = {
  theme: 'system',
  authenticationEnabled: false,
  timeout: 60,
  terminalFontSize: 12,
  terminalScrollback: 10000,
  editorFormat: 'yaml',
  enablePodMetrics: true,
  queryLimit: 100,
  queryRefetchInterval: 5 * 60 * 1000,
  sshKey: '',
  sshPort: '22',
  sshUser: '',
  prometheusEnabled: false,
  prometheusNamespace: 'monitoring',
  prometheusSelector: 'app=prometheus',
  prometheusPort: 9090,
  prometheusUsername: '',
  prometheusPassword: '',
  prometheusAddress: '',
  prometheusDashboardsNamespace: 'kubenav',
  elasticsearchEnabled: false,
  elasticsearchNamespace: 'logging',
  elasticsearchSelector: 'app=elasticsearch',
  elasticsearchPort: 9200,
  elasticsearchUsername: '',
  elasticsearchPassword: '',
  elasticsearchAddress: '',
  jaegerEnabled: false,
  jaegerNamespace: 'tracing',
  jaegerSelector: 'app=jaeger,app.kubernetes.io/component=query',
  jaegerPort: 16686,
  jaegerUsername: '',
  jaegerPassword: '',
  jaegerQueryBasePath: '',
  jaegerAddress: '',
  proxyEnabled: false,
  proxyAddress: '',
  helmShowAllVersions: false,
};

export const GOOGLE_OAUTH2_ENDPOINT = 'https://accounts.google.com/o/oauth2/v2/auth';
export const GOOGLE_REDIRECT_URI = `${CUSTOM_URI_SCHEME}:/settings/clusters/google`;
export const GOOGLE_RESPONSE_TYPE = 'code';
export const GOOGLE_SCOPE = 'https://www.googleapis.com/auth/cloud-platform';
export const GOOGLE_CONTAINER_ENGINE_API = 'container.googleapis.com';
export const GOOGLE_SERVICE_USAGE_STATE_ENABLED = 'ENABLED';

export const OIDC_REDIRECT_URL = `${CUSTOM_URI_SCHEME}:/settings/clusters/oidc/redirect`;
export const OIDC_REDIRECT_URL_WEB = 'https://kubenav.io/oidc.html';

export const STORAGE_BOOKMARKS = 'bookmarks';
export const STORAGE_CLUSTER = 'cluster';
export const STORAGE_CLUSTERS = 'clusters';
export const STORAGE_SETTINGS = 'settings';
export const STORAGE_TEMPORARY_CREDENTIALS = 'temporary_credentials';

export const LOG_TAIL_LINES = 1000;
export const LOG_TERMINAL_OPTIONS = (fontSize: number, scrollback: number, darkMode: boolean): ITerminalOptions => {
  return {
    fontSize: fontSize,
    bellStyle: 'sound',
    cursorBlink: true,
    disableStdin: true,
    convertEol: true,
    scrollback: scrollback,
    theme: darkMode ? TERMINAL_DARK_THEME : TERMINAL_LIGHT_THEME,
  };
};

export const SHELL_TERMINAL_OPTIONS = (fontSize: number, scrollback: number, darkMode: boolean): ITerminalOptions => {
  return {
    fontSize: fontSize,
    bellStyle: 'sound',
    cursorBlink: true,
    scrollback: scrollback,
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
