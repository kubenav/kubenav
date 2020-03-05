import { Plugins } from '@capacitor/core';
import { isPlatform } from '@ionic/react';
import React, { useEffect, useState } from 'react';

import { ICluster, IClusters, IContext } from '../declarations';
import { getCluster, getClusters, kubernetesRequest } from './api';
import { isBase64, randomString } from './helpers';
import { readCluster, readClusters, removeCluster, removeClusters, saveCluster, saveClusters } from './storage';

const { SplashScreen } = Plugins;

// Creates a Context object. When React renders a component that subscribes to this Context object it will read the
// current context value from the closest matching Provider above it in the tree.
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

// A React component that subscribes to context changes. This lets you subscribe to a context within a function
// component.
export const AppContextConsumer = AppContext.Consumer;

// Every Context object comes with a Provider React component that allows consuming components to subscribe to context
// changes.
export const AppContextProvider: React.FunctionComponent = ({ children }) => {
  const [loading, setLoading] = useState<boolean>(true);
  const [cluster, setCluster] = useState<string|undefined>(undefined);
  const [clusters, setClusters] = useState<IClusters|undefined>(undefined);

  // When the component is rendered we are initializing the cluster and clusters variables.
  // For the desktop version we are calling the internal API endpoint to retrieve a list of clusters from the Kubeconfig
  // file. For the electron version we are saving the current context in the localStorage, but for development we are
  // making an API request to retrieve the current context during startup.
  // For the mobile version we only use the localStorage which holds all cluster information.
  useEffect(() => {
    (async() => {
      if (loading) {
        if (!isPlatform('hybrid')) {
          const receivedClusters = await getClusters();
          setClusters(receivedClusters);

          let activeCluster = readCluster();
          if (!activeCluster) {
            activeCluster = await getCluster();
          }

          setCluster(activeCluster);
        } else {
          setClusters(readClusters());
          setCluster(readCluster());
        }
      }

      setLoading(false);
    })();

    return () => {};
  }, [loading]); /* eslint-disable-line */

  // addCluster is used to add new clusters. We are using an array of clusters instead of a cluster object to add
  // multiple clusters with one call. If we want to add multiple clusters and call this function multiple times, there
  // where some problems that not all clusters where added.
  // If we aren't using an authentication provider like Google or Amazon, we generating a random id for the cluster.
  // It's also checked if the user provided the certificates and keys as raw data or in a base64 encoded format. The
  // base64 encoded certificates are converted to the raw certificates.
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
      newCluster.certificateAuthorityData = isBase64(newCluster.certificateAuthorityData)
        ? atob(newCluster.certificateAuthorityData) : newCluster.certificateAuthorityData;
      newCluster.clientCertificateData = isBase64(newCluster.clientCertificateData)
        ? atob(newCluster.clientCertificateData) : newCluster.clientCertificateData;
      newCluster.clientKeyData = isBase64(newCluster.clientKeyData)
        ? atob(newCluster.clientKeyData) : newCluster.clientKeyData;

      updatedClusters[newCluster.id] = newCluster;
    }

    setClusters({...updatedClusters});
    saveClusters(updatedClusters);
  };

  // changeCluster changes the currently active cluster to the new cluster with the provided id.
  const changeCluster = (id: string) => {
    if (clusters && clusters.hasOwnProperty(id)) {
      setCluster(id);
      saveCluster(id)
    }
  };

  // deleteCluster deletes the cluster with the given id. When the active cluster is deleted, we are changing the active
  // cluster to the first one in the object of clusters.
  const deleteCluster = (id: string) => {
    if (clusters) {
      let filteredClusters = clusters;
      delete filteredClusters[id];

      if (Object.keys(filteredClusters).length === 0) {
        setClusters(undefined);
        removeClusters();
      } else {
        setClusters({...filteredClusters});
        saveClusters(filteredClusters);
      }

      if (cluster === id) {
        if (Object.keys(filteredClusters).length > 0) {
          setCluster(Object.keys(clusters)[0]);
          saveCluster(Object.keys(clusters)[0]);
        } else {
          setCluster(undefined);
          removeCluster();
        }
      }
    }
  };

  // editCluster replaces a cluster with the new provided cluster.
  // Like in the addCluster function we are validating the provided URL and the provided certificate data. If the user
  // provides a base64 encoded certificate, it will be decoded before it is saved.
  const editCluster = (editCluster: ICluster) => {
    editCluster.url = editCluster.url.slice(-1) === '/' ? editCluster.url.slice(0, -1) : editCluster.url;
    editCluster.certificateAuthorityData = isBase64(editCluster.certificateAuthorityData)
      ? atob(editCluster.certificateAuthorityData) : editCluster.certificateAuthorityData;
    editCluster.clientCertificateData = isBase64(editCluster.clientCertificateData)
      ? atob(editCluster.clientCertificateData) : editCluster.clientCertificateData;
    editCluster.clientKeyData = isBase64(editCluster.clientKeyData)
      ? atob(editCluster.clientKeyData) : editCluster.clientKeyData;

    if (clusters && cluster !== '') {
      let updatedClusters = clusters;
      updatedClusters[editCluster.id] = editCluster;
      setClusters({...updatedClusters});
      saveClusters(updatedClusters);
    }
  };

  // setNamespace sets the provided namespace for the currently active cluster.
  const setNamespace = (namespace: string) => {
    if (clusters && cluster) {
      let updatedClusters = clusters;
      updatedClusters[cluster].namespace = namespace;

      setClusters({...updatedClusters});
      saveClusters(updatedClusters);
    }
  };

  // request is used to make requests against the Kubernetes API server for the currently active cluster. If an
  // alternative cluster is provided the requests is done against the API server of this cluster instead the active
  // cluster.
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

  // Render the context provider and pass in all required states and functions. While we are retrieving the cluster and
  // clusters we are only showing a spinner icon.
  // Note: The spinner icon should be replaced with the splash screen in the future.
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
      {loading ? null : children}
    </AppContext.Provider>
  )
};
