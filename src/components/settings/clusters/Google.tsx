import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
} from '@ionic/react';
import React from 'react';

import { GOOGLE_OAUTH2_ENDPOINT, GOOGLE_REDIRECT_URI, GOOGLE_RESPONSE_TYPE, GOOGLE_SCOPE } from '../../../constants';
import { getGoogleClientID } from '../../../utils';

const Google: React.FunctionComponent = () => {
  return (
    <IonCard>
      <img alt="GCP" src="/assets/card-header-gcp.png" />
      <IonCardHeader>
        <IonCardTitle>Import from Google Cloud Platform</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">
          Choose this option to import your GKE clusters from the Google Cloud Platform. You will be ask to sign in via your Google account, then you get a list of your existing clusters and you can select the clusters you want to add.
        </p>
        <IonButton expand="block" href={`${GOOGLE_OAUTH2_ENDPOINT}?client_id=${getGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&response_type=${GOOGLE_RESPONSE_TYPE}&scope=${GOOGLE_SCOPE}`} target="_blank">Sign In with Google</IonButton>
      </IonCardContent>
    </IonCard>
  );
};

export default Google;
