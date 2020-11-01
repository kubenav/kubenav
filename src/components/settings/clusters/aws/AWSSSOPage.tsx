import { Plugins } from '@capacitor/core';
import {
  IonButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCheckbox,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonMenuButton,
  IonPage,
  IonSelect,
  IonSelectOption,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import React, { memo, useContext, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IAWSSSO, ICluster, IContext } from '../../../../declarations';
import { getAWSClusters, getAWSSSOConfig, getAWSSSOCredentailsWithConfig } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

const { App } = Plugins;

const isChecked = (id: string, clusters: ICluster[]): boolean => {
  for (const cluster of clusters) {
    if (cluster.id === id) {
      return true;
    }
  }

  return false;
};

type IAWSSSOPageProps = RouteComponentProps;

const AWSSSOPage: React.FunctionComponent<IAWSSSOPageProps> = ({ history }: IAWSSSOPageProps) => {
  const context = useContext<IContext>(AppContext);

  const [startURL, setStartURL] = useState<string>('');
  const [region, setRegion] = useState<string>('');
  const [ssoRegion, setSSORegion] = useState<string>('');
  const [accountID, setAccountID] = useState<string>('');
  const [roleName, setRoleName] = useState<string>('');
  const [config, setConfig] = useState<IAWSSSO | undefined>(undefined);
  const [error, setError] = useState<string>('');
  const [clusters, setClusters] = useState<ICluster[]>([]);
  const [selectedClusters, setSelectedClusters] = useState<ICluster[]>([]);

  const handleStartURL = (event) => {
    setStartURL(event.target.value);
  };

  const handleAccountID = (event) => {
    setAccountID(event.target.value);
  };

  const handleRoleName = (event) => {
    setRoleName(event.target.value);
  };

  const handleSSORegion = (event) => {
    setSSORegion(event.target.value);
  };

  const handleRegion = (event) => {
    setRegion(event.target.value);
  };

  const startSSOFlow = async () => {
    try {
      const ssoConfig = await getAWSSSOConfig(startURL, ssoRegion);
      setConfig(ssoConfig);
    } catch (err) {
      setError(err.message);
    }
  };

  const openURL = async (url: string) => {
    if (isPlatform('hybrid')) {
      await App.openUrl({ url: url });
    } else {
      window.open(url, '_system', 'location=yes');
    }
  };

  const createToken = async (ssoConfig: IAWSSSO) => {
    try {
      const credentials = await getAWSSSOCredentailsWithConfig(
        ssoConfig,
        startURL,
        ssoRegion,
        accountID,
        roleName,
        region,
      );

      const awsClusters = await getAWSClusters({
        accessKeyID: credentials.accessKeyId,
        clusterID: '',
        region: credentials.region,
        secretKey: credentials.secretAccessKey,
        sessionToken: credentials.sessionToken,
      });
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
          authProvider: 'awssso',
          authProviderAWSSSO: { ...credentials, clusterID: cluster.Name },
          namespace: 'default',
        });
      });

      setClusters(tmpClusters);
    } catch (err) {
      setError(err.message);
    }
  };

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
          <IonTitle>AWS SSO</IonTitle>
          {clusters && clusters.length > 0 ? (
            <IonButtons slot="primary">
              <IonButton onClick={() => addClusters()}>Add</IonButton>
            </IonButtons>
          ) : null}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {clusters && clusters.length > 0 ? (
          <IonList>
            {clusters.map((cluster, index) => {
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
            })}
          </IonList>
        ) : config ? (
          <IonCard>
            <IonCardContent>
              <p className="paragraph-margin-bottom">
                You have to finialize the device authentication by clicking the <b>Verify</b> button.
              </p>
              <p className="paragraph-margin-bottom">
                When you have finished the device authentication you have to click the <b>Create Token</b> button to
                retrieve a new token to interact with the AWS API.
              </p>

              {error ? <p className="paragraph-margin-bottom">{error}</p> : null}

              <IonButton expand="block" onClick={() => openURL(config.device.VerificationUriComplete)}>
                Verify
              </IonButton>
              <IonButton expand="block" onClick={() => createToken(config)}>
                Get Clusters
              </IonButton>
            </IonCardContent>
          </IonCard>
        ) : (
          <IonCard>
            <IonCardContent>
              <IonList className="paragraph-margin-bottom" lines="full">
                <IonItem>
                  <IonLabel position="stacked">Start URL</IonLabel>
                  <IonInput type="text" required={true} value={startURL} onInput={handleStartURL} />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Account ID</IonLabel>
                  <IonInput type="text" required={true} value={accountID} onInput={handleAccountID} />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Role Name</IonLabel>
                  <IonInput type="text" required={true} value={roleName} onInput={handleRoleName} />
                </IonItem>
                <IonItem>
                  <IonLabel>SSO Region</IonLabel>
                  <IonSelect value={ssoRegion} onIonChange={handleSSORegion}>
                    <IonSelectOption value="us-east-2">USA Ost (Ohio)</IonSelectOption>
                    <IonSelectOption value="us-east-1">USA Ost (Nord-Virginia)</IonSelectOption>
                    <IonSelectOption value="us-west-1">USA West (Nordkalifornien)</IonSelectOption>
                    <IonSelectOption value="us-west-2">USA West (Oregon)</IonSelectOption>
                    <IonSelectOption value="ap-east-1">Asien-Pazifik (Hongkong)</IonSelectOption>
                    <IonSelectOption value="ap-south-1">Asien-Pazifik (Mumbai)</IonSelectOption>
                    <IonSelectOption value="ap-northeast-3">Asien-Pazifik (Osaka-Lokal)</IonSelectOption>
                    <IonSelectOption value="ap-northeast-2">Asien-Pazifik (Seoul)</IonSelectOption>
                    <IonSelectOption value="ap-southeast-1">Asien-Pazifik (Singapur)</IonSelectOption>
                    <IonSelectOption value="ap-southeast-2">Asien-Pazifik (Sydney)</IonSelectOption>
                    <IonSelectOption value="ap-northeast-1">Asien-Pazifik (Tokio)</IonSelectOption>
                    <IonSelectOption value="ca-central-1">Kanada (Zentral)</IonSelectOption>
                    <IonSelectOption value="cn-north-1">China (Peking)</IonSelectOption>
                    <IonSelectOption value="cn-northwest-1">China (Ningxia)</IonSelectOption>
                    <IonSelectOption value="eu-central-1">EU (Frankfurt)</IonSelectOption>
                    <IonSelectOption value="eu-west-1">EU (Irland)</IonSelectOption>
                    <IonSelectOption value="eu-west-2">EU (London)</IonSelectOption>
                    <IonSelectOption value="eu-west-3">EU (Paris)</IonSelectOption>
                    <IonSelectOption value="eu-north-1">EU (Stockholm)</IonSelectOption>
                    <IonSelectOption value="me-south-1">Naher Osten (Bahrain)</IonSelectOption>
                    <IonSelectOption value="sa-east-1">Südamerika (São Paulo)</IonSelectOption>
                    <IonSelectOption value="us-gov-east-1">AWS GovCloud (USA Ost)</IonSelectOption>
                    <IonSelectOption value="us-gov-west-1">AWS GovCloud (USA)</IonSelectOption>
                  </IonSelect>
                </IonItem>
                <IonItem>
                  <IonLabel>Region</IonLabel>
                  <IonSelect value={region} onIonChange={handleRegion}>
                    <IonSelectOption value="us-east-2">USA Ost (Ohio)</IonSelectOption>
                    <IonSelectOption value="us-east-1">USA Ost (Nord-Virginia)</IonSelectOption>
                    <IonSelectOption value="us-west-1">USA West (Nordkalifornien)</IonSelectOption>
                    <IonSelectOption value="us-west-2">USA West (Oregon)</IonSelectOption>
                    <IonSelectOption value="ap-east-1">Asien-Pazifik (Hongkong)</IonSelectOption>
                    <IonSelectOption value="ap-south-1">Asien-Pazifik (Mumbai)</IonSelectOption>
                    <IonSelectOption value="ap-northeast-3">Asien-Pazifik (Osaka-Lokal)</IonSelectOption>
                    <IonSelectOption value="ap-northeast-2">Asien-Pazifik (Seoul)</IonSelectOption>
                    <IonSelectOption value="ap-southeast-1">Asien-Pazifik (Singapur)</IonSelectOption>
                    <IonSelectOption value="ap-southeast-2">Asien-Pazifik (Sydney)</IonSelectOption>
                    <IonSelectOption value="ap-northeast-1">Asien-Pazifik (Tokio)</IonSelectOption>
                    <IonSelectOption value="ca-central-1">Kanada (Zentral)</IonSelectOption>
                    <IonSelectOption value="cn-north-1">China (Peking)</IonSelectOption>
                    <IonSelectOption value="cn-northwest-1">China (Ningxia)</IonSelectOption>
                    <IonSelectOption value="eu-central-1">EU (Frankfurt)</IonSelectOption>
                    <IonSelectOption value="eu-west-1">EU (Irland)</IonSelectOption>
                    <IonSelectOption value="eu-west-2">EU (London)</IonSelectOption>
                    <IonSelectOption value="eu-west-3">EU (Paris)</IonSelectOption>
                    <IonSelectOption value="eu-north-1">EU (Stockholm)</IonSelectOption>
                    <IonSelectOption value="me-south-1">Naher Osten (Bahrain)</IonSelectOption>
                    <IonSelectOption value="sa-east-1">Südamerika (São Paulo)</IonSelectOption>
                    <IonSelectOption value="us-gov-east-1">AWS GovCloud (USA Ost)</IonSelectOption>
                    <IonSelectOption value="us-gov-west-1">AWS GovCloud (USA)</IonSelectOption>
                  </IonSelect>
                </IonItem>
              </IonList>

              {error ? <p className="paragraph-margin-bottom">{error}</p> : null}

              <IonButton expand="block" onClick={() => startSSOFlow()}>
                Sign In
              </IonButton>
            </IonCardContent>
          </IonCard>
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(AWSSSOPage, (): boolean => {
  return true;
});
