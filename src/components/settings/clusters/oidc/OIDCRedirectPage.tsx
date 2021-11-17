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
import React, { memo, useContext, useState } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps, useLocation } from 'react-router';

import { IContext, IClusterAuthProviderOIDC } from '../../../../declarations';
import { getOIDCRefreshToken } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readTemporaryCredentials } from '../../../../utils/storage';
import ErrorCard from '../../../misc/ErrorCard';

const useQueryParameter = () => {
  return new URLSearchParams(useLocation().search);
};

type IOIDCRedirectPageProps = RouteComponentProps;

const OIDCRedirectPage: React.FunctionComponent<IOIDCRedirectPageProps> = ({ history }: IOIDCRedirectPageProps) => {
  const context = useContext<IContext>(AppContext);
  const query = useQueryParameter();
  const [provider, setProvider] = useState<undefined | IClusterAuthProviderOIDC>(undefined);

  const [inputError, setInputError] = useState<string>('');

  const [clusterID, setClusterID] = useState<string>('');
  const [name, setName] = useState<string>('');
  const [url, setURL] = useState<string>('');
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>('');
  const [insecureSkipTLSVerify, setInsecureSkipTLSVerify] = useState<boolean>(false);
  const [namespace, setNamespace] = useState<string>('default');

  const { isError, isFetching, error } = useQuery('OIDCRedirectPage', async () => {
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

        if (context.clusters && credentials.clusterID) {
          setClusterID(credentials.clusterID);
          setName(context.clusters[credentials.clusterID].name);
          setURL(context.clusters[credentials.clusterID].url);
          setCertificateAuthorityData(context.clusters[credentials.clusterID].certificateAuthorityData);
          setInsecureSkipTLSVerify(context.clusters[credentials.clusterID].insecureSkipTLSVerify);
          setNamespace(context.clusters[credentials.clusterID].namespace);
        }
      } else {
        throw new Error('Could not read credentials for OIDC');
      }
    } catch (err) {
      throw err;
    }
  });

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
      setInputError('Name is required');
    } else if (url === '') {
      setInputError('Server is required');
    } else if (!url.startsWith('https://')) {
      setInputError('Invalid URL');
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

        setInputError('');
        history.push('/settings/clusters');
      } catch (err) {
        setInputError(err.message);
      }
    }
  };

  const editClusters = () => {
    if (name === '') {
      setInputError('Name is required');
    } else if (url === '') {
      setInputError('Server is required');
    } else if (!url.startsWith('https://')) {
      setInputError('Invalid URL');
    } else {
      try {
        context.editCluster({
          id: clusterID,
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
          namespace: namespace,
        });

        setInputError('');
        history.push('/settings/clusters');
      } catch (err) {
        setInputError(err.message);
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
          <IonTitle>{clusterID ? 'Edit' : 'Add'} Clusters</IonTitle>
          {isError ? null : (
            <IonButtons slot="primary">
              {clusterID ? (
                <IonButton onClick={() => editClusters()}>Save</IonButton>
              ) : (
                <IonButton onClick={() => addClusters()}>Add</IonButton>
              )}
            </IonButtons>
          )}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? (
          <IonProgressBar slot="fixed" type="indeterminate" color="primary" />
        ) : isError ? (
          <ErrorCard error={error as Error} text="OIDC Error" icon="/assets/icons/kubernetes/kubernetes.png" />
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

        {inputError !== '' ? (
          <IonAlert
            isOpen={inputError !== ''}
            onDidDismiss={() => setInputError('')}
            header="Could not add cluster"
            message={inputError}
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
