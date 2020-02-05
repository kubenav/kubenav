import { Plugins } from '@capacitor/core';
import { isPlatform } from '@ionic/react';
import { KubenavPlugin as KubenavWebPlugin } from '@kubenav/kubenav-plugin';
import React, { useState } from 'react';

import { SERVER } from './constants';
import { ICluster, IClusters, IContext, IGoogleTokens } from './declarations';
import { getGoogleAccessToken, isBase64, isJSON, randomString, saveGoogleTokens } from './utils';

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
  const [clusters, setClusters] = useState<IClusters|undefined>(() => localStorage.getItem('clusters') !== null && localStorage.getItem('clusters') !== '' ? JSON.parse(localStorage.getItem('clusters') as string) as IClusters : undefined);
  const [cluster, setCluster] = useState<string|undefined>(() => localStorage.getItem('cluster') !== null && localStorage.getItem('cluster') !== '' ? localStorage.getItem('cluster') as string : clusters && Object.keys(clusters).length > 0 ? Object.keys(clusters)[0] : undefined);

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

      let data = await plugin.request({
        server: SERVER,
        method: method,
        url: alternativeCluster ? alternativeCluster.url : clusters && cluster && clusters[cluster].url ? clusters[cluster].url + url : '',
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
      {children}
    </AppContext.Provider>
  )
};
