import { SplashScreen } from '@capacitor/splash-screen';
import { IonButton, IonCol, IonContent, IonGrid, IonPage, IonRow, isPlatform } from '@ionic/react';
import React, { useEffect, useState, ReactElement } from 'react';
import { useQuery } from 'react-query';

import { IAppSettings, IBookmark, ICluster, IClusters, IContext } from '../declarations';
import {
  getCluster,
  getClusters,
  getOIDCAccessToken,
  getInclusterSettings,
  syncKubeconfig,
  getAWSSSOCredentails,
  getAWSToken,
  getGoogleAccessToken,
} from './api';
import { DEFAULT_SETTINGS, IS_INCLUSTER } from './constants';
import { isBase64, isDarkMode, randomString } from './helpers';
import {
  readBookmarks,
  readCluster,
  readClusters,
  readSettings,
  removeCluster,
  removeClusters,
  saveBookmarks,
  saveCluster,
  saveClusters,
  saveSettings,
} from './storage';
import useWindowHeight from './useWindowHeight';

// Creates a Context object. When React renders a component that subscribes to this Context object it will read the
// current context value from the closest matching Provider above it in the tree.
export const AppContext = React.createContext<IContext>({
  clusters: undefined,
  cluster: undefined,
  settings: DEFAULT_SETTINGS,
  bookmarks: [],

  // eslint-disable-next-line @typescript-eslint/no-empty-function
  addCluster: () => {},
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  changeCluster: () => {},
  currentCluster: () => {
    return undefined;
  },
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  deleteCluster: () => {},
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  editBookmarks: () => {},
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  editCluster: () => {},
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  editSettings: () => {},
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  setNamespace: () => {},
  kubernetesAuthWrapper: () => {
    // eslint-disable-next-line @typescript-eslint/no-empty-function
    return new Promise(() => {});
  },
});

// A React component that subscribes to context changes. This lets you subscribe to a context within a function
// component.
export const AppContextConsumer = AppContext.Consumer;

interface IAppContextProvider {
  children: ReactElement;
}

