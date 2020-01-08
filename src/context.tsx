import { Plugins } from '@capacitor/core';
import { isPlatform } from '@ionic/react';
import { KubenavPlugin as KubenavWebPlugin } from '@kubenav/kubenav-plugin';
import React, { useState } from 'react';

import { ICluster, IClusters, IContext } from './declarations';
import { isBase64, isJSON, randomString } from './utils';

const { KubenavPlugin } = Plugins;
const SERVER = process.env.NODE_ENV === 'production' ? '' : 'http://localhost:14122';

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
  const [clusters, setClusters] = useState<IClusters>(() => localStorage.getItem('clusters') === null ? {} : JSON.parse(localStorage.getItem('clusters') as string) as ICluster[]);
  const [cluster, setCluster] = useState<string>(() => localStorage.getItem('cluster') !== null && localStorage.getItem('cluster') !== '' ? localStorage.getItem('cluster') as string : Object.keys(clusters).length > 0 ? Object.keys(clusters)[0] : '');

  const addCluster = (newCluster: ICluster) => {
    let id = '';
    const checkID = (id: string): boolean => {
      return clusters.hasOwnProperty(id) || id === '';
    };

    while (checkID(id)) {
      id = randomString(32);
    }

    newCluster.id = id;
    newCluster.url = newCluster.url.slice(-1) === '/' ? newCluster.url.slice(0, -1) : newCluster.url;
    newCluster.certificateAuthorityData = isBase64(newCluster.certificateAuthorityData) ? atob(newCluster.certificateAuthorityData) : newCluster.certificateAuthorityData;
    newCluster.clientCertificateData = isBase64(newCluster.clientCertificateData) ? atob(newCluster.clientCertificateData) : newCluster.clientCertificateData;
    newCluster.clientKeyData = isBase64(newCluster.clientKeyData) ? atob(newCluster.clientKeyData) : newCluster.clientKeyData;

    let updatedClusters = clusters;
    updatedClusters[newCluster.id] = newCluster;

    setClusters({...updatedClusters});
    localStorage.setItem('clusters', JSON.stringify(updatedClusters));
  };

  const changeCluster = (id: string) => {
    if (clusters.hasOwnProperty(id)) {
      setCluster(id);
      localStorage.setItem('cluster', id);
    }
  };

  const deleteCluster = (id: string) => {
    let filteredClusters = clusters;
    delete filteredClusters[id];
    setClusters({...filteredClusters});
    localStorage.setItem('clusters', JSON.stringify(filteredClusters));

    if (cluster === id) {
      if (Object.keys(filteredClusters).length > 0) {
        setCluster(Object.keys(clusters)[0]);
        localStorage.setItem('cluster', Object.keys(clusters)[0]);
      } else {
        setCluster('');
        localStorage.setItem('cluster', '');
      }
    }
  };

  const editCluster = (editCluster: ICluster) => {
    editCluster.url = editCluster.url.slice(-1) === '/' ? editCluster.url.slice(0, -1) : editCluster.url;
    editCluster.certificateAuthorityData = isBase64(editCluster.certificateAuthorityData) ? atob(editCluster.certificateAuthorityData) : editCluster.certificateAuthorityData;
    editCluster.clientCertificateData = isBase64(editCluster.clientCertificateData) ? atob(editCluster.clientCertificateData) : editCluster.clientCertificateData;
    editCluster.clientKeyData = isBase64(editCluster.clientKeyData) ? atob(editCluster.clientKeyData) : editCluster.clientKeyData;

    if (cluster !== '') {
      let updatedClusters = clusters;
      updatedClusters[editCluster.id] = editCluster;
      setClusters({...updatedClusters});
      localStorage.setItem('clusters', JSON.stringify(updatedClusters));
    }
  };

  const setNamespace = (namespace: string) => {
    let updatedClusters = clusters;
    updatedClusters[cluster].namespace = namespace;

    setClusters({...updatedClusters});
    localStorage.setItem('clusters', JSON.stringify(updatedClusters));
  };

  const request = async(method: string, url: string, body: string) => {
    if (cluster === '') {
      throw new Error('Select an active cluster');
    }

    let plugin: any;

    if (isPlatform('hybrid')) {
      plugin = KubenavPlugin;
    } else {
      plugin = KubenavWebPlugin;
    }

    try {
      let data = await plugin.request({
        server: SERVER,
        method: method,
        url: clusters[cluster].url + url,
        body: body,
        certificateAuthorityData: clusters[cluster].certificateAuthorityData,
        clientCertificateData: clusters[cluster].clientCertificateData,
        clientKeyData: clusters[cluster].clientKeyData,
        token: clusters[cluster].token,
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
