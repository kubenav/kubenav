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
import React, { memo, useContext, useState } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import {
  ICluster,
  IContext,
  IClusterAuthProviderRancher,
  IRancherGeneratedKubeconfig,
  IClusters,
} from '../../../../declarations';
import { getRancherClusters, getRancherKubeconfig } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readTemporaryCredentials } from '../../../../utils/storage';
import ErrorCard from '../../../misc/ErrorCard';
import { getClustersFromKubeconfig } from '../kubeconfig/KubeconfigPage';

const isChecked = (id: string, clusters: ICluster[]): boolean => {
  for (const cluster of clusters) {
    if (cluster.id === id) {
      return true;
    }
  }
  return false;
};

type IRancherPageProps = RouteComponentProps;

const RancherPage: React.FunctionComponent<IRancherPageProps> = ({ history }: IRancherPageProps) => {
  const context = useContext<IContext>(AppContext);

  const { isError, isFetching, data, error } = useQuery<ICluster[] | undefined, Error>(
    `RancherPage`,
    async () => {
      try {
        const credentials = readTemporaryCredentials('rancher') as undefined | IClusterAuthProviderRancher;

        if (
          credentials &&
          credentials.rancherHost &&
          credentials.rancherPort &&
          ((credentials.username && credentials.password) || credentials.bearerToken)
        ) {
          const rancherClusters = await getRancherClusters(
            credentials.rancherHost,
            credentials.rancherPort,
            credentials.username,
            credentials.password,
            credentials.secure,
            credentials.bearerToken,
          );

          const tmpClusters: ICluster[] = [];

          rancherClusters.data.forEach((cluster) => {
            // Because later the cluster is generated from the fetched full kubeconfig, just a dummy object is needed to show available clusters in app
            tmpClusters.push({
              id: cluster.id,
              name: cluster.name,
              url: '',
              certificateAuthorityData: '',
              clientCertificateData: '',
              clientKeyData: '',
              token: '',
              username: '',
              password: '',
              insecureSkipTLSVerify: false,
              authProvider: 'rancher',
              namespace: '',
            });
          });

          return tmpClusters;
        }
      } catch (err) {
        throw err;
      }
    },
    context.settings.queryConfig,
  );

  const [selectedClusters, setSelectedClusters] = useState<ICluster[]>([]);

  const toggleSelectedCluster = (checked: boolean, cluster: ICluster) => {
    if (checked) {
      setSelectedClusters([...selectedClusters, cluster]);
    } else {
      setSelectedClusters(selectedClusters.filter((c) => c.id !== cluster.id));
    }
  };

  const addClusterViaKubeconfig = (kubeconfig: string) => {
    try {
      context.addCluster(getClustersFromKubeconfig(kubeconfig));
    } catch (err) {
      throw err;
    }
  };

  const getExistingClusterNames = () => {
    return context.clusters ? Object.values(context.clusters as IClusters).map((cluster) => cluster.name) : [];
  };

  const addClusters = () => {
    selectedClusters.forEach(async (cluster) => {
      if (getExistingClusterNames().includes(cluster.name)) {
        // Do not add existing cluster
        return;
      }

      const credentials = readTemporaryCredentials('rancher') as undefined | IClusterAuthProviderRancher;

      if (credentials) {
        const kubeconfig: IRancherGeneratedKubeconfig = await getRancherKubeconfig(
          credentials.rancherHost,
          credentials.rancherPort,
          credentials.username,
          credentials.password,
          credentials.secure,
          credentials.bearerToken,
          cluster.id,
        );

        addClusterViaKubeconfig(kubeconfig.config);
      }
    });

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
          {isError ? null : (
            <IonButtons slot="primary">
              <IonButton onClick={() => addClusters()}>Add</IonButton>
            </IonButtons>
          )}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? (
          <IonProgressBar slot="fixed" type="indeterminate" color="primary" />
        ) : isError || !data ? (
          <ErrorCard
            error={error}
            text="Could not load Rancher clusters"
            icon="/assets/icons/kubernetes/kubernetes.png"
          />
        ) : (
          data.map((cluster, index) => {
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

export default memo(RancherPage, (): boolean => {
  return true;
});
