import {
  IonAlert,
  IonBackButton,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonPage,
  IonTextarea,
  IonTitle,
  IonToggle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';

type IManualPageProps = RouteComponentProps;

const ManualPage: React.FunctionComponent<IManualPageProps> = ({ history }: IManualPageProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [name, setName] = useState<string>('');
  const [url, setURL] = useState<string>('');
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>('');
  const [clientCertificateData, setClientCertificateData] = useState<string>('');
  const [clientKeyData, setClientKeyData] = useState<string>('');
  const [token, setToken] = useState<string>('');
  const [username, setUsername] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const [insecureSkipTLSVerify, setInsecureSkipTLSVerify] = useState<boolean>(false);

  const handleName = (event) => {
    setName(event.target.value);
  };

  const handleURL = (event) => {
    setURL(event.target.value);
  };

  const handleCertificateAuthorityData = (event) => {
    setCertificateAuthorityData(event.target.value);
  };

  const handleClientCertificateData = (event) => {
    setClientCertificateData(event.target.value);
  };

  const handleClientKeyData = (event) => {
    setClientKeyData(event.target.value);
  };

  const handleToken = (event) => {
    setToken(event.target.value);
  };

  const handleUsername = (event) => {
    setUsername(event.target.value);
  };

  const handlePassword = (event) => {
    setPassword(event.target.value);
  };

  const handleInsecureSkipTLSVerify = (event) => {
    setInsecureSkipTLSVerify(event.detail.checked);
  };

  const addClusters = () => {
    if (name === '') {
      setError('Name is required');
    } else if (url === '') {
      setError('Server is required');
    } else if (!url.startsWith('https://')) {
      setError('Invalid URL');
    } else if (
      clientCertificateData === '' &&
      clientKeyData === '' &&
      token === '' &&
      username === '' &&
      password === ''
    ) {
      setError('Client Certificate Data and Client Key Data or Token or Username and Password is required');
    } else {
      try {
        context.addCluster([
          {
            id: '',
            name: name,
            url: url,
            certificateAuthorityData: certificateAuthorityData,
            clientCertificateData: clientCertificateData,
            clientKeyData: clientKeyData,
            token: token,
            username: username,
            password: password,
            insecureSkipTLSVerify: insecureSkipTLSVerify,
            authProvider: 'kubeconfig',
            namespace: 'default',
          },
        ]);

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
          <IonItem>
            <IonLabel position="stacked">Name</IonLabel>
            <IonInput type="text" required={true} value={name} onInput={handleName} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Server</IonLabel>
            <IonInput type="text" inputmode="url" required={true} value={url} onInput={handleURL} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Certificate Authority Data</IonLabel>
            <IonTextarea autoGrow={true} value={certificateAuthorityData} onInput={handleCertificateAuthorityData} />
          </IonItem>
          <IonItem>
            <IonLabel>Insecure Skip TLS Verify</IonLabel>
            <IonToggle checked={insecureSkipTLSVerify} onIonChange={handleInsecureSkipTLSVerify} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Client Certificate Data</IonLabel>
            <IonTextarea autoGrow={true} value={clientCertificateData} onInput={handleClientCertificateData} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Client Key Data</IonLabel>
            <IonTextarea autoGrow={true} value={clientKeyData} onInput={handleClientKeyData} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Token</IonLabel>
            <IonTextarea autoGrow={true} value={token} onInput={handleToken} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Username</IonLabel>
            <IonInput type="text" value={username} onInput={handleUsername} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Password</IonLabel>
            <IonInput type="password" value={password} onInput={handlePassword} />
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

export default memo(ManualPage, (): boolean => {
  return true;
});
