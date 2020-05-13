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
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { ICluster, IContext } from '../../../../declarations';
import { getGoogleClusters, getGoogleProjects, getGoogleTokens } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { saveGoogleTokens } from '../../../../utils/storage';
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

  const [error, setError] = useState<string>('');
  const [clusters, setClusters] = useState<ICluster[]>([]);
  const [selectedClusters, setSelectedClusters] = useState<ICluster[]>([]);
  const [showLoading, setShowLoading] = useState<boolean>(false);

  useEffect(() => {
    (async () => {
      setShowLoading(true);

      try {
        const params = JSON.parse('{"' + location.search.substr(1).replace(/&/g, '", "').replace(/=/g, '": "') + '"}');

        if (params.error) {
          throw new Error(params.error);
        }

        if (params.code) {
          const tokens = await getGoogleTokens(params.code);
          saveGoogleTokens(tokens);
          const projects = await getGoogleProjects(tokens.access_token);

          for (const project of projects) {
            const projectClusters = await getGoogleClusters(tokens.access_token, project.projectId);

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
                  namespace: 'default',
                });
              });

              setClusters(tmpClusters);
            }
          }
        }
      } catch (err) {
        setError(err.message);
      }

      setShowLoading(false);
    })();

    return () => {};
  }, [location]); /* eslint-disable-line */

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
          {error ? null : (
            <IonButtons slot="primary">
              <IonButton onClick={() => addClusters()}>Add</IonButton>
            </IonButtons>
          )}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {showLoading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}

        {error ? (
          <ErrorCard error={error} text="Could not load GKE clusters" icon="/assets/icons/kubernetes/kubernetes.png" />
        ) : (
          clusters.map((cluster, index) => {
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

export default GooglePage;
