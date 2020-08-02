import {
  IonButton,
  IonButtons,
  IonCheckbox,
  IonContent,
  IonHeader,
  IonItem,
  IonLabel,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { ICluster, IContext, IClusterAuthProviderGoogle } from '../../../../declarations';
import { getGoogleClusters, getGoogleProjects, getGoogleTokens } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readTemporaryCredentials } from '../../../../utils/storage';
import useAsyncFn from '../../../../utils/useAsyncFn';
import ErrorCard from '../../../misc/ErrorCard';

const isChecked = (id: string, clusters: ICluster[]): boolean => {
  for (const cluster of clusters) {
    if (cluster.id === id) {
      return true;
    }
  }

  return false;
};

type IGooglePageProps = RouteComponentProps;

const GooglePage: React.FunctionComponent<IGooglePageProps> = ({ location, history }: IGooglePageProps) => {
  const context = useContext<IContext>(AppContext);

  const [state, , fetchInit] = useAsyncFn(
    async () => {
      try {
        const params = JSON.parse('{"' + location.search.substr(1).replace(/&/g, '", "').replace(/=/g, '": "') + '"}');

        if (params.error) {
          throw new Error(params.error);
        }

        if (params.code) {
          let credentials = readTemporaryCredentials('google') as undefined | IClusterAuthProviderGoogle;

          if (credentials && credentials.clientID) {
            credentials = await getGoogleTokens(credentials.clientID, params.code);
            const projects = await getGoogleProjects(credentials.accessToken);

            for (const project of projects) {
              const projectClusters = await getGoogleClusters(credentials.accessToken, project.projectId);

              const tmpClusters: ICluster[] = [];

              if (projectClusters) {
                // eslint-disable-next-line
              projectClusters.map((cluster) => {
                  tmpClusters.push({
                    id: `gke_${project.projectId}_${cluster.location}_${cluster.name}`,
                    name: `gke_${project.projectId}_${cluster.location}_${cluster.name}`,
                    url: `https://${cluster.endpoint}`,
                    certificateAuthorityData: cluster.masterAuth.clusterCaCertificate,
                    clientCertificateData: cluster.masterAuth.clientCertificate
                      ? cluster.masterAuth.clientCertificate
                      : '',
                    clientKeyData: cluster.masterAuth.clientKey ? cluster.masterAuth.clientKey : '',
                    token: '',
                    username: cluster.masterAuth.username ? cluster.masterAuth.username : '',
                    password: cluster.masterAuth.password ? cluster.masterAuth.password : '',
                    insecureSkipTLSVerify: false,
                    authProvider: 'google',
                    authProviderGoogle: credentials,
                    namespace: 'default',
                  });
                });

                return tmpClusters;
              }
            }
          } else {
            throw new Error('Could not read credentials for Google');
          }
        }
      } catch (err) {
        throw err;
      }
    },
    [],
    { loading: true, error: undefined, value: undefined },
  );

  const [selectedClusters, setSelectedClusters] = useState<ICluster[]>([]);

  useEffect(() => {
    fetchInit();
  }, [fetchInit]);

  const toggleSelectedCluster = (checked: boolean, cluster: ICluster) => {
    if (checked) {
      setSelectedClusters([...selectedClusters, cluster]);
    } else {
      setSelectedClusters(selectedClusters.filter((c) => c.id !== cluster.id));
    }
  };

  const addClusters = () => {
    context.addCluster(selectedClusters);
    history.push('/settings/clusters');
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Add Clusters</IonTitle>
          {state.error ? null : (
            <IonButtons slot="primary">
              <IonButton onClick={() => addClusters()}>Add</IonButton>
            </IonButtons>
          )}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {state.loading ? (
          <IonProgressBar slot="fixed" type="indeterminate" color="primary" />
        ) : state.error || !state.value ? (
          <ErrorCard
            error={state.error}
            text="Could not load GKE clusters"
            icon="/assets/icons/kubernetes/kubernetes.png"
          />
        ) : (
          state.value.map((cluster, index) => {
            return (
              <IonItem key={index}>
                <IonCheckbox
                  slot="start"
                  checked={isChecked(cluster.id, selectedClusters)}
                  onIonChange={(e) => toggleSelectedCluster(e.detail.checked, cluster)}
                />
                <IonLabel>{cluster.name}</IonLabel>
              </IonItem>
            );
          })
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(GooglePage, (): boolean => {
  return true;
});
