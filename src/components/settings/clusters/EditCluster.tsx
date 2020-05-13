import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonInput,
  IonItem,
  IonItemOption,
  IonLabel,
  IonList,
  IonModal,
  IonTextarea,
  IonTitle,
  IonToggle,
  IonToolbar,
} from '@ionic/react';
import { close, create } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { ICluster, IContext } from '../../../declarations';
import { AppContext } from '../../../utils/context';

interface IEditClusterProps {
  cluster: ICluster;
}

const EditCluster: React.FunctionComponent<IEditClusterProps> = ({ cluster }) => {
  const context = useContext<IContext>(AppContext);

  const [showModal, setShowModal] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [name, setName] = useState<string>(cluster.name);
  const [url, setURL] = useState<string>(cluster.url);
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>(cluster.certificateAuthorityData);
  const [clientCertificateData, setClientCertificateData] = useState<string>(cluster.clientCertificateData);
  const [clientKeyData, setClientKeyData] = useState<string>(cluster.clientKeyData);
  const [token, setToken] = useState<string>(cluster.token);
  const [username, setUsername] = useState<string>(cluster.username);
  const [password, setPassword] = useState<string>(cluster.password);
  const [insecureSkipTLSVerify, setInsecureSkipTLSVerify] = useState<boolean>(cluster.insecureSkipTLSVerify);

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

  const editCluster = () => {
    if (name === '') {
      setError('Name is required');
    } else if (url === '') {
      setError('URL is required');
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
      context.editCluster({
        id: cluster.id,
        name: name,
        url: url,
        certificateAuthorityData: certificateAuthorityData,
        clientCertificateData: clientCertificateData,
        clientKeyData: clientKeyData,
        token: token,
        username: username,
        password: password,
        insecureSkipTLSVerify: insecureSkipTLSVerify,
        authProvider: cluster.authProvider,
        namespace: cluster.namespace,
      });

      setError('');
      setShowModal(false);
    }
  };

  return (
    <React.Fragment>
      {error !== '' ? (
        <IonAlert
          isOpen={error !== ''}
          onDidDismiss={() => setError('')}
          header="Could not save"
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonItemOption color="primary" onClick={() => setShowModal(true)}>
        <IonIcon slot="start" icon={create} />
        Edit
      </IonItemOption>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShowModal(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>Edit Cluster</IonTitle>
            <IonButtons slot="primary">
              <IonButton onClick={() => editCluster()}>Save</IonButton>
            </IonButtons>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <IonList lines="full">
            <IonItem>
              <IonLabel position="stacked">Name</IonLabel>
              <IonInput type="text" required={true} value={name} onInput={handleName} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">URL</IonLabel>
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
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default EditCluster;
