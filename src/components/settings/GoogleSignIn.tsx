import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import React from 'react';

import { GOOGLE_OAUTH2_ENDPOINT, GOOGLE_REDIRECT_URI, GOOGLE_RESPONSE_TYPE, GOOGLE_SCOPE } from '../../constants';
import { getGoogleClientID } from '../../utils';

const GoogleSignIn: React.FunctionComponent = () => {
  return (
    <IonItem detail={false} href={`${GOOGLE_OAUTH2_ENDPOINT}?client_id=${getGoogleClientID()}&redirect_uri=${GOOGLE_REDIRECT_URI}&response_type=${GOOGLE_RESPONSE_TYPE}&scope=${GOOGLE_SCOPE}`} target="_blank">
      <IonLabel>
        <h2>Google Cloud Platform</h2>
      </IonLabel>
    </IonItem>
  );
};

export default GoogleSignIn;
