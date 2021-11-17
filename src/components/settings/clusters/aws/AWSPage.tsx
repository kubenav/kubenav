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

import { ICluster, IContext, IClusterAuthProviderAWS } from '../../../../declarations';
import { getAWSClusters } from '../../../../utils/api';
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

type IAWSPageProps = RouteComponentProps;

const AWSPage: React.FunctionComponent<IAWSPageProps> = ({ history }: IAWSPageProps) => {
  const context = useContext<IContext>(AppContext);

  const { isError, isFetching, data, error } = useQuery<ICluster[] | undefined, Error>('AWSPage', async () => {
    try {
      const credentials = readTemporaryCredentials('aws') as undefined | IClusterAuthProviderAWS;

      if (credentials) {
        const awsClusters = await getAWSClusters(credentials);
        const tmpClusters: ICluster[] = [];

        // eslint-disable-next-line
          awsClusters.map((cluster) => {
          tmpClusters.push({
            id: `aws_${credentials.region}_${cluster.Name}`,
            name: `aws_${credentials.region}_${cluster.Name}`,
            url: `${cluster.Endpoint}`,
            certificateAuthorityData: cluster.CertificateAuthority.Data,
            clientCertificateData: '',
            clientKeyData: '',
            token: '',
            username: '',
            password: '',
            insecureSkipTLSVerify: false,
            authProvider: 'aws',
            authProviderAWS: {
              accessKeyID: credentials.accessKeyID,
              clusterID: cluster.Name,
              region: credentials.region,
              secretKey: credentials.secretKey,
              sessionToken: credentials.sessionToken,
            },
            namespace: 'default',
          });
        });

        return tmpClusters;
      } else {
        throw new Error('Could not read credentials for AWS');
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
            text="Could not load AWS clusters"
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

export default memo(AWSPage, (): boolean => {
  return true;
});
