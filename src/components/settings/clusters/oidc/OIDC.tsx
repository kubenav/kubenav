import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonTextarea,
  IonToast,
} from '@ionic/react';
import React, {useContext, useState} from 'react';

import { IContext } from '../../../../declarations';
import { getOIDCLink } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { saveOIDCLastProvider } from '../../../../utils/storage';

const OIDC: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const [name, setName] = useState<string>('');
  const [discoveryURL, setDiscoveryURL] = useState<string>('');
  const [clientID, setClientID] = useState<string>('');
  const [clientSecret, setClientSecret] = useState<string>('');
  const [refreshToken, setRefreshToken] = useState<string>('');
  const [error, setError] = useState<string>('');

  const handleName = (event) => {
    setName(event.target.value);
  }

  const handleDiscoveryURL = (event) => {
    setDiscoveryURL(event.target.value);
  };

  const handleClientID = (event) => {
    setClientID(event.target.value);
  };

  const handleClientSecret = (event) => {
    setClientSecret(event.target.value);
  };

  const handleRefreshToken = (event) => {
    setRefreshToken(event.target.value);
  };

  const addOIDCProvider = async () => {
    if (name === '' || discoveryURL === '' || clientID === '' || clientSecret === '') {
      setError('Discovery URL, Client ID and Client Secret are required.');
    } else {
      context.addOIDCProvider({
        name: name,
        clientID: clientID,
        clientSecret: clientSecret,
        idpIssuerURL: discoveryURL,
        refreshToken: refreshToken,
        idToken: '',
        accessToken: '',
        expiry: 0,
      });

      if (refreshToken) {
        window.location.replace('/settings/clusters/oidc');
      } else {
        try {
          const url = await getOIDCLink(discoveryURL, clientID, clientSecret);
          saveOIDCLastProvider(name);
          window.location.replace(url);
        } catch (err) {
          setError(err.message);
        }
      }
    }
  };

  const existingOIDCProvider = () => {
    window.location.replace('/settings/clusters/oidc');
  };

  return (
    <IonCard>
      <div className="card-header-image">
        <img alt="OIDC" src="/assets/card-header-oidc.png" />
      </div>
      <IonCardHeader>
        <IonCardTitle>OIDC Provider</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">
          Choose this option to add an OIDC provider for your clusters.
        </p>

        <IonList className="paragraph-margin-bottom" lines="full">
          <IonItem>
            <IonLabel position="stacked">Name</IonLabel>
            <IonInput type="text" required={true} value={name} onInput={handleName} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Discovery URL</IonLabel>
            <IonInput type="text" required={true} value={discoveryURL} onInput={handleDiscoveryURL} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Client ID</IonLabel>
            <IonInput type="text" required={true} value={clientID} onInput={handleClientID} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Client Secret</IonLabel>
            <IonInput type="text" required={true} value={clientSecret} onInput={handleClientSecret} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Refresh Token (optional)</IonLabel>
            <IonTextarea autoGrow={true} value={refreshToken} onInput={handleRefreshToken} />
          </IonItem>
        </IonList>

        <IonButton expand="block" onClick={() => addOIDCProvider()}>Add OIDC Provider</IonButton>
        <br/>
        <IonButton expand="block" onClick={() => existingOIDCProvider()}>Use existing OIDC Provider</IonButton>
      </IonCardContent>

      <IonToast isOpen={error !== ''} onDidDismiss={() => setError('')} message={error} duration={3000} />
    </IonCard>
  );
};

export default OIDC;
