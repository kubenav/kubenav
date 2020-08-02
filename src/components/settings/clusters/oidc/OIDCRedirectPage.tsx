import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonTextarea,
  IonTitle,
  IonToggle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext, useEffect, useState } from 'react';
import { RouteComponentProps, useLocation } from 'react-router';

import { IContext, IClusterAuthProviderOIDC } from '../../../../declarations';
import { getOIDCRefreshToken } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readTemporaryCredentials } from '../../../../utils/storage';
import useAsyncFn from '../../../../utils/useAsyncFn';
import ErrorCard from '../../../misc/ErrorCard';

const useQuery = () => {
  return new URLSearchParams(useLocation().search);
};

type IOIDCRedirectPageProps = RouteComponentProps;

const OIDCRedirectPage: React.FunctionComponent<IOIDCRedirectPageProps> = ({ history }: IOIDCRedirectPageProps) => {
  const context = useContext<IContext>(AppContext);
  const query = useQuery();
  const [provider, setProvider] = useState<undefined | IClusterAuthProviderOIDC>(undefined);

  const [state, , fetchInit] = useAsyncFn(
    async () => {
      try {
        let credentials = readTemporaryCredentials('oidc') as undefined | IClusterAuthProviderOIDC;

        if (credentials) {
          if (query.get('error')) {
            throw new Error(query.get('error') as string);
          }

          if (query.get('code')) {
            credentials = await getOIDCRefreshToken(credentials, query.get('code') as string);
            setProvider(credentials);
          }
        } else {
          throw new Error('Could not read credentials for OIDC');
        }
      } catch (err) {
        throw err;
      }
    },
    [],
    { loading: true, error: undefined, value: undefined },
  );

  const [error, setError] = useState<string>('');
  const [name, setName] = useState<string>('');
  const [url, setURL] = useState<string>('');
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>('');
  const [insecureSkipTLSVerify, setInsecureSkipTLSVerify] = useState<boolean>(false);

  useEffect(() => {
    fetchInit();
  }, [fetchInit]);

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
            authProvider: 'oidc',
            authProviderOIDC: provider,
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
        ) : state.error ? (
          <ErrorCard error={state.error} text="OIDC Error" icon="/assets/icons/kubernetes/kubernetes.png" />
        ) : (
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
        )}

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

export default memo(OIDCRedirectPage, (): boolean => {
  return true;
});
