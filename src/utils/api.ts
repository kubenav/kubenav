import { Plugins } from '@capacitor/core';
import { isPlatform } from '@ionic/react';

import {
  IAppSettings,
  IAWSCluster,
  IAWSSSO,
  IAWSSSOCredentials,
  IAzureCluster,
  ICluster,
  IClusterAuthProviderAWS,
  IClusterAuthProviderAzure,
  IClusterAuthProviderGoogle,
  IClusterAuthProviderOIDC,
  IClusters,
  IDigitalOceanCluster,
  IGoogleCluster,
  IGoogleProject,
  IGoogleTokensAPIResponse,
  IInclusterSettings,
  IJsonData,
  IOIDCProviderTokenAPIResponse,
  IPortForwardingResponse,
  ITerminalResponse,
  TSyncType,
  IRancherLoginRequest,
  IMinimalRancherLoginRequest,
  IRancherClusters,
  IRancherGeneratedKubeconfig,
  IRancherKubeconfigRequest,
  IRancherTokenResponse,
  IOIDCLinkResponse,
} from '../declarations';
import { GOOGLE_REDIRECT_URI, INCLUSTER_URL, OIDC_REDIRECT_URL_WEB } from './constants';
import { isJSON } from './helpers';

const { KubenavPlugin } = Plugins;

// checkServer checks if the API is ready. An error can only occure when the server was stopped. In this case the server
// is started and we wait 1 second befor the function returns.
const checkServer = async (): Promise<boolean> => {
  if (isPlatform('hybrid')) {
    try {
      const response = await fetch(`${INCLUSTER_URL}/api/health`);

      if (response.status >= 200 && response.status < 300) {
        return true;
      } else {
        throw new Error('Server is unhealthy.');
      }
    } catch (err) {
      await KubenavPlugin.startServer();

      return new Promise((resolve) => {
        setTimeout(resolve, 1000);
      });
    }
  } else {
    return true;
  }
};

