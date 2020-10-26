import pako from 'pako';

export interface IHelmRelease {
  name: string;
  namespace: string;
  revision: number;
  updated: string;
  status: string;
  details?: IHelmDetails;
  secretName: string;
}

export interface IHelmReleases {
  [key: string]: IHelmRelease;
}

export interface IHelmDetails {
  name: string;
  info: IHelmDetailsInfo;
  chart: IHelmDetailsChart;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  config: any;
  manifest: string;
  version: number;
  namespace: string;
}

export interface IHelmDetailsInfo {
  [key: string]: string;
}

export interface IHelmDetailsChart {
  metadata: IHelmDetailsChartMetadata;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  lock?: any;
  templates: IHelmDetailsChartTemplate[];
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  values: any;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  schema?: any;
  files: IHelmDetailsChartFile[];
}

export interface IHelmDetailsChartMetadata {
  name: string;
  version: string;
  description: string;
  apiVersion: string;
  appVersion: string;
  type: string;
}

export interface IHelmDetailsChartFile {
  name: string;
  data: string;
}

export interface IHelmDetailsChartTemplate {
  name: string;
  data: string;
}

// getDetails decodes the "release" property of the Helm secret.
// See: https://github.com/helm/helm/blob/master/pkg/storage/driver/util.go
export const getDetails = (release: string): IHelmDetails => {
  const strData = atob(atob(release));
  const charData = strData.split('').map((x) => {
    return x.charCodeAt(0);
  });

  const binData = new Uint8Array(charData);
  const data = pako.inflate(binData);

  return JSON.parse(arrayBufferToString(data));
};

const arrayBufferToString = (buffer) => {
  const bytes = new Uint8Array(buffer);
  const len = bytes.byteLength;

  let binary = '';

  for (let i = 0; i < len; i++) {
    binary = binary + String.fromCharCode(bytes[i]);
  }

  return binary;
};
