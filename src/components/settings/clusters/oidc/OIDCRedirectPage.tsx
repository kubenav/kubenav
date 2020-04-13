import {
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
  IonToolbar
} from '@ionic/react';
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps, useLocation } from 'react-router';

import { IContext } from '../../../../declarations';
import { getOIDCRefreshToken } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { readOIDCLastProvider } from '../../../../utils/storage';
import ErrorCard from '../../../misc/ErrorCard';

const useQuery = () => {
  return new URLSearchParams(useLocation().search);
}

interface IOIDCRedirectPageProps extends RouteComponentProps {}

const OIDCRedirectPage: React.FunctionComponent<IOIDCRedirectPageProps> = ({ location, history }) => {
  const context = useContext<IContext>(AppContext);
  const query = useQuery();

  const [error, setError] = useState<string>('');
  const [name, setName] = useState<string>('');
  const [url, setURL] = useState<string>('');
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>('');
  const [showLoading, setShowLoading] = useState<boolean>(false);

  useEffect(() => {
    (async() => {
      setShowLoading(true);

      try {
        const lastProvider = readOIDCLastProvider();

        if (query.get('error')) {
          throw new Error(query.get('error') as string);
        }

        if (query.get('code')) {
          if (context.oidcProviders && context.oidcProviders.hasOwnProperty(lastProvider)) {
            const provider = context.oidcProviders[lastProvider];

            const tokens = await getOIDCRefreshToken(
              provider.idpIssuerURL,
              provider.clientID,
              provider.clientSecret,
              query.get('code') as string,
            );

            provider.refreshToken = tokens.refresh_token;
            provider.idToken = tokens.id_token;
            provider.accessToken = tokens.access_token;
            provider.expiry = tokens.expiry;

            context.addOIDCProvider(provider);
          } else {
            setError('Could not find OIDC provider.')
          }
        }
      } catch (err) {
        setError(err.message);
      }

      setShowLoading(false);
    })();

    return () => {};
  }, [location]); /* eslint-disable-line */

  const handleName = (event) => {
    setName(event.target.value);
  };

  const handleURL = (event) => {
    setURL(event.target.value);
  };

  const handleCertificateAuthorityData = (event) => {
    setCertificateAuthorityData(event.target.value);
  };

  const addClusters = () => {
    if (name === '') {
      setError('Name is required')
    } else if (url === '') {
      setError('Server is required')
    } else if (!url.startsWith('https://')) {
      setError('Invalid URL')
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
          authProvider: `oidc__${readOIDCLastProvider()}`,
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

        {error ? <ErrorCard error={error} text="OIDC Error" icon="/assets/icons/kubernetes/kubernetes.png" /> : (
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
          </IonList>
        )}
      </IonContent>
    </IonPage>
  );
};

export default OIDCRedirectPage;
