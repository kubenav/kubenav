import {
  IonAlert,
  IonBackButton,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader, IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonPage, IonSelect, IonSelectOption,
  IonTextarea,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import React, { useContext, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';

interface IOIDCPageProps extends RouteComponentProps {}

const OIDCPage: React.FunctionComponent<IOIDCPageProps> = ({ history }) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [name, setName] = useState<string>('');
  const [url, setURL] = useState<string>('');
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>('');
  const [provider, setProvider] = useState<string>('');

  const handleName = (event) => {
    setName(event.target.value);
  };

  const handleURL = (event) => {
    setURL(event.target.value);
  };

  const handleCertificateAuthorityData = (event) => {
    setCertificateAuthorityData(event.target.value);
  };

  const handleProvider = (event) => {
    setProvider(event.target.value);
  };

  const addClusters = () => {
    if (name === '') {
      setError('Name is required')
    } else if (url === '') {
      setError('Server is required')
    } else if (!url.startsWith('https://')) {
      setError('Invalid URL')
    } else if (provider === '') {
      setError('OIDC Provider is required')
    } else {
      try {
        context.addCluster([{
          id: '',
          name: name,
          url: url,
          certificateAuthorityData: certificateAuthorityData,
          clientCertificateData: '',
          clientKeyData: '',
          token: '',
          username: '',
          password: '',
          insecureSkipTLSVerify: false,
          authProvider: `oidc__${provider}`,
          namespace: 'default',
        }]);

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
              <IonButton onClick={() => addClusters()}>
                Add
              </IonButton>
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
            <IonLabel>OIDC Provider</IonLabel>
            <IonSelect value={provider} onIonChange={handleProvider}>
              {context.oidcProviders ? Object.keys(context.oidcProviders).map(provider => {
                return <IonSelectOption key={provider} value={provider}>{provider}</IonSelectOption>
              }) : null}
            </IonSelect>
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

export default OIDCPage;
