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
  IonToolbar
} from '@ionic/react';
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import ErrorCard from '../components/misc/ErrorCard';
import { ICluster, IContext } from '../declarations';
import { getAWSClusters } from '../utils/api';
import { AppContext } from '../utils/context';
import { readAWSTokens } from '../utils/storage';

const isChecked = (id: string, clusters: ICluster[]): boolean => {
  for (let cluster of clusters) {
    if (cluster.id === id) {
      return true;
    }
  }

  return false;
};

interface IMatchParams {
  region: string;
}

interface IClustersAWSProps extends RouteComponentProps<IMatchParams> {}

const ClustersAWS: React.FunctionComponent<IClustersAWSProps> = ({ match, history }) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [clusters, setClusters] = useState<ICluster[]>([]);
  const [selectedClusters, setSelectedClusters] = useState<ICluster[]>([]);
  const [showLoading, setShowLoading] = useState<boolean>(false);

  useEffect(() => {
    (async() => {
      setShowLoading(true);

      try {
        if (match.params.region) {
          const tokens = readAWSTokens();

          if (!tokens.hasOwnProperty(match.params.region)) {
            throw new Error('Could not find AWS credentials.')
          }

          const awsClusters = await getAWSClusters(
            tokens[match.params.region].accessKeyID,
            tokens[match.params.region].secretKey,
            match.params.region
          );

          // eslint-disable-next-line
          awsClusters.map((cluster) => {
            setClusters([...clusters, {
              id: `aws_${match.params.region}_${cluster.Name}`,
              name: `aws_${match.params.region}_${cluster.Name}`,
              url: `${cluster.Endpoint}`,
              certificateAuthorityData: cluster.CertificateAuthority.Data,
              clientCertificateData: '',
              clientKeyData: '',
              token: '',
              username: '',
              password: '',
              authProvider: 'aws',
              namespace: 'default',
            }]);
          });
        }
      } catch (err) {
        setError(err.message);
      }

      setShowLoading(false);
    })();

    return () => {};
  }, [match]); /* eslint-disable-line */

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
              <IonButton onClick={() => addClusters()}>
                Add
              </IonButton>
            </IonButtons>
          )}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {showLoading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}

        {error ? <ErrorCard error={error} text="Could not load AWS clusters" icon="/assets/icons/kubernetes/kubernetes.png" /> : (
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
            )
          })
        )}
      </IonContent>
    </IonPage>
  );
};

export default ClustersAWS;
