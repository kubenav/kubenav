import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonInput,
  IonItem,
  IonItemDivider,
  IonItemGroup,
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

import {
  ICluster,
  IClusterAuthProviderAWS,
  IClusterAuthProviderAzure,
  IClusterAuthProviderGoogle,
  IClusterAuthProviderOIDC,
  IContext,
  TAuthProvider,
} from '../../../declarations';
import { getOIDCLink } from '../../../utils/api';
import {
  GOOGLE_OAUTH2_ENDPOINT,
  GOOGLE_REDIRECT_URI,
  GOOGLE_RESPONSE_TYPE,
  GOOGLE_SCOPE,
} from '../../../utils/constants';
import { AppContext } from '../../../utils/context';
import { saveTemporaryCredentials } from '../../../utils/storage';

interface IEditClusterProps {
  cluster: ICluster;
}

const EditCluster: React.FunctionComponent<IEditClusterProps> = ({ cluster }: IEditClusterProps) => {
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
  const [namespace, setNamespace] = useState<string>(cluster.namespace);
  const [authProvider] = useState<TAuthProvider>(cluster.authProvider);
  const [authProviderAWS, setAuthProviderAWS] = useState<IClusterAuthProviderAWS | undefined>(cluster.authProviderAWS);
  const [authProviderAzure, setAuthProviderAzure] = useState<IClusterAuthProviderAzure | undefined>(
    cluster.authProviderAzure,
  );
  const [authProviderGoogle, setAuthProviderGoogle] = useState<IClusterAuthProviderGoogle | undefined>(
    cluster.authProviderGoogle,
  );
  const [authProviderOIDC, setAuthProviderOIDC] = useState<IClusterAuthProviderOIDC | undefined>(
    cluster.authProviderOIDC,
  );

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

  const handleNamespace = (event) => {
    setNamespace(event.target.value);
  };

  const handleAuthProviderAWS = (event) => {
    setAuthProviderAWS((prevState) =>
      prevState
        ? {
            ...prevState,
            [event.target.name]: event.target.value,
          }
        : undefined,
    );
  };

  const handleAuthProviderAzure = (event) => {
    setAuthProviderAzure((prevState) =>
      prevState
        ? {
            ...prevState,
            [event.target.name]: event.target.value,
          }
        : undefined,
    );
  };

  const handleAuthProviderGoogle = (event) => {
    setAuthProviderGoogle((prevState) =>
      prevState
        ? {
            ...prevState,
            [event.target.name]: event.target.value,
          }
        : undefined,
    );
  };

  const handleAuthProviderOIDC = (event) => {
    setAuthProviderOIDC((prevState) =>
      prevState
        ? {
            ...prevState,
            [event.target.name]: event.target.value,
          }
        : undefined,
    );
  };

  const reAuthenticateOIDC = async () => {
    if (authProviderOIDC) {
      saveTemporaryCredentials({
        clientID: authProviderOIDC.clientID,
        clientSecret: authProviderOIDC.clientSecret,
        idpIssuerURL: authProviderOIDC.idpIssuerURL,
        refreshToken: authProviderOIDC.refreshToken,
        certificateAuthority: authProviderOIDC.certificateAuthority,
        idToken: '',
        accessToken: '',
        expiry: 0,
        clusterID: cluster.id,
      });

      const url = await getOIDCLink(
        authProviderOIDC.idpIssuerURL,
        authProviderOIDC.clientID,
        authProviderOIDC.clientSecret,
        authProviderOIDC.certificateAuthority,
      );
      window.location.replace(url);
    }
  };

  const reAuthenticateGoogle = async () => {
    if (authProviderGoogle) {
      saveTemporaryCredentials({
        accessToken: '',
        clientID: authProviderGoogle.clientID,
        expires: 0,
        idToken: '',
        refreshToken: '',
        tokenType: '',
        clusterID: cluster.id,
      });

      window.location.replace(
        `${GOOGLE_OAUTH2_ENDPOINT}?client_id=${authProviderGoogle.clientID}&redirect_uri=${GOOGLE_REDIRECT_URI}&response_type=${GOOGLE_RESPONSE_TYPE}&scope=${GOOGLE_SCOPE}`,
      );
    }
  };

  const editCluster = () => {
    if (name === '') {
      setError('Name is required');
    } else if (url === '') {
      setError('URL is required');
    } else if (!url.startsWith('https://')) {
      setError('Invalid URL');
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
        authProviderAWS: authProviderAWS,
        authProviderAzure: authProviderAzure,
        authProviderGoogle: authProviderGoogle,
        authProviderOIDC: authProviderOIDC,
        namespace: namespace,
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
            <IonItemGroup>
              <IonItemDivider>
                <IonLabel>Cluster</IonLabel>
              </IonItemDivider>
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
                <IonTextarea
                  autoGrow={true}
                  value={certificateAuthorityData}
                  onInput={handleCertificateAuthorityData}
                />
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
              <IonItem>
                <IonLabel position="stacked">Namespace</IonLabel>
                <IonInput type="text" value={namespace} onInput={handleNamespace} />
              </IonItem>
            </IonItemGroup>
            {authProvider === 'aws' && authProviderAWS ? (
              <IonItemGroup>
                <IonItemDivider>
                  <IonLabel>AWS</IonLabel>
                </IonItemDivider>
                <IonItem>
                  <IonLabel position="stacked">Access Key ID</IonLabel>
                  <IonInput
                    type="text"
                    value={authProviderAWS.accessKeyID}
                    name="accessKeyID"
                    onInput={handleAuthProviderAWS}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Secret Key</IonLabel>
                  <IonInput
                    type="text"
                    value={authProviderAWS.secretKey}
                    name="secretKey"
                    onInput={handleAuthProviderAWS}
                  />
                </IonItem>
              </IonItemGroup>
            ) : null}
            {authProvider === 'azure' && authProviderAzure ? (
              <IonItemGroup>
                <IonItemDivider>
                  <IonLabel>Azure</IonLabel>
                </IonItemDivider>
                <IonItem>
                  <IonLabel position="stacked">Subscription ID</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderAzure.subscriptionID}
                    name="subscriptionID"
                    onInput={handleAuthProviderAzure}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Client ID</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderAzure.clientID}
                    name="clientID"
                    onInput={handleAuthProviderAzure}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Client Secret</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderAzure.clientSecret}
                    name="clientSecret"
                    onInput={handleAuthProviderAzure}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Tenant ID</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderAzure.tenantID}
                    name="tenantID"
                    onInput={handleAuthProviderAzure}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Resource Group Name</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderAzure.resourceGroupName}
                    name="resourceGroupName"
                    onInput={handleAuthProviderAzure}
                  />
                </IonItem>
              </IonItemGroup>
            ) : null}
            {authProvider === 'google' && authProviderGoogle ? (
              <IonItemGroup>
                <IonItemDivider>
                  <IonLabel>Google</IonLabel>
                </IonItemDivider>
                <IonItem>
                  <IonLabel position="stacked">Client ID</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderGoogle.clientID}
                    name="clientID"
                    onInput={handleAuthProviderGoogle}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Refresh Token</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderGoogle.refreshToken}
                    name="refreshToken"
                    onInput={handleAuthProviderGoogle}
                  />
                </IonItem>
                <IonButton expand="block" onClick={() => reAuthenticateGoogle()}>
                  Re-Authenticate
                </IonButton>
              </IonItemGroup>
            ) : null}
            {authProvider === 'oidc' && authProviderOIDC ? (
              <IonItemGroup>
                <IonItemDivider>
                  <IonLabel>OIDC</IonLabel>
                </IonItemDivider>
                <IonItem>
                  <IonLabel position="stacked">Discovery URL</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderOIDC.idpIssuerURL}
                    name="idpIssuerURL"
                    onInput={handleAuthProviderOIDC}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Client ID</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderOIDC.clientID}
                    name="clientID"
                    onInput={handleAuthProviderOIDC}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Client Secret</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    value={authProviderOIDC.clientSecret}
                    name="clientSecret"
                    onInput={handleAuthProviderOIDC}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Certificate Authority (optional)</IonLabel>
                  <IonTextarea
                    autoGrow={true}
                    value={authProviderOIDC.certificateAuthority}
                    name="certificateAuthority"
                    onInput={handleAuthProviderOIDC}
                  />
                </IonItem>
                <IonItem>
                  <IonLabel position="stacked">Refresh Token (optional)</IonLabel>
                  <IonTextarea autoGrow={true} value={authProviderOIDC.refreshToken} onInput={handleAuthProviderOIDC} />
                </IonItem>

                <IonButton expand="block" onClick={() => reAuthenticateOIDC()}>
                  Re-Authenticate
                </IonButton>
              </IonItemGroup>
            ) : null}
          </IonList>
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default EditCluster;
