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

import { IContext, IClusterAuthProviderOIDC } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { readTemporaryCredentials } from '../../../../utils/storage';

type IOIDCPageProps = RouteComponentProps;

const OIDCPage: React.FunctionComponent<IOIDCPageProps> = ({ history }: IOIDCPageProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [name, setName] = useState<string>('');
  const [url, setURL] = useState<string>('');
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>('');
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
    } else {
      try {
        const credentials = readTemporaryCredentials('oidc') as undefined | IClusterAuthProviderOIDC;

        if (credentials) {
          context.addCluster([
            {
              id: '',
              name: name,
              url: url,
              certificateAuthorityData: certificateAuthorityData,
              clientCertificateData: '',
              clientKeyData: '',
              token: '',
              username: '',
              password: '',
              insecureSkipTLSVerify: insecureSkipTLSVerify,
              authProvider: `oidc`,
              authProviderOIDC: credentials,
              namespace: 'default',
            },
          ]);

          setError('');
          history.push('/settings/clusters');
        } else {
          throw new Error('Could not read credentials for OIDC');
        }
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
        </IonList>

        {error !== '' ? (
          <IonAlert
            isOpen={error !== ''}
            onDidDismiss={() => setError('')}
            header="Could not add cluster"
            message={error}
            buttons={['OK']}
          />
        ) : null}
      </IonContent>
    </IonPage>
  );
};

export default memo(OIDCPage, (): boolean => {
  return true;
});