// Every Context object comes with a Provider React component that allows consuming components to subscribe to context
// changes.
export const AppContextProvider: React.FunctionComponent<IAppContextProvider> = ({ children }: IAppContextProvider) => {
  const [settings, setSettings] = useState<IAppSettings>(readSettings());
  const [bookmarks, setBookmarks] = useState<IBookmark[]>(readBookmarks());
  const [cluster, setCluster] = useState<string | undefined>(undefined);
  const [clusters, setClusters] = useState<IClusters | undefined>(undefined);

  // When the component is rendered we are initializing the cluster and clusters variables.
  // For the desktop and incluster version we are calling the internal API endpoint to retrieve a list of clusters from
  // the loaded Kubeconfig or incluster configuration. The mobile version of kubenav loads all clusters from
  // localStorage.
  // For the incluster version of kubenav we are also loading all settings which were configured via command-line flags.
  // This allows us to use the cluster address for plugins instead if port forwarding.
  const { isFetching } = useQuery('context', async () => {
    try {
      // Apply the initial dark mode setting, how it was saved in the localStorage.
      document.body.classList.toggle('dark', isDarkMode(settings.theme));

      if (!isPlatform('hybrid')) {
        if (IS_INCLUSTER) {
          const inclusterSettings = await getInclusterSettings();

          if (inclusterSettings) {
            setSettings({
              ...settings,
              prometheusEnabled: inclusterSettings.prometheus.enabled,
              prometheusAddress: inclusterSettings.prometheus.address,
              prometheusDashboardsNamespace: inclusterSettings.prometheus.dashboardsNamespace,
              elasticsearchEnabled: inclusterSettings.elasticsearch.enabled,
              elasticsearchAddress: inclusterSettings.elasticsearch.address,
              jaegerEnabled: inclusterSettings.jaeger.enabled,
              jaegerAddress: inclusterSettings.jaeger.address,
            });
          }
        }

        const receivedClusters = await getClusters();
        const activeCluster = await getCluster();

        // When kubenav is running with the incluster mode, we are using the users last viewed namespaces as initial
        // namespace.
        if (IS_INCLUSTER && receivedClusters) {
          const tmpClusters = readClusters();

          if (tmpClusters) {
            Object.keys(receivedClusters).forEach((key) => {
              if (tmpClusters.hasOwnProperty(key)) {
                receivedClusters[key].namespace = tmpClusters[key].namespace;
              }
            });
          }
        }

        setClusters(receivedClusters);
        setCluster(activeCluster);
      } else {
        setClusters(readClusters());
        setCluster(readCluster());
      }

      await SplashScreen.hide();

      return true;
    } catch (err) {
      throw err;
    }
  });

  // Listen for changes of the system theme by checking if the document matches the media query using matchMedia(). We
  // only change the theme when the user uses "system" for the theme determination.
  // NOTE: Currently we can not use the "addEventListener" or "removeEventListener" functions
  // (https://stackoverflow.com/a/56466334/4104109), because they are not supported on Safari and iOS.
  useEffect(() => {
    const toggleDarkMode = (mediaQuery: MediaQueryListEvent) => {
      if (settings.theme === 'system') {
        document.body.classList.toggle('dark', mediaQuery.matches);
      }
    };

    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)');
    prefersDark.addListener(toggleDarkMode);
    return () => {
      prefersDark.removeListener(toggleDarkMode);
    };
  }, [settings]);

  // addCluster is used to add new clusters. We are using an array of clusters instead of a cluster object to add
  // multiple clusters with one call. If we want to add multiple clusters and call this function multiple times, there
  // where some problems that not all clusters where added.
  // If we aren't using an authentication provider like Google or Amazon, we generating a random id for the cluster.
  // It's also checked if the user provided the certificates and keys as raw data or in a base64 encoded format. The
  // base64 encoded certificates are converted to the raw certificates.
  const addCluster = (newClusters: ICluster[]) => {
    const updatedClusters = clusters ? clusters : {};

    for (const newCluster of newClusters) {
      let id = newCluster.id;
      const checkID = (id: string): boolean => {
        return (clusters && clusters.hasOwnProperty(id)) || id === '';
      };

      if (newCluster.authProvider === 'kubeconfig' || newCluster.authProvider === 'oidc') {
        while (checkID(id)) {
          id = randomString(32);
        }
      }

      newCluster.id = id;
      newCluster.url =
        newCluster.url.trim().slice(-1) === '/' ? newCluster.url.trim().slice(0, -1) : newCluster.url.trim();
      newCluster.certificateAuthorityData = isBase64(newCluster.certificateAuthorityData)
        ? atob(newCluster.certificateAuthorityData)
        : newCluster.certificateAuthorityData;
      newCluster.clientCertificateData = isBase64(newCluster.clientCertificateData)
        ? atob(newCluster.clientCertificateData)
        : newCluster.clientCertificateData;
      newCluster.clientKeyData = isBase64(newCluster.clientKeyData)
        ? atob(newCluster.clientKeyData)
        : newCluster.clientKeyData;

      updatedClusters[newCluster.id] = newCluster;
    }

    setClusters({ ...updatedClusters });
    saveClusters(updatedClusters);
  };

  // changeCluster changes the currently active cluster to the new cluster with the provided id.
  const changeCluster = async (id: string) => {
    if (clusters && clusters.hasOwnProperty(id)) {
      setCluster(id);
      saveCluster(id);

      if (!isPlatform('hybrid')) {
        await syncKubeconfig(id, '', 'context');
      }
    }
  };

  // currentCluster returns the currently active cluster or if no cluster is selected, the function returns undefined.
  const currentCluster = (): ICluster | undefined => {
    return clusters && cluster && clusters.hasOwnProperty(cluster) ? clusters[cluster] : undefined;
  };

  // deleteCluster deletes the cluster with the given id. When the active cluster is deleted, we are changing the active
  // cluster to the first one in the object of clusters.
  const deleteCluster = (id: string) => {
    if (clusters) {
      const filteredClusters = clusters;
      delete filteredClusters[id];

      if (Object.keys(filteredClusters).length === 0) {
        setClusters(undefined);
        removeClusters();
      } else {
        setClusters({ ...filteredClusters });
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

  // editBookmarks sets the bookmarks to the bookmarks context and saves all bookmarks to localStorage.
  const editBookmarks = (editBookmarks: IBookmark[]) => {
    setBookmarks(editBookmarks);
    saveBookmarks(editBookmarks);
  };

  // editCluster replaces a cluster with the new provided cluster.
  // Like in the addCluster function we are validating the provided URL and the provided certificate data. If the user
  // provides a base64 encoded certificate, it will be decoded before it is saved.
  const editCluster = (editCluster: ICluster) => {
    editCluster.url =
      editCluster.url.trim().slice(-1) === '/' ? editCluster.url.trim().slice(0, -1) : editCluster.url.trim();
    editCluster.certificateAuthorityData = isBase64(editCluster.certificateAuthorityData)
      ? atob(editCluster.certificateAuthorityData)
      : editCluster.certificateAuthorityData;
    editCluster.clientCertificateData = isBase64(editCluster.clientCertificateData)
      ? atob(editCluster.clientCertificateData)
      : editCluster.clientCertificateData;
    editCluster.clientKeyData = isBase64(editCluster.clientKeyData)
      ? atob(editCluster.clientKeyData)
      : editCluster.clientKeyData;

    if (clusters && cluster !== '') {
      const updatedClusters = clusters;
      updatedClusters[editCluster.id] = editCluster;
      setClusters({ ...updatedClusters });
      saveClusters(updatedClusters);
    }
  };

  // editSettings changes the users settings to the ones provided. We are also saving these settings to the localStorage
  // via the storage api.
  const editSettings = (settings: IAppSettings) => {
    // Always apply the theme variable.
    document.body.classList.toggle('dark', isDarkMode(settings.theme));

    setSettings(settings);
    saveSettings(settings);
  };

  // setNamespace sets the provided namespace for the currently active cluster.
  const setNamespace = async (namespace: string) => {
    if (clusters && cluster) {
      const updatedClusters = clusters;
      updatedClusters[cluster].namespace = namespace;

      setClusters({ ...updatedClusters });
      saveClusters(updatedClusters);

      if (!isPlatform('hybrid')) {
        await syncKubeconfig(updatedClusters[cluster].id, namespace, 'namespace');
      }
    }
  };

  const kubernetesAuthWrapper = async (clusterID: string): Promise<ICluster> => {
    if (!clusters || !cluster) {
      throw new Error('Could not found Cluster');
    }

    if (clusterID === '') {
      const c = currentCluster();
      if (c) {
        clusterID = c.id;
      } else {
        throw new Error('Could not found Cluster');
      }
    }

    try {
      if (clusters[clusterID].authProvider === 'aws') {
        const credentials = clusters[clusterID].authProviderAWS;
        if (credentials) {
          const token = await getAWSToken(credentials);
          clusters[clusterID].token = token;
        } else {
          throw new Error('AWS credentials are missing');
        }
      } else if (clusters[clusterID].authProvider === 'awssso') {
        let credentials = clusters[clusterID].authProviderAWSSSO;
        if (credentials) {
          credentials = await getAWSSSOCredentails(credentials);
          clusters[clusterID].authProviderAWSSSO = credentials;

          const token = await getAWSToken({
            accessKeyID: credentials.accessKeyId,
            clusterID: credentials.clusterID,
            region: credentials.region,
            secretKey: credentials.secretAccessKey,
            sessionToken: credentials.sessionToken,
          });

          clusters[clusterID].token = token;
        } else {
          throw new Error('AWS credentials are missing');
        }
      } else if (clusters[clusterID].authProvider === 'google') {
        let credentials = clusters[clusterID].authProviderGoogle;
        if (credentials) {
          credentials = await getGoogleAccessToken(credentials);
          clusters[clusterID].token = credentials.accessToken;
          clusters[clusterID].authProviderGoogle = credentials;
        } else {
          throw new Error('AWS credentials are missing');
        }
      } else if (clusters[clusterID].authProvider === 'oidc') {
        let credentials = clusters[clusterID].authProviderOIDC;
        if (credentials) {
          credentials = await getOIDCAccessToken(credentials);
          clusters[clusterID].authProviderOIDC = credentials;
          clusters[clusterID].token = credentials.idToken;
        } else {
          throw new Error('OIDC credentials are missing');
        }
      }

      saveClusters(clusters);
      return clusters[clusterID];
    } catch (err) {
      throw err;
    }
  };

  // Render the context provider and pass in all required states and functions. While we are retrieving the cluster and
  // clusters we are only showing a spinner icon.
  return (
    <AppContext.Provider
      value={{
        clusters: clusters,
        cluster: cluster,
        settings: settings,
        bookmarks: bookmarks,

        addCluster: addCluster,
        changeCluster: changeCluster,
        currentCluster: currentCluster,
        deleteCluster: deleteCluster,
        editBookmarks: editBookmarks,
        editCluster: editCluster,
        editSettings: editSettings,
        setNamespace: setNamespace,
        kubernetesAuthWrapper: kubernetesAuthWrapper,
      }}
    >
      {isFetching ? null : <AuthenticationWrapper settings={settings}>{children}</AuthenticationWrapper>}
    </AppContext.Provider>
  );
};

interface IAuthenticationWrapperProps {
  settings: IAppSettings;
  children: ReactElement;
}

export const AuthenticationWrapper: React.FunctionComponent<IAuthenticationWrapperProps> = ({
  settings,
  children,
}: IAuthenticationWrapperProps) => {
  const height = useWindowHeight();
  const [isAuthenticated, setIsAuthenticated] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  useEffect(() => {
    if (settings.authenticationEnabled && isPlatform('hybrid') && !isAuthenticated) {
      signIn();
    }
  }, [isAuthenticated, settings.authenticationEnabled]);

  const signIn = async () => {
    try {
      setIsAuthenticated(true);
    } catch (err) {
      setError(`Authentication failed: ${err.message}`);
    }
  };

  if (settings.authenticationEnabled && isPlatform('hybrid') && !isAuthenticated) {
    return (
      <IonPage>
        <IonContent color="primary">
          <IonGrid>
            <IonRow className="ion-justify-content-center">
              <IonCol className="auth-col auth-padding-top">
                {height > 512 ? <img className="auth-img" alt="kubenav" src="/assets/icons/icon.png" /> : null}
              </IonCol>
            </IonRow>
            <IonRow className="ion-justify-content-center">
              <IonCol className="auth-col">
                <p>{error}</p>
              </IonCol>
            </IonRow>
            <IonRow className="ion-justify-content-center">
              <IonCol className="auth-col">
                <IonButton className="auth-unlock-button" onClick={signIn} fill="outline" expand="block" color="white">
                  Unlock
                </IonButton>
              </IonCol>
            </IonRow>
          </IonGrid>
        </IonContent>
      </IonPage>
    );
  } else {
    return children;
  }
};
