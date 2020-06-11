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

import { ICluster, IContext } from '../../../../declarations';
import { getAWSClusters } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readAWSTokens } from '../../../../utils/storage';
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

interface IMatchParams {
  region: string;
}

type IAWSPageProps = RouteComponentProps<IMatchParams>;

const AWSPage: React.FunctionComponent<IAWSPageProps> = ({ match, history }: IAWSPageProps) => {
  const context = useContext<IContext>(AppContext);

  const [state, , fetchInit] = useAsyncFn(
    async () => {
      try {
        if (match.params.region) {
          const tokens = readAWSTokens();

          if (!tokens.hasOwnProperty(match.params.region)) {
            throw new Error('Could not find AWS credentials.');
          }

          const awsClusters = await getAWSClusters(
            tokens[match.params.region].accessKeyID,
            tokens[match.params.region].secretKey,
            match.params.region,
          );

          const tmpClusters: ICluster[] = [];

          // eslint-disable-next-line
          awsClusters.map((cluster) => {
            tmpClusters.push({
              id: `aws_${match.params.region}_${cluster.Name}`,
              name: `aws_${match.params.region}_${cluster.Name}`,
              url: `${cluster.Endpoint}`,
              certificateAuthorityData: cluster.CertificateAuthority.Data,
              clientCertificateData: '',
              clientKeyData: '',
              token: '',
              username: '',
              password: '',
              insecureSkipTLSVerify: false,
              authProvider: 'aws',
              namespace: 'default',
            });
          });

          return tmpClusters;
        }
      } catch (err) {
        throw err;
      }
    },
    [match.params.region],
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
            text="Could not load AWS clusters"
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

export default memo(AWSPage, (): boolean => {
  return true;
});
