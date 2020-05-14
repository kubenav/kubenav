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
  IonToast,
} from '@ionic/react';
import React, { useState } from 'react';

import {
  GOOGLE_OAUTH2_ENDPOINT,
  GOOGLE_REDIRECT_URI,
  GOOGLE_RESPONSE_TYPE,
  GOOGLE_SCOPE,
} from '../../../../utils/constants';
import { saveGoogleClientID } from '../../../../utils/storage';

const Google: React.FunctionComponent = () => {
  const [clientID, setClientID] = useState<string>('');
  const [error, setError] = useState<string>('');

  const handleClientID = (event) => {
    setClientID(event.target.value);
    saveGoogleClientID(event.target.value);
  };

  const handleSignIn = () => {
    if (clientID === '') {
      setError('Client ID is required.');
    } else {
      window.location.replace(
        `${GOOGLE_OAUTH2_ENDPOINT}?client_id=${clientID}&redirect_uri=${GOOGLE_REDIRECT_URI}&response_type=${GOOGLE_RESPONSE_TYPE}&scope=${GOOGLE_SCOPE}`,
      );
    }
  };

  return (
    <IonCard>
      <div className="card-header-image">
        <img alt="GCP" src="/assets/card-header-gcp.png" />
      </div>
      <IonCardHeader>
        <IonCardTitle>Import from Google Cloud Platform</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">
          Choose this option to import your GKE clusters from the Google Cloud Platform. First of all you have to add
          the client ID of your Google OAuth application. More information for the setup of Google OAuth 2.0 can be
          found on the following page:{' '}
          <a href="https://kubenav.io/help/google-oauth2-configuration.html" target="_blank" rel="noopener noreferrer">
            Google OAuth 2.0 Configuration
          </a>
          . When you have added the client ID click the button sign in with Google. You will be redirect to the Google
          login form, then you get a list of your existing clusters and you can select the clusters you want to add.
        </p>

        <IonList className="paragraph-margin-bottom" lines="full">
          <IonItem>
            <IonLabel position="stacked">Client ID</IonLabel>
            <IonInput type="text" required={true} value={clientID} onInput={handleClientID} />
          </IonItem>
        </IonList>

        <IonButton expand="block" onClick={() => handleSignIn()}>
          Sign In with Google
        </IonButton>
      </IonCardContent>

      <IonToast isOpen={error !== ''} onDidDismiss={() => setError('')} message={error} duration={3000} />
    </IonCard>
  );
};

export default Google;
