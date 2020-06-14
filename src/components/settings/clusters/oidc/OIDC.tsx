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
import React, { useContext, useState } from 'react';

import { IContext } from '../../../../declarations';
import { getOIDCLink } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { isBase64 } from '../../../../utils/helpers';
import { saveOIDCLastProvider } from '../../../../utils/storage';

const OIDC: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const [name, setName] = useState<string>('');
  const [discoveryURL, setDiscoveryURL] = useState<string>('');
  const [clientID, setClientID] = useState<string>('');
  const [clientSecret, setClientSecret] = useState<string>('');
  const [certificateAuthority, setCertificateAuthority] = useState<string>('');
  const [refreshToken, setRefreshToken] = useState<string>('');
  const [error, setError] = useState<string>('');

  const handleName = (event) => {
    setName(event.target.value);
  };

  const handleDiscoveryURL = (event) => {
    setDiscoveryURL(event.target.value);
  };

  const handleClientID = (event) => {
    setClientID(event.target.value);
  };

  const handleClientSecret = (event) => {
    setClientSecret(event.target.value);
  };

  const handleCertificateAuthority = (event) => {
    setCertificateAuthority(event.target.value);
  };

  const handleRefreshToken = (event) => {
    setRefreshToken(event.target.value);
  };

  const addOIDCProvider = async () => {
    if (name === '' || discoveryURL === '' || clientID === '' || clientSecret === '') {
      setError('Discovery URL, Client ID and Client Secret are required.');
    } else {
      const ca = isBase64(certificateAuthority) ? atob(certificateAuthority) : certificateAuthority;

      context.addOIDCProvider({
        name: name,
        clientID: clientID,
        clientSecret: clientSecret,
        idpIssuerURL: discoveryURL,
        refreshToken: refreshToken,
        certificateAuthority: ca,
        idToken: '',
        accessToken: '',
        expiry: 0,
      });

      if (refreshToken) {
        window.location.replace('/settings/clusters/oidc');
      } else {
        try {
          const url = await getOIDCLink(discoveryURL, clientID, clientSecret, ca);
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
          Choose this option to use an OIDC provider for the authentication against your Kubernetes API server. If you
          have already added an OIDC provider you can use the <b>Use existing OIDC Provider</b> button. If you add a new
          OIDC provider you have to add the <b>Discovery URL</b> (this field is also known as
          <code>idp-issuer-url</code>), a <b>Client ID</b> and a <b>Client Secret</b>. When you create the Client ID and
          Client Secret you have to allow <code>https://kubenav.io/oidc.html</code> as redirect URL.
        </p>
        <p className="paragraph-margin-bottom">
          When your OIDC provider uses self signed certificate you have to set the <b>Certificate Authority</b> field.
          You can also skip the redirect to the OIDC login page, by providing a valid refresh token.
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
            <IonLabel position="stacked">Certificate Authority (optional)</IonLabel>
            <IonTextarea autoGrow={true} value={certificateAuthority} onInput={handleCertificateAuthority} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Refresh Token (optional)</IonLabel>
            <IonTextarea autoGrow={true} value={refreshToken} onInput={handleRefreshToken} />
          </IonItem>
        </IonList>

        <IonButton expand="block" onClick={() => addOIDCProvider()}>
          Add OIDC Provider
        </IonButton>
        <br />
        <IonButton expand="block" onClick={() => existingOIDCProvider()}>
          Use existing OIDC Provider
        </IonButton>
      </IonCardContent>

      <IonToast isOpen={error !== ''} onDidDismiss={() => setError('')} message={error} duration={3000} />
    </IonCard>
  );
};

export default OIDC;
