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
import yaml from 'js-yaml';
import React, { memo, useContext, useState } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { ICluster, IContext, IClusterAuthProviderDigitalOcean } from '../../../../declarations';
import { getDigitalOceanClusters, getDigitalOceanKubeconfig } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readTemporaryCredentials } from '../../../../utils/storage';
import ErrorCard from '../../../misc/ErrorCard';

const isChecked = (id: string, clusters: ICluster[]): boolean => {
  for (const cluster of clusters) {
    if (cluster.id === id) {
      return true;
    }
  }

  return false;
};

type IDigitalOceanPageProps = RouteComponentProps;

const DigitalOceanPage: React.FunctionComponent<IDigitalOceanPageProps> = ({ history }: IDigitalOceanPageProps) => {
  const context = useContext<IContext>(AppContext);

  const { isError, isFetching, data, error } = useQuery<ICluster[] | undefined, Error>(
    'DigitalOceanPage',
    async () => {
      try {
        const credentials = readTemporaryCredentials('digitalocean') as undefined | IClusterAuthProviderDigitalOcean;

        if (credentials) {
          const doClusters = await getDigitalOceanClusters(credentials.token);
          const tmpClusters: ICluster[] = [];

          for (let index = 0; index < doClusters.length; index++) {
            const kubeconfig = await getDigitalOceanKubeconfig(credentials.token, doClusters[index].id);
            const cluster = yaml.load(kubeconfig);
            if (cluster && typeof cluster === 'object') {
              tmpClusters.push({
                id: `do_${doClusters[index].id}`,
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                name: (cluster as any).clusters.length > 0 ? (cluster as any).clusters[0].name : '',
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                url: (cluster as any).clusters.length > 0 ? (cluster as any).clusters[0].cluster.server : '',
                certificateAuthorityData:
                  // eslint-disable-next-line @typescript-eslint/no-explicit-any
                  (cluster as any).clusters.length > 0
                    ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                      (cluster as any).clusters[0].cluster['certificate-authority-data']
                    : '',
                clientCertificateData:
                  // eslint-disable-next-line @typescript-eslint/no-explicit-any
                  (cluster as any).users.length > 0 &&
                  // eslint-disable-next-line @typescript-eslint/no-explicit-any
                  (cluster as any).users[0].user.hasOwnProperty('client-certificate-data')
                    ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                      (cluster as any).users[0].user['client-certificate-data']
                    : '',
                clientKeyData:
                  // eslint-disable-next-line @typescript-eslint/no-explicit-any
                  (cluster as any).users.length > 0 &&
                  // eslint-disable-next-line @typescript-eslint/no-explicit-any
                  (cluster as any).users[0].user.hasOwnProperty('client-key-data')
                    ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                      (cluster as any).users[0].user['client-key-data']
                    : '',
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                token:
                  // eslint-disable-next-line @typescript-eslint/no-explicit-any
                  (cluster as any).users.length > 0 &&
                  // eslint-disable-next-line @typescript-eslint/no-explicit-any
                  (cluster as any).users[0].user.hasOwnProperty('token')
                    ? // eslint-disable-next-line @typescript-eslint/no-explicit-any
                      (cluster as any).users[0].user['token']
                    : '',
                username: '',
                password: '',
                insecureSkipTLSVerify: false,
                authProvider: 'digitalocean',
                authProviderDigitalOcean: {
                  token: credentials.token,
                  clusterID: doClusters[index].id,
                },
                namespace: 'default',
              });
            } else {
              throw new Error('Could not parse Kubeconfig');
            }
          }

          return tmpClusters;
        } else {
          throw new Error('Could not read credentials for DigitalOcean');
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
            text="Could not load DigitalOcean clusters"
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

export default memo(DigitalOceanPage, (): boolean => {
  return true;
});
