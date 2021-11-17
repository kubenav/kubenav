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
  IKubeconfigCluster,
  IKubeconfigClusterRef,
  IKubeconfigUser,
  IKubeconfigUserRef,
  IClusterAuthProviderAzure,
} from '../../../../declarations';
import { getAzureClusters } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readTemporaryCredentials } from '../../../../utils/storage';
import ErrorCard from '../../../misc/ErrorCard';

const getKubeconfigCluster = (name: string, clusters: IKubeconfigClusterRef[]): IKubeconfigCluster | null => {
  for (const cluster of clusters) {
    if (cluster.name === name) {
      return cluster.cluster;
    }
  }

  return null;
};

const getKubeconfigUser = (name: string, users: IKubeconfigUserRef[]): IKubeconfigUser | null => {
  for (const user of users) {
    if (user.name === name) {
      return user.user;
    }
  }

  return null;
};

const isChecked = (id: string, clusters: ICluster[]): boolean => {
  for (const cluster of clusters) {
    if (cluster.id === id) {
      return true;
    }
  }

  return false;
};

type IAzurePageProps = RouteComponentProps;

const AzurePage: React.FunctionComponent<IAzurePageProps> = ({ history }: IAzurePageProps) => {
  const context = useContext<IContext>(AppContext);

  const { isError, isFetching, data, error } = useQuery<ICluster[] | undefined, Error>('AzurePage', async () => {
    try {
      const credentials = readTemporaryCredentials('azure') as undefined | IClusterAuthProviderAzure;

      if (credentials) {
        const aksClusters = await getAzureClusters(credentials);
        const tmpClusters: ICluster[] = [];

        // eslint-disable-next-line array-callback-return
        aksClusters.map((cluster) => {
          if (cluster.kubeconfig.contexts.length === 1) {
            const kubeconfigCluster = getKubeconfigCluster(
              cluster.kubeconfig.contexts[0].context.cluster,
              cluster.kubeconfig.clusters,
            );
            const kubeconfigUser = getKubeconfigUser(
              cluster.kubeconfig.contexts[0].context.user,
              cluster.kubeconfig.users,
            );

            tmpClusters.push({
              id: cluster.name,
              name: cluster.name,
              url: kubeconfigCluster ? kubeconfigCluster.server : '',
              certificateAuthorityData: kubeconfigCluster ? kubeconfigCluster['certificate-authority-data'] : '',
              clientCertificateData:
                kubeconfigUser && kubeconfigUser['client-certificate-data']
                  ? kubeconfigUser['client-certificate-data']
                  : '',
              clientKeyData:
                kubeconfigUser && kubeconfigUser['client-key-data'] ? kubeconfigUser['client-key-data'] : '',
              token: kubeconfigUser && kubeconfigUser.token ? kubeconfigUser.token : '',
              username: kubeconfigUser && kubeconfigUser.username ? kubeconfigUser.username : '',
              password: kubeconfigUser && kubeconfigUser.password ? kubeconfigUser.password : '',
              insecureSkipTLSVerify: false,
              authProvider: 'azure',
              authProviderAzure: credentials,
              namespace: 'default',
            });
          }
        });

        return tmpClusters;
      } else {
        throw new Error('Could not read credentials for Azure');
      }
    } catch (err) {
      throw err;
    }
  });

  const [selectedClusters, setSelectedClusters] = useState<ICluster[]>([]);

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
            error={error as Error}
            text="Could not load AKS clusters"
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

export default memo(AzurePage, (): boolean => {
  return true;
});
