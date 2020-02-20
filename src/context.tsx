import { Plugins } from '@capacitor/core';
import { IonSpinner, isPlatform } from '@ionic/react';
import { KubenavPlugin as KubenavWebPlugin } from '@kubenav/kubenav-plugin';
import React, { useEffect, useState } from 'react';

import { SERVER } from './constants';
import { IAWSTokens, ICluster, IClusters, IContext, IGoogleTokens } from './declarations';
import { getAWSToken, getCluster, getClusters, getGoogleAccessToken, isBase64, isJSON, randomString, saveGoogleTokens } from './utils';

const { KubenavPlugin } = Plugins;

const getAccessToken = async (): Promise<string> => {
  const tokens: IGoogleTokens|undefined = localStorage.getItem('google') ? JSON.parse(localStorage.getItem('google')!) : undefined;
  if (!tokens) {
    throw new Error('Could not get access token.')
  }

  const expiresData = new Date(tokens.expires_in);
  let accessToken = tokens.access_token;

  if (expiresData.getTime() < new Date().getTime()) {
    const newTokens = await getGoogleAccessToken(tokens.refresh_token);
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

const localStorageClusterExists = (cluster: string, clusters: IClusters|undefined): boolean => {
  for (let c in clusters) {
    if (c === cluster) {
      return true;
    }
  }

  return false;
};

export const AppContext = React.createContext<IContext>({
  clusters: {},
  cluster: '',

  addCluster: () => {},
  changeCluster: () => {},
  deleteCluster: () => {},
  editCluster: () => {},
  setNamespace: () => {},
  request: () => { return new Promise(() => {}); },
});

export const AppContextConsumer = AppContext.Consumer;

export const AppContextProvider: React.FunctionComponent = ({ children }) => {
  const [loading, setLoading] = useState<boolean>(true);
  const [clusters, setClusters] = useState<IClusters|undefined>(undefined);
  const [cluster, setCluster] = useState<string|undefined>(undefined);

  useEffect(() => {
    (async() => {
      if (loading) {
        if (!isPlatform('hybrid')) {
          const clustersData = await getClusters(SERVER);
          setClusters(clustersData);

          if (localStorage.getItem('cluster') && localStorageClusterExists(localStorage.getItem('cluster') as string, clustersData)) {
            setCluster(localStorage.getItem('cluster') as string);
          } else {
            const clusterData = await getCluster(SERVER);
            setCluster(clusterData);
          }
        } else {
          setClusters(localStorage.getItem('clusters') !== null && localStorage.getItem('clusters') !== '' ? JSON.parse(localStorage.getItem('clusters') as string) as IClusters : undefined);
          setCluster(localStorage.getItem('cluster') !== null && localStorage.getItem('cluster') !== '' ? localStorage.getItem('cluster') as string : clusters && Object.keys(clusters).length > 0 ? Object.keys(clusters)[0] : undefined);
        }
      }

      setLoading(false);
    })();

    return () => {};
  }, [loading]); /* eslint-disable-line */

  const addCluster = (newClusters: ICluster[]) => {
    let updatedClusters = clusters ? clusters : {};

    for (let newCluster of newClusters) {
      let id = newCluster.id;
      const checkID = (id: string): boolean => {
        return (clusters && clusters.hasOwnProperty(id)) || id === '';
      };

      if (newCluster.authProvider === '') {
        while (checkID(id)) {
          id = randomString(32);
        }
      }

      newCluster.id = id;
      newCluster.url = newCluster.url.slice(-1) === '/' ? newCluster.url.slice(0, -1) : newCluster.url;
      newCluster.certificateAuthorityData = isBase64(newCluster.certificateAuthorityData) ? atob(newCluster.certificateAuthorityData) : newCluster.certificateAuthorityData;
      newCluster.clientCertificateData = isBase64(newCluster.clientCertificateData) ? atob(newCluster.clientCertificateData) : newCluster.clientCertificateData;
      newCluster.clientKeyData = isBase64(newCluster.clientKeyData) ? atob(newCluster.clientKeyData) : newCluster.clientKeyData;

      updatedClusters[newCluster.id] = newCluster;
    }

    setClusters({...updatedClusters});
    localStorage.setItem('clusters', JSON.stringify(updatedClusters));
  };

  const changeCluster = (id: string) => {
    if (clusters && clusters.hasOwnProperty(id)) {
      setCluster(id);
      localStorage.setItem('cluster', id);
    }
  };

  const deleteCluster = (id: string) => {
    if (clusters) {
      let filteredClusters = clusters;
      delete filteredClusters[id];

      if (Object.keys(filteredClusters).length === 0) {
        setClusters(undefined);
        localStorage.setItem('clusters', '');
      } else {
        setClusters({...filteredClusters});
        localStorage.setItem('clusters', JSON.stringify(filteredClusters));
      }

      if (cluster === id) {
        if (Object.keys(filteredClusters).length > 0) {
          setCluster(Object.keys(clusters)[0]);
          localStorage.setItem('cluster', Object.keys(clusters)[0]);
        } else {
          setCluster(undefined);
          localStorage.setItem('cluster', '');
        }
      }
    }
  };

  const editCluster = (editCluster: ICluster) => {
    editCluster.url = editCluster.url.slice(-1) === '/' ? editCluster.url.slice(0, -1) : editCluster.url;
    editCluster.certificateAuthorityData = isBase64(editCluster.certificateAuthorityData) ? atob(editCluster.certificateAuthorityData) : editCluster.certificateAuthorityData;
    editCluster.clientCertificateData = isBase64(editCluster.clientCertificateData) ? atob(editCluster.clientCertificateData) : editCluster.clientCertificateData;
    editCluster.clientKeyData = isBase64(editCluster.clientKeyData) ? atob(editCluster.clientKeyData) : editCluster.clientKeyData;

    if (clusters && cluster !== '') {
      let updatedClusters = clusters;
      updatedClusters[editCluster.id] = editCluster;
      setClusters({...updatedClusters});
      localStorage.setItem('clusters', JSON.stringify(updatedClusters));
    }
  };

  const setNamespace = (namespace: string) => {
    if (clusters && cluster) {
      let updatedClusters = clusters;
      updatedClusters[cluster].namespace = namespace;

      setClusters({...updatedClusters});
      localStorage.setItem('clusters', JSON.stringify(updatedClusters));
    }
  };

  const request = async(method: string, url: string, body: string, alternativeCluster?: ICluster) => {
    if ((clusters === undefined || cluster === undefined) && alternativeCluster === undefined) {
      throw new Error('Select an active cluster');
    }

    let plugin: any;

    if (isPlatform('hybrid')) {
      plugin = KubenavPlugin;
    } else {
      plugin = KubenavWebPlugin;
    }

    try {
      if (alternativeCluster && alternativeCluster.authProvider === 'google') {
        if (!(alternativeCluster.clientCertificateData !== '' && alternativeCluster.clientKeyData !== '')) {
          if (!(alternativeCluster.password !== '' && alternativeCluster.password !== '')) {
            alternativeCluster.token = await getAccessToken();
          }
        }
      }

      if (clusters && cluster && clusters[cluster].authProvider === 'google') {
        if (!(clusters[cluster].clientCertificateData !== '' && clusters[cluster].clientKeyData !== '')) {
          if (!(clusters[cluster].password !== '' && clusters[cluster].password !== '')) {
            clusters[cluster].token = await getAccessToken();
          }
        }
      }

      if (alternativeCluster && alternativeCluster.authProvider === 'aws') {
        const tokens: IAWSTokens = localStorage.getItem('aws') ? JSON.parse(localStorage.getItem('aws') as string) : {};
        const parts = alternativeCluster.id.split('_');

        if (parts.length < 3) {
          throw new Error('Invalid cluster id for authentication provider AWS.')
        }

        if (!tokens.hasOwnProperty(parts[1])) {
          throw new Error('Could not find credentials for cluster.')
        }

        alternativeCluster.token = await getAWSToken(tokens[parts[1]].accessKeyID, tokens[parts[1]].secretKey, parts[1], parts.slice(2, parts.length).join('_'));
      }

      if (clusters && cluster && clusters[cluster].authProvider === 'aws') {
        const tokens: IAWSTokens = localStorage.getItem('aws') ? JSON.parse(localStorage.getItem('aws') as string) : {};
        const parts = clusters[cluster].id.split('_');

        if (parts.length < 3) {
          throw new Error('Invalid cluster id for authentication provider AWS.')
        }

        if (!tokens.hasOwnProperty(parts[1])) {
          throw new Error('Could not find credentials for cluster.')
        }

        clusters[cluster].token = await getAWSToken(tokens[parts[1]].accessKeyID, tokens[parts[1]].secretKey, parts[1], parts.slice(2, parts.length).join('_'));
      }

      let data = await plugin.request({
        server: SERVER,
        cluster: alternativeCluster ? alternativeCluster.id : clusters && cluster && clusters[cluster].id ? clusters[cluster].id : '',
        method: method,
        url: alternativeCluster ? alternativeCluster.url + url : clusters && cluster && clusters[cluster].url ? clusters[cluster].url + url : '',
        body: body,
        certificateAuthorityData: alternativeCluster ? alternativeCluster.certificateAuthorityData : clusters && cluster && clusters[cluster].certificateAuthorityData ? clusters[cluster].certificateAuthorityData : '',
        clientCertificateData: alternativeCluster ? alternativeCluster.clientCertificateData : clusters && cluster && clusters[cluster].clientCertificateData ? clusters[cluster].clientCertificateData : '',
        clientKeyData: alternativeCluster ? alternativeCluster.clientKeyData : clusters && cluster && clusters[cluster].clientKeyData ? clusters[cluster].clientKeyData : '',
        token: alternativeCluster ? alternativeCluster.token : clusters && cluster && clusters[cluster].token ? clusters[cluster].token : '',
        username: alternativeCluster ? alternativeCluster.username : clusters && cluster && clusters[cluster].username ? clusters[cluster].username : '',
        password: alternativeCluster ? alternativeCluster.password : clusters && cluster && clusters[cluster].password ? clusters[cluster].password : '',
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

  return (
    <AppContext.Provider
      value={{
        clusters: clusters,
        cluster: cluster,

        addCluster: addCluster,
        changeCluster: changeCluster,
        deleteCluster: deleteCluster,
        editCluster: editCluster,
        setNamespace: setNamespace,
        request: request,
      }}
    >
      {loading ? <IonSpinner className="spinner-centered" /> : children}
    </AppContext.Provider>
  )
};
