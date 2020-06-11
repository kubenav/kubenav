import {
  IAWSCluster,
  IAWSTokens,
  IAzureCluster,
  ICluster,
  IClusters,
  IGoogleCluster,
  IGoogleProject,
  IGoogleTokens,
  IOIDCProvider,
  IOIDCProviderToken,
  ITerminalResponse,
  TSyncType,
} from '../declarations';
import { GOOGLE_REDIRECT_URI, OIDC_REDIRECT_URL_WEB, SERVER } from './constants';
import { isJSON } from './helpers';
import { readAWSTokens, readGoogleClientID, readGoogleTokens, saveGoogleTokens } from './storage';

// getAWSClusters returns all EKS clusters from AWS for the provided access key, secret access key and region. This
// function is only available for the native mobile apps, on all other platforms an error is returned. For the desktop
// implementation this is not needed, because we are using kubeconfig file from ~/.kube/config.
export const getAWSClusters = async (
  accessKeyId: string,
  secretAccessKey: string,
  region: string,
): Promise<IAWSCluster[]> => {
  try {
    const response = await fetch(`${SERVER}/api/aws/clusters`, {
      method: 'post',
      body: JSON.stringify({
        accessKeyId: accessKeyId,
        secretAccessKey: secretAccessKey,
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
export const getAWSToken = async (
  accessKeyId: string,
  secretAccessKey: string,
  region: string,
  clusterID: string,
): Promise<string> => {
  try {
    const response = await fetch(`${SERVER}/api/aws/token`, {
      method: 'post',
      body: JSON.stringify({
        accessKeyId: accessKeyId,
        secretAccessKey: secretAccessKey,
        region: region,
        clusterID: clusterID,
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
export const getAzureClusters = async (
  subscriptionID: string,
  clientID: string,
  clientSecret: string,
  tenantID: string,
  resourceGroupName: string,
  admin: boolean,
): Promise<IAzureCluster[]> => {
  try {
    const response = await fetch(`${SERVER}/api/azure/clusters`, {
      method: 'post',
      body: JSON.stringify({
        subscriptionID: subscriptionID,
        clientID: clientID,
        clientSecret: clientSecret,
        tenantID: tenantID,
        resourceGroupName: resourceGroupName,
        admin: admin,
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
  const response = await fetch(`${SERVER}/api/cluster`, {
    method: 'GET',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json.cluster;
  }

  return undefined;
};

// getClusters returns all clusters from the Kubeconfig file on desktop.
export const getClusters = async (): Promise<IClusters | undefined> => {
  const response = await fetch(`${SERVER}/api/clusters`, {
    method: 'GET',
  });

  const json = await response.json();

  if (response.status >= 200 && response.status < 300) {
    return json.clusters;
  }

  return undefined;
};

// getGoogleAccessToken returns a valid access token for Google. Therefore we read the saved tokens from the
// localStorage. If the access token is expired, we request a new token from the Google API and save it. Then the
// correct token is returned.
const getGoogleAccessToken = async (): Promise<string> => {
  const tokens = readGoogleTokens();
  if (!tokens) {
    throw new Error('Could not get access token.');
  }

  const expiresData = new Date(tokens.expires_in);
  const accessToken = tokens.access_token;

  if (expiresData.getTime() < new Date().getTime()) {
    const newTokens = await getGoogleAccessTokenAPI(tokens.refresh_token);
    saveGoogleTokens({
      // eslint-disable-next-line @typescript-eslint/camelcase
      access_token: newTokens.access_token,
      // eslint-disable-next-line @typescript-eslint/camelcase
      expires_in: newTokens.expires_in,
      // eslint-disable-next-line @typescript-eslint/camelcase
      id_token: tokens.id_token,
      // eslint-disable-next-line @typescript-eslint/camelcase
      refresh_token: tokens.refresh_token,
      // eslint-disable-next-line @typescript-eslint/camelcase
      token_type: tokens.token_type,
    });
    return newTokens.access_token;
  }

  return accessToken;
};

// getGoogleAccessTokenAPI uses the refresh token to get a new valid access token for GKE clusters. Therefore a valid
// refresh token is required.
export const getGoogleAccessTokenAPI = async (refreshToken: string): Promise<IGoogleTokens> => {
  const response = await fetch(
    `https://oauth2.googleapis.com/token?refresh_token=${refreshToken}&client_id=${readGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=refresh_token`,
    {
      method: 'POST',
    },
  );

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

// getGoogleClusters returns all available GKE clusters for the provided project. For the authentication against the
// Google API a valid access token is required.
export const getGoogleClusters = async (token: string, project: string): Promise<IGoogleCluster[]> => {
  const response = await fetch(`https://container.googleapis.com/v1/projects/${project}/locations/-/clusters`, {
    headers: {
      Authorization: `Bearer ${token}`,
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

// getGoogleProjects returns all available projects for the authenticated user, from the Google API. Therefor a valid
// access token is required.
export const getGoogleProjects = async (token: string): Promise<IGoogleProject[]> => {
  const response = await fetch('https://cloudresourcemanager.googleapis.com/v1/projects', {
    headers: {
      Authorization: `Bearer ${token}`,
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

// getGoogleTokens is used to retrieve a refresh token from the Google API. This converts the returned code after the
// login via Google into an refresh token.
// See: https://developers.google.com/identity/protocols/OpenIDConnect#exchangecode
export const getGoogleTokens = async (code: string): Promise<IGoogleTokens> => {
  const response = await fetch(
    `https://oauth2.googleapis.com/token?code=${code}&client_id=${readGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&grant_type=authorization_code`,
    {
      method: 'POST',
    },
  );

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

// kubernetesRequest is used for operations against the Kubernetes API server. Before the request is execute the
// provided authentication provider is checked. If the authentication provider is Google and client certificates or
// username and password are not configured, an valid access token is requested. If the authentication provider is AWS,
// an valid access token is requested. The region and name for the selected cluster is saved in the cluster id, so we
// can reuse it to get a access token for the Kubernetes API server.
export const kubernetesRequest = async (
  method: string,
  url: string,
  body: string,
  timeout: number,
  cluster: ICluster,
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): Promise<any> => {
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
        throw new Error('Invalid cluster id for authentication provider AWS.');
      }

      if (!tokens.hasOwnProperty(parts[1])) {
        throw new Error('Could not find credentials for cluster.');
      }

      cluster.token = await getAWSToken(
        tokens[parts[1]].accessKeyID,
        tokens[parts[1]].secretKey,
        parts[1],
        parts.slice(2, parts.length).join('_'),
      );
    }

    const response = await fetch(`${SERVER}/api/kubernetes/request`, {
      method: 'post',
      body: JSON.stringify({
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
        insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
        timeout: timeout ? timeout : 60,
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

// execRequest initialize the request to get a shell into a container. The generated session id is returned and can be
// used to get the shell into the container.
export const execRequest = async (url: string, cluster: ICluster): Promise<ITerminalResponse> => {
  const response = await fetch(`${SERVER}/api/kubernetes/exec`, {
    method: 'post',
    body: JSON.stringify({
      server: SERVER,
      cluster: cluster ? cluster.id : '',
      url: cluster ? cluster.url + url : '',
      certificateAuthorityData: cluster ? cluster.certificateAuthorityData : '',
      clientCertificateData: cluster ? cluster.clientCertificateData : '',
      clientKeyData: cluster ? cluster.clientKeyData : '',
      token: cluster ? cluster.token : '',
      username: cluster ? cluster.username : '',
      password: cluster ? cluster.password : '',
      insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
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
};

// logsRequest returns the session id to stream the log files of a container via server sent events.
export const logsRequest = async (url: string, cluster: ICluster): Promise<ITerminalResponse> => {
  const response = await fetch(`${SERVER}/api/kubernetes/logs`, {
    method: 'post',
    body: JSON.stringify({
      server: SERVER,
      cluster: cluster ? cluster.id : '',
      url: cluster ? cluster.url + url : '',
      certificateAuthorityData: cluster ? cluster.certificateAuthorityData : '',
      clientCertificateData: cluster ? cluster.clientCertificateData : '',
      clientKeyData: cluster ? cluster.clientKeyData : '',
      token: cluster ? cluster.token : '',
      username: cluster ? cluster.username : '',
      password: cluster ? cluster.password : '',
      insecureSkipTLSVerify: cluster ? cluster.insecureSkipTLSVerify : false,
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
};

// getOIDCAccessToken returns a new id and access token for the provided OIDC provider. To get a new id and access token
// a valid refresh token is required.
export const getOIDCAccessToken = async (provider: IOIDCProvider): Promise<IOIDCProviderToken> => {
  if (provider.expiry - 60 > Math.floor(Date.now() / 1000)) {
    return {
      // eslint-disable-next-line @typescript-eslint/camelcase
      id_token: provider.idToken,
      // eslint-disable-next-line @typescript-eslint/camelcase
      refresh_token: provider.refreshToken,
      // eslint-disable-next-line @typescript-eslint/camelcase
      access_token: provider.accessToken,
      expiry: provider.expiry,
    };
  }

  try {
    const response = await fetch(`${SERVER}/api/oidc/accesstoken`, {
      method: 'post',
      body: JSON.stringify({
        discoveryURL: provider.idpIssuerURL,
        clientID: provider.clientID,
        clientSecret: provider.clientSecret,
        redirectURL: OIDC_REDIRECT_URL_WEB,
        refreshToken: provider.refreshToken,
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

// getOIDCLink returns the login link for the OIDC provider. The user is redirect to the returned link. After the user
// logged in the getOIDCRefreshToken function is used to exchange the returned code for a refresh token.
export const getOIDCLink = async (discoveryURL: string, clientID: string, clientSecret: string): Promise<string> => {
  try {
    const response = await fetch(`${SERVER}/api/oidc/link`, {
      method: 'post',
      body: JSON.stringify({
        discoveryURL: discoveryURL,
        clientID: clientID,
        clientSecret: clientSecret,
        redirectURL: OIDC_REDIRECT_URL_WEB,
      }),
    });

    const json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json.url;
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
  discoveryURL: string,
  clientID: string,
  clientSecret: string,
  code: string,
): Promise<IOIDCProviderToken> => {
  try {
    const response = await fetch(`${SERVER}/api/oidc/refreshtoken`, {
      method: 'post',
      body: JSON.stringify({
        discoveryURL: discoveryURL,
        clientID: clientID,
        clientSecret: clientSecret,
        redirectURL: OIDC_REDIRECT_URL_WEB,
        code: code,
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

// syncKubeconfig is used to applie the changes to the current context or namespace to the loaded Kubeconfig file.
export const syncKubeconfig = async (context: string, namespace: string, syncType: TSyncType): Promise<boolean> => {
  try {
    const response = await fetch(`${SERVER}/api/sync/${syncType}`, {
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