// getAWSClusters returns all EKS clusters from AWS for the provided access key, secret access key and region. This
// function is only available for the native mobile apps, on all other platforms an error is returned. For the desktop
// implementation this is not needed, because we are using kubeconfig file from ~/.kube/config.
export const getAWSClusters = async (credentials: IClusterAuthProviderAWS): Promise<IAWSCluster[]> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/aws/clusters`, {
      method: 'post',
      body: JSON.stringify({
        accessKeyId: credentials.accessKeyID,
        secretAccessKey: credentials.secretKey,
        sessionToken: credentials.sessionToken ? credentials.sessionToken : '',
        region: credentials.region,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getAWSSSOConfig initialize the SSO flow, by registering a new client and starting the device authentication.
export const getAWSSSOConfig = async (startURL: string, ssoRegion: string): Promise<IAWSSSO> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/aws/ssoconfig`, {
      method: 'post',
      body: JSON.stringify({
        startURL: startURL,
        ssoRegion: ssoRegion,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getAWSSSOCredentails is used to retrieve creadentials for AWS with the SSO config.
export const getAWSSSOCredentails = async (credentials: IAWSSSOCredentials): Promise<IAWSSSOCredentials> => {
  try {
    if (credentials.expire - 60000 > new Date().getTime()) {
      return credentials;
    }

    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/aws/ssotoken`, {
      method: 'post',
      body: JSON.stringify({
        startURL: credentials.startURL,
        region: credentials.region,
        accountID: credentials.accountID,
        roleName: credentials.roleName,
        accessToken: credentials.accessToken,
        accessTokenExpire: credentials.accessTokenExpire,
        clusterID: credentials.clusterID,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getAWSSSOCredentailsWithConfig is used to retrieve creadentials for AWS with the SSO config.
export const getAWSSSOCredentailsWithConfig = async (
  config: IAWSSSO,
  startURL: string,
  ssoRegion: string,
  accountID: string,
  roleName: string,
  region: string,
): Promise<IAWSSSOCredentials> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/aws/ssotoken`, {
      method: 'post',
      body: JSON.stringify({
        client: config.client,
        device: config.device,
        startURL: startURL,
        ssoRegion: ssoRegion,
        accountID: accountID,
        roleName: roleName,
        region: region,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getAWSToken returns a valid authentication token for API requests against a EKS cluster. This function is only
// available for the native mobile apps, on all other platforms an error is returned. For the desktop implementation
// this is not needed, because we are using kubeconfig file from ~/.kube/config.
export const getAWSToken = async (credentials: IClusterAuthProviderAWS): Promise<string> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/aws/token`, {
      method: 'post',
      body: JSON.stringify({
        accessKeyId: credentials.accessKeyID,
        secretAccessKey: credentials.secretKey,
        sessionToken: credentials.sessionToken ? credentials.sessionToken : '',
        region: credentials.region,
        clusterID: credentials.clusterID,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json.token;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getAzureClusters returns all AKS clusters from Azure for the provided subscription ID, client ID, client secret,
// tenant ID and resource group. The user can decide if he want to retrieve the admin or user credentials.
export const getAzureClusters = async (credentials: IClusterAuthProviderAzure): Promise<IAzureCluster[]> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/azure/clusters`, {
      method: 'post',
      body: JSON.stringify({
        subscriptionID: credentials.subscriptionID,
        clientID: credentials.clientID,
        clientSecret: credentials.clientSecret,
        tenantID: credentials.tenantID,
        resourceGroupName: credentials.resourceGroupName,
        admin: credentials.admin,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getCluster returns the cluster from the current Kubeconfig context. This is only needed for development in the
// browser. For the mobile app the active cluster is retrieved from localStorage and for desktop the current context is
// also saved in localStorage at startup.
export const getCluster = async (): Promise<string | undefined> => {
  try {
    const response = await fetch(`${INCLUSTER_URL}/api/cluster`, {
      method: 'GET',
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json.cluster || undefined;
    }

    return undefined;
  } catch (err) {
    return undefined;
  }
};

// getClusters returns all clusters from the Kubeconfig file on desktop.
export const getClusters = async (): Promise<IClusters | undefined> => {
  try {
    const response = await fetch(`${INCLUSTER_URL}/api/clusters`, {
      method: 'GET',
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      if (Object.keys(json.clusters).length === 0) {
        return undefined;
      } else {
        return json.clusters;
      }
    }

    return undefined;
  } catch (err) {
    return undefined;
  }
};

// getDigitalOceanClusters returns all clusters from the DigitalOcean API. For that we need a valid API Token for the
// request. To use the returned clusters we have to retrieve the Kubeconfig for each cluster in the next step.
export const getDigitalOceanClusters = async (token: string): Promise<IDigitalOceanCluster[]> => {
  try {
    const response = await fetch(`https://api.digitalocean.com/v2/kubernetes/clusters`, {
      method: 'GET',
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json.kubernetes_clusters;
    }

    if (json.message) {
      throw new Error(json.message);
    } else {
      throw new Error('An unknown error occurred.');
    }
  } catch (err) {
    throw err;
  }
};

// getDigitalOceanClusters returns all clusters from the DigitalOcean API. For that we need a valid API Token for the
// request. To use the returned clusters we have to retrieve the Kubeconfig for each cluster in the next step.
export const getDigitalOceanKubeconfig = async (token: string, clusterID: string): Promise<string> => {
  try {
    const response = await fetch(`https://api.digitalocean.com/v2/kubernetes/clusters/${clusterID}/kubeconfig`, {
      method: 'GET',
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    if (response.status >= 200 && response.status < 300) {
      return await response.text();
    }

    const json = await response.json();

    if (json.message) {
      throw new Error(json.message);
    } else {
      throw new Error('An unknown error occurred.');
    }
  } catch (err) {
    throw err;
  }
};

// getGoogleAccessToken returns a valid access token for Google. Therefore we read the saved tokens from the
// localStorage. If the access token is expired, we request a new token from the Google API and save it. Then the
// correct token is returned.
export const getGoogleAccessToken = async (
  credentials: IClusterAuthProviderGoogle,
): Promise<IClusterAuthProviderGoogle> => {
  if (credentials.expires - 60 > new Date().getTime()) {
    return credentials;
  }

  try {
    const response = await fetch(
      `https://oauth2.googleapis.com/token?refresh_token=${credentials.refreshToken}&client_id=${credentials.clientID}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=refresh_token`,
      {
        method: 'POST',
      },
    );

    const json: IGoogleTokensAPIResponse = await response.json();

    if (response.status >= 200 && response.status < 300) {
      credentials.accessToken = json.access_token;
      credentials.expires = new Date().getTime() + json.expires_in * 1000;
      credentials.idToken = json.id_token;
      credentials.tokenType = json.token_type;

      return credentials;
    }

    if (json.error && json.error_description) {
      throw new Error(`${json.error}: ${json.error_description}`);
    } else {
      throw new Error('An unknown error occurred.');
    }
  } catch (err) {
    throw err;
  }
};

// getGoogleClusters returns all available GKE clusters for the provided project. For the authentication against the
// Google API a valid access token is required.
export const getGoogleClusters = async (accessToken: string, project: string): Promise<IGoogleCluster[]> => {
  try {
    const response = await fetch(`https://container.googleapis.com/v1/projects/${project}/locations/-/clusters`, {
      headers: {
        Authorization: `Bearer ${accessToken}`,
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
  } catch (err) {
    throw err;
  }
};

// getGoogleProjects returns all available projects for the authenticated user, from the Google API. Therefor a valid
// access token is required.
export const getGoogleProjects = async (accessToken: string): Promise<IGoogleProject[]> => {
  try {
    const response = await fetch('https://cloudresourcemanager.googleapis.com/v1/projects', {
      headers: {
        Authorization: `Bearer ${accessToken}`,
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
  } catch (err) {
    throw err;
  }
};

// getGoogleTokens is used to retrieve a refresh token from the Google API. This converts the returned code after the
// login via Google into an refresh token.
// See: https://developers.google.com/identity/protocols/OpenIDConnect#exchangecode
export const getGoogleTokens = async (clientID: string, code: string): Promise<IClusterAuthProviderGoogle> => {
  try {
    const response = await fetch(
      `https://oauth2.googleapis.com/token?code=${code}&client_id=${clientID}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=authorization_code`,
      {
        method: 'POST',
      },
    );

    const json: IGoogleTokensAPIResponse = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return {
        accessToken: json.access_token,
        clientID: clientID,
        expires: new Date().getTime() + json.expires_in * 1000,
        idToken: json.id_token,
        refreshToken: json.refresh_token,
        tokenType: json.token_type,
      };
    }

    if (json.error && json.error_description) {
      throw new Error(`${json.error}: ${json.error_description}`);
    } else {
      throw new Error('An unknown error occurred.');
    }
  } catch (err) {
    throw err;
  }
};

// getRancherToken creates and adds api token in rancher
export const getRancherToken = async (
  rancherHost: string,
  rancherPort: number,
  username: string,
  password: string,
  bearerToken: string,
  secure: boolean,
): Promise<IRancherTokenResponse> => {
  try {
    const data: IRancherLoginRequest = {
      rancherHost: rancherHost,
      rancherPort: rancherPort,
      username: username,
      password: password,
      bearerToken: bearerToken,
      secure: secure,
    };

    const response = await fetch(`${INCLUSTER_URL}/api/rancher/generateapitoken`, {
      method: 'POST',
      body: JSON.stringify(data),
    });

    if (response.status >= 200 && response.status < 300) {
      const json = await response.json();

      return json;
    } else if (response.status == 401) {
      throw new Error('Unauthorized - Login failed.');
    } else {
      throw new Error('An unknown error occurred.');
    }
  } catch (err) {
    throw err;
  }
};

// getRancherClusters returns a list of available clusters from rancher for provided in user
export const getRancherClusters = async (
  rancherHost: string,
  rancherPort: number,
  username: string,
  password: string,
  secure: boolean,
  bearerToken: string,
): Promise<IRancherClusters> => {
  try {
    const data: IMinimalRancherLoginRequest = {
      rancherHost: rancherHost,
      rancherPort: rancherPort,
      username: username,
      password: password,
      bearerToken: bearerToken,
      secure: secure,
    };

    const response = await fetch(`${INCLUSTER_URL}/api/rancher/listclusters`, {
      method: 'POST',
      body: JSON.stringify(data),
    });

    if (response.status >= 200 && response.status < 300) {
      const json = await response.json();

      return json;
    } else if (response.status == 401) {
      throw new Error('Unauthorized - Login failed.');
    } else {
      throw new Error('An unknown error occurred.');
    }
  } catch (err) {
    throw err;
  }
};

// getRancherKubeconfig returns generated kubeconfig from rancher
export const getRancherKubeconfig = async (
  rancherHost: string,
  rancherPort: number,
  username: string,
  password: string,
  secure: boolean,
  bearerToken: string,
  clusterId: string,
): Promise<IRancherGeneratedKubeconfig> => {
  try {
    const data: IRancherKubeconfigRequest = {
      rancherHost: rancherHost,
      rancherPort: rancherPort,
      username: username,
      password: password,
      bearerToken: bearerToken,
      secure: secure,
      clusterId: clusterId,
    };

    const response = await fetch(`${INCLUSTER_URL}/api/rancher/kubeconfig`, {
      method: 'POST',
      body: JSON.stringify(data),
    });

    if (response.status >= 200 && response.status < 300) {
      const rancherGeneratedKubeconfig: IRancherGeneratedKubeconfig = await response.json();

      return rancherGeneratedKubeconfig;
    } else if (response.status == 401) {
      throw new Error('Unauthorized - Login failed.');
    } else {
      throw new Error('An unknown error occurred.');
    }
  } catch (err) {
    throw err;
  }
};

// getInclusterSettings returns the settings for kubenav which can be set via command-line flags with the incluster
// mode.
export const getInclusterSettings = async (): Promise<IInclusterSettings | undefined> => {
  try {
    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/plugins`, {
      method: 'GET',
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    }

    return undefined;
  } catch (err) {
    return undefined;
  }
};

// kubernetesRequest is used for operations against the Kubernetes API server. Before the request is execute the
// provided authentication provider is checked. If the authentication provider is Google and client certificates or
// username and password are not configured, an valid access token is requested. If the authentication provider is AWS,
// an valid access token is requested. The region and name for the selected cluster is saved in the cluster id, so we
// can reuse it to get a access token for the Kubernetes API server.
export const kubernetesRequest = async (
  method: string,
  url: string,
  body: string,
  settings: IAppSettings,
  cluster: ICluster,
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): Promise<any> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/request`, {
      method: 'post',
      body: JSON.stringify({
        server: INCLUSTER_URL,
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
        insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
        timeout: settings.timeout ? settings.timeout : 60,
        proxy: settings.proxyEnabled ? settings.proxyAddress : '',
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      if (isJSON(json.data)) {
        return JSON.parse(json.data);
      } else {
        return json.data;
      }
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// kubernetesExecRequest initialize the request to get a shell into a container. The generated session id is returned
// and can be used to get the shell into the container.
export const kubernetesExecRequest = async (
  url: string,
  settings: IAppSettings,
  cluster: ICluster,
): Promise<ITerminalResponse> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/exec`, {
      method: 'post',
      body: JSON.stringify({
        server: INCLUSTER_URL,
        cluster: cluster ? cluster.id : '',
        url: cluster ? cluster.url + url : '',
        certificateAuthorityData: cluster ? cluster.certificateAuthorityData : '',
        clientCertificateData: cluster ? cluster.clientCertificateData : '',
        clientKeyData: cluster ? cluster.clientKeyData : '',
        token: cluster ? cluster.token : '',
        username: cluster ? cluster.username : '',
        password: cluster ? cluster.password : '',
        insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
        timeout: settings.timeout ? settings.timeout : 60,
        proxy: settings.proxyEnabled ? settings.proxyAddress : '',
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// kubernetesPortForwardingActiveSessions returns all active port forwarding sessions.
export const kubernetesPortForwardingActiveSessions = async (): Promise<IPortForwardingResponse[] | null> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/portforwarding`, {
      method: 'get',
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// kubernetesPortForwardingRequest initialize the port forwarding to a pod. The generated session id which is returned
// can be used to close the port forwarding.
export const kubernetesPortForwardingRequest = async (
  podName: string,
  podNamespace: string,
  podPort: number,
  localPort: number,
  settings: IAppSettings,
  cluster: ICluster,
): Promise<IPortForwardingResponse> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/portforwarding`, {
      method: 'post',
      body: JSON.stringify({
        podName: podName,
        podNamespace: podNamespace,
        podPort: podPort,
        localPort: localPort,
        server: INCLUSTER_URL,
        cluster: cluster ? cluster.id : '',
        url: cluster ? cluster.url : '',
        certificateAuthorityData: cluster ? cluster.certificateAuthorityData : '',
        clientCertificateData: cluster ? cluster.clientCertificateData : '',
        clientKeyData: cluster ? cluster.clientKeyData : '',
        token: cluster ? cluster.token : '',
        username: cluster ? cluster.username : '',
        password: cluster ? cluster.password : '',
        insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
        timeout: settings.timeout ? settings.timeout : 60,
        proxy: settings.proxyEnabled ? settings.proxyAddress : '',
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// kubernetesPortForwardingStopRequest closes a formaly opened port by the session id.
export const kubernetesPortForwardingStopRequest = async (id: string): Promise<boolean> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/portforwarding`, {
      method: 'delete',
      body: JSON.stringify({
        id: id,
      }),
    });

    if (response.status >= 200 && response.status < 300) {
      return true;
    } else {
      const json = await response.json();

      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// kubernetesLogsRequest returns the session id to stream the log files of a container via server sent events.
export const kubernetesLogsRequest = async (
  url: string,
  settings: IAppSettings,
  cluster: ICluster,
): Promise<ITerminalResponse> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/logs`, {
      method: 'post',
      body: JSON.stringify({
        server: INCLUSTER_URL,
        cluster: cluster ? cluster.id : '',
        url: cluster ? cluster.url + url : '',
        certificateAuthorityData: cluster ? cluster.certificateAuthorityData : '',
        clientCertificateData: cluster ? cluster.clientCertificateData : '',
        clientKeyData: cluster ? cluster.clientKeyData : '',
        token: cluster ? cluster.token : '',
        username: cluster ? cluster.username : '',
        password: cluster ? cluster.password : '',
        insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
        timeout: settings.timeout ? settings.timeout : 60,
        proxy: settings.proxyEnabled ? settings.proxyAddress : '',
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

export const pluginRequest = async (
  name: string,
  port: number,
  address: string,
  data: IJsonData,
  portforwardingPath: string,
  settings: IAppSettings,
  cluster: ICluster,
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): Promise<any> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/plugins`, {
      method: 'post',
      body: JSON.stringify({
        name: name,
        port: port,
        address: address,
        data: data,
        portforwardingPath: portforwardingPath,
        server: INCLUSTER_URL,
        cluster: cluster ? cluster.id : '',
        url: cluster ? cluster.url : '',
        certificateAuthorityData: cluster ? cluster.certificateAuthorityData : '',
        clientCertificateData: cluster ? cluster.clientCertificateData : '',
        clientKeyData: cluster ? cluster.clientKeyData : '',
        token: cluster ? cluster.token : '',
        username: cluster ? cluster.username : '',
        password: cluster ? cluster.password : '',
        insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
        timeout: settings.timeout ? settings.timeout : 60,
        proxy: settings.proxyEnabled ? settings.proxyAddress : '',
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// sshRequest initialize the request to get a SSH connection to a node. The generated session id is returned and can be
// used to get the SSH connection to the node.
export const sshRequest = async (key: string, address: string, user: string): Promise<ITerminalResponse> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/kubernetes/ssh`, {
      method: 'post',
      body: JSON.stringify({
        key: key,
        address: address,
        user: user,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getOIDCAccessToken returns a new id and access token for the provided OIDC provider. To get a new id and access token
// a valid refresh token is required.
export const getOIDCAccessToken = async (credentials: IClusterAuthProviderOIDC): Promise<IClusterAuthProviderOIDC> => {
  if (credentials.expiry - 60 > Math.floor(Date.now() / 1000)) {
    return credentials;
  }

  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/oidc/accesstoken`, {
      method: 'post',
      body: JSON.stringify({
        discoveryURL: credentials.idpIssuerURL,
        clientID: credentials.clientID,
        clientSecret: credentials.clientSecret,
        certificateAuthority: credentials.certificateAuthority ? credentials.certificateAuthority : '',
        redirectURL: OIDC_REDIRECT_URL_WEB,
        refreshToken: credentials.refreshToken,
        scopes: credentials.scopes ? credentials.scopes : '',
      }),
    });

    const json: IOIDCProviderTokenAPIResponse = await response.json();

    if (response.status >= 200 && response.status < 300) {
      credentials.idToken = json.id_token;
      credentials.accessToken = json.access_token;
      credentials.expiry = json.expiry;

      return credentials;
    } else {
      if (json.error && json.message) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getOIDCLink returns the login link for the OIDC provider. The user is redirect to the returned link. After the user
// logged in the getOIDCRefreshToken function is used to exchange the returned code for a refresh token.
export const getOIDCLink = async (
  discoveryURL: string,
  clientID: string,
  clientSecret: string,
  certificateAuthority: string,
  scopes?: string,
  pkceMethod?: 'S256',
): Promise<IOIDCLinkResponse> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/oidc/link`, {
      method: 'post',
      body: JSON.stringify({
        discoveryURL: discoveryURL,
        clientID: clientID,
        clientSecret: clientSecret,
        certificateAuthority: certificateAuthority,
        redirectURL: OIDC_REDIRECT_URL_WEB,
        scopes: scopes ? scopes : '',
        pkceMethod: pkceMethod,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json;
    } else {
      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// getOIDCRefreshToken is used to exchange the returned code from the login against a refresh token. The refresh token
// is used to get a new id and access token, which is used to make requests against the Kubernetes API.
export const getOIDCRefreshToken = async (
  credentials: IClusterAuthProviderOIDC,
  code: string,
): Promise<IClusterAuthProviderOIDC> => {
  try {
    await checkServer();

    const response = await fetch(`${INCLUSTER_URL}/api/oidc/refreshtoken`, {
      method: 'post',
      body: JSON.stringify({
        discoveryURL: credentials.idpIssuerURL,
        clientID: credentials.clientID,
        clientSecret: credentials.clientSecret,
        certificateAuthority: credentials.certificateAuthority,
        redirectURL: OIDC_REDIRECT_URL_WEB,
        code: code,
        scopes: credentials.scopes ? credentials.scopes : '',
        verifier: credentials.verifier,
      }),
    });

    const json: IOIDCProviderTokenAPIResponse = await response.json();

    if (response.status >= 200 && response.status < 300) {
      credentials.idToken = json.id_token;
      credentials.refreshToken = json.refresh_token;
      credentials.accessToken = json.access_token;
      credentials.expiry = json.expiry;

      return credentials;
    } else {
      if (json.error && json.message) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};

// syncKubeconfig is used to applie the changes to the current context or namespace to the loaded Kubeconfig file.
export const syncKubeconfig = async (context: string, namespace: string, syncType: TSyncType): Promise<boolean> => {
  try {
    const response = await fetch(`${INCLUSTER_URL}/api/sync/${syncType}`, {
      method: 'post',
      body: JSON.stringify({
        context: context,
        namespace: namespace,
      }),
    });

    if (response.status >= 200 && response.status < 300) {
      return true;
    } else {
      const json = await response.json();

      if (json.error) {
        throw new Error(json.message);
      } else {
        throw new Error('An unknown error occured');
      }
    }
  } catch (err) {
    throw err;
  }
};
