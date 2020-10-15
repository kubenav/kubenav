import {
  IonAlert,
  IonBackButton,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonItem,
  IonLabel,
  IonList,
  IonPage,
  IonTextarea,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import yaml from 'js-yaml';
import React, { memo, useContext, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import {
  ICluster,
  IContext,
  IKubeconfig,
  IKubeconfigCluster,
  IKubeconfigClusterRef,
  IKubeconfigUser,
  IKubeconfigUserRef,
} from '../../../../declarations';
import { AppContext } from '../../../../utils/context';

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

type IKubeconfigPageProps = RouteComponentProps;

const KubeconfigPage: React.FunctionComponent<IKubeconfigPageProps> = ({ history }: IKubeconfigPageProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [kubeconfig, setKubeconfig] = useState<string>('');

  const handleKubeconfig = (event) => {
    setKubeconfig(event.target.value);
  };

  const handleKubeconfigFile = async (event) => {
    const files: FileList = event.target.files;

    if (files.length === 1) {
      const reader = new FileReader();
      reader.readAsText(files[0], 'UTF-8');
      reader.onload = (e) => {
        if (e.target && e.target.result) {
          setKubeconfig(e.target.result as string);
        }
      };
      reader.onerror = () => {
        setError(`Could not read ${files[0].name}`);
      };
    }
  };

  const addClusters = () => {
    if (kubeconfig === '') {
      setError('Kubeconfig is required');
    } else {
      try {
        const clusters: ICluster[] = [];
        const config: IKubeconfig = yaml.safeLoad(kubeconfig) as IKubeconfig;

        for (const ctx of config.contexts) {
          const cluster = getKubeconfigCluster(ctx.context.cluster, config.clusters);
          const user = getKubeconfigUser(ctx.context.user, config.users);

          if (ctx.name === '' || cluster === null || user === null || !cluster.server) {
            throw new Error('Invalid kubeconfig');
          }

          if (
            !user['client-certificate-data'] &&
            !user['client-key-data'] &&
            !user.token &&
            !user.username &&
            !user.password &&
            !user['auth-provider']
          ) {
            throw new Error('Invalid kubeconfig');
          }

          if (user['auth-provider'] && user['auth-provider'].name !== 'oidc') {
            throw new Error('Invalid kubeconfig');
          } else if (user['auth-provider'] && user['auth-provider'].name === 'oidc') {
            clusters.push({
              id: '',
              name: ctx.name,
              url: cluster.server,
              certificateAuthorityData: cluster['certificate-authority-data']
                ? cluster['certificate-authority-data']
                : '',
              clientCertificateData: '',
              clientKeyData: '',
              token: '',
              username: '',
              password: '',
              insecureSkipTLSVerify: cluster['insecure-skip-tls-verify'] ? cluster['insecure-skip-tls-verify'] : false,
              authProvider: 'kubeconfig',
              authProviderOIDC: {
                clientID: user['auth-provider'].config['client-id'] ? user['auth-provider'].config['client-id'] : '',
                clientSecret: user['auth-provider'].config['client-secret']
                  ? user['auth-provider'].config['client-secret']
                  : '',
                idToken: user['auth-provider'].config['id-token'] ? user['auth-provider'].config['id-token'] : '',
                idpIssuerURL: user['auth-provider'].config['idp-issuer-url']
                  ? user['auth-provider'].config['idp-issuer-url']
                  : '',
                refreshToken: user['auth-provider'].config['refresh-token']
                  ? user['auth-provider'].config['refresh-token']
                  : '',
                certificateAuthority: user['auth-provider'].config['idp-certificate-authority-data']
                  ? user['auth-provider'].config['idp-certificate-authority-data']
                  : '',
                accessToken: '',
                expiry: Math.floor(Date.now() / 1000),
              },
              namespace: 'default',
            });
          } else {
            clusters.push({
              id: '',
              name: ctx.name,
              url: cluster.server,
              certificateAuthorityData: cluster['certificate-authority-data']
                ? cluster['certificate-authority-data']
                : '',
              clientCertificateData: user['client-certificate-data'] ? user['client-certificate-data'] : '',
              clientKeyData: user['client-key-data'] ? user['client-key-data'] : '',
              token: user.token ? user.token : '',
              username: user.username ? user.username : '',
              password: user.password ? user.password : '',
              insecureSkipTLSVerify: cluster['insecure-skip-tls-verify'] ? cluster['insecure-skip-tls-verify'] : false,
              authProvider: 'kubeconfig',
              namespace: 'default',
            });
          }
        }

        context.addCluster(clusters);
        setError('');
        history.push('/settings/clusters');
      } catch (err) {
        setError(err.message);
      }
    }
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton defaultHref="/settings/clusters" />
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
        <IonList lines="full">
          <div className="select-kubeconfig-wrapper">
            <IonButton expand="block">
              <input id="file" hidden type="file" onChange={handleKubeconfigFile} />
              <label htmlFor="file" className="select-kubeconfig">
                Select Kubeconfig
              </label>
            </IonButton>
          </div>

          <IonItem>
            <IonLabel position="stacked">Kubeconfig</IonLabel>
            <IonTextarea autoGrow={true} value={kubeconfig} onInput={handleKubeconfig} />
          </IonItem>
        </IonList>

        {error !== '' ? (
          <IonAlert
            isOpen={error !== ''}
            onDidDismiss={() => setError('')}
            header="Could not save"
            message={error}
            buttons={['OK']}
          />
        ) : null}
      </IonContent>
    </IonPage>
  );
};

export default memo(KubeconfigPage, (): boolean => {
  return true;
});
