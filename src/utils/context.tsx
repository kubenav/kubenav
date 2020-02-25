import { IonSpinner, isPlatform } from '@ionic/react';
import React, { useEffect, useState } from 'react';

import { ICluster, IClusters, IContext } from '../declarations';
import { getCluster as getClusterFromAPI, getClusters as getClustersFromAPI, kubernetesRequest } from './api';
import { isBase64, randomString } from './helpers';
import { getCluster, getClusters, removeCluster, removeClusters, setCluster as setClusterToStorage, setClusters as setClustersToStorage } from './storage';

const checkActiveCluster = (cluster: string, clusters: IClusters|undefined): boolean => {
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
          const clustersData = await getClustersFromAPI();
          setClusters(clustersData);

          if (getCluster() && checkActiveCluster(getCluster() as string, clustersData)) {
            setCluster(getCluster());
          } else {
            const clusterData = await getClusterFromAPI();
            setCluster(clusterData);
          }
        } else {
          setClusters(getClusters());
          setCluster(getCluster());
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
    setClustersToStorage(updatedClusters);
  };

  const changeCluster = (id: string) => {
    if (clusters && clusters.hasOwnProperty(id)) {
      setCluster(id);
      setClusterToStorage(id)
    }
  };

  const deleteCluster = (id: string) => {
    if (clusters) {
      let filteredClusters = clusters;
      delete filteredClusters[id];

      if (Object.keys(filteredClusters).length === 0) {
        setClusters(undefined);
        removeClusters();
      } else {
        setClusters({...filteredClusters});
        setClustersToStorage(filteredClusters);
      }

      if (cluster === id) {
        if (Object.keys(filteredClusters).length > 0) {
          setCluster(Object.keys(clusters)[0]);
          setClusterToStorage(Object.keys(clusters)[0]);
        } else {
          setCluster(undefined);
          removeCluster();
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
      setClustersToStorage(updatedClusters);
    }
  };

  const setNamespace = (namespace: string) => {
    if (clusters && cluster) {
      let updatedClusters = clusters;
      updatedClusters[cluster].namespace = namespace;

      setClusters({...updatedClusters});
      setClustersToStorage(updatedClusters);
    }
  };

  const request = async(method: string, url: string, body: string, alternativeCluster?: ICluster) => {
    if ((clusters === undefined || cluster === undefined) && alternativeCluster === undefined) {
      throw new Error('Select an active cluster');
    }

    try {
      if (alternativeCluster) {
        return await kubernetesRequest(method, url, body, alternativeCluster);
      } else {
        return await kubernetesRequest(method, url, body, clusters![cluster!]);
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
