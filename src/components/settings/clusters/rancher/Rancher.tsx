import {
  IonActionSheet,
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonIcon,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonToast,
  IonToggle,
  isPlatform,
} from '@ionic/react';
import React, { useState, useEffect } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';
import { IClusterAuthProviderRancher, IRancherTokenResponse } from '../../../../declarations';
import { getRancherToken } from '../../../../utils/api';
import { addOutline } from 'ionicons/icons';

import { readTemporaryCredentials, saveTemporaryCredentials } from '../../../../utils/storage';

export interface IRancherProps extends RouteComponentProps {
  close: () => void;
}

const Rancher: React.FunctionComponent<IRancherProps> = ({ close, history }: IRancherProps) => {
  const [rancherHost, setRancherHost] = useState<string>('');
  const [rancherPort, setRancherPort] = useState<number>(443);
  const [secure, setSecure] = useState<boolean>(true);
  const [username, setUsername] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const [bearerToken, setBearerToken] = useState<string>('');
  const [error, setError] = useState<string>('');
  const [showActionSheet, setShowActionSheet] = useState(false);

  useEffect(() => {
    const credentials = readTemporaryCredentials('rancher') as undefined | IClusterAuthProviderRancher;

    if (credentials) {
      if (credentials.rancherHost) {
        setRancherHost(credentials.rancherHost);
      }
      if (credentials.rancherPort) {
        setRancherPort(credentials.rancherPort);
      }
      if (credentials.secure) {
        setSecure(credentials.secure);
      }
      if (credentials.username) {
        setUsername(credentials.username);
      }
      if (credentials.password) {
        setPassword(credentials.password);
      }
      if (credentials.bearerToken) {
        setBearerToken(credentials.bearerToken);
      }
    }
  }, []);

  const handleSecure = (event) => {
    const isSecure = event.target.checked;
    setSecure(isSecure);

    if (isSecure && rancherPort == 80) {
      setRancherPort(443);
    } else if (!isSecure && rancherPort == 443) {
      setRancherPort(80);
    }
  };

  const handleRancherHost = (event) => {
    setRancherHost(event.target.value);
  };

  const handleRancherPort = (event) => {
    setRancherPort(event.target.value);
  };

  const handleUsername = (event) => {
    setUsername(event.target.value);
  };

  const handlePassword = (event) => {
    setPassword(event.target.value);
  };

  const handleBearerToken = (event) => {
    setBearerToken(event.target.value);
  };

  const storeRancherCredentials = () => {
    saveTemporaryCredentials({
      rancherHost: rancherHost,
      rancherPort: rancherPort,
      secure: secure,
      username: username,
      password: password,
      bearerToken: bearerToken,
      expires: 0,
    });
  };

  const handleSignIn = () => {
    if (rancherHost === '') {
      setError('Rancher Host is required.');
    } else {
      storeRancherCredentials();

      close();
      history.push('/settings/clusters/rancher');
    }
  };

  const handleApiTokenGeneration = async () => {
    try {
      if (username == '' || password == '') {
        setError('Please enter Username and Password first!');
        return;
      }

      const tokenResponse: IRancherTokenResponse = await getRancherToken(
        rancherHost,
        rancherPort,
        username,
        password,
        bearerToken,
        secure,
      );

      storeRancherCredentials();

      setBearerToken(tokenResponse.token);
      setUsername('');
      setPassword('');
    } catch (err) {
      setError(err);
    }
  };

  return (
    <IonCard>
      <div className="card-header-image">
        <img alt="Rancher" src="/assets/card-header-rancher.png" />
      </div>
      <IonCardHeader>
        <IonCardTitle>Import from Rancher Platform</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">
          Choose this option to import your Rancher clusters from the Rancher Platform.
        </p>

        <IonList className="paragraph-margin-bottom" lines="full">
          <IonItem>
            <IonLabel position="stacked">Rancher Host</IonLabel>
            <IonInput type="text" required={true} value={rancherHost} onInput={handleRancherHost} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Rancher Port</IonLabel>
            <IonInput type="number" required={true} value={rancherPort} onInput={handleRancherPort} />
          </IonItem>
          <IonItem>
            <IonLabel>Secure</IonLabel>
            <IonToggle checked={secure} onIonChange={handleSecure} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Username</IonLabel>
            <IonInput autocomplete="username" type="text" required={true} value={username} onInput={handleUsername} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Password</IonLabel>
            <IonInput
              autocomplete="current-password"
              type="password"
              required={true}
              value={password}
              onInput={handlePassword}
            />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Bearer Token (optional)</IonLabel>
            <IonInput type="text" required={false} value={bearerToken} onInput={handleBearerToken} />
            <IonButton
              hidden={bearerToken != ''}
              expand="full"
              slot="end"
              fill="clear"
              shape="round"
              size="large"
              style={
                isPlatform('ios')
                  ? { '--padding-end': '0em' }
                  : { '--padding-start': '0.5em', '--padding-end': '0.5em' }
              }
              onClick={() => setShowActionSheet(true)}
            >
              <IonIcon size="large" icon={addOutline} />
            </IonButton>
          </IonItem>
        </IonList>
        <IonButton expand="block" onClick={() => handleSignIn()}>
          Sign In to Rancher
        </IonButton>
      </IonCardContent>

      <IonToast isOpen={error !== ''} onDidDismiss={() => setError('')} message={error} duration={3000} />
      <IonActionSheet
        isOpen={showActionSheet}
        onDidDismiss={() => setShowActionSheet(false)}
        buttons={[
          {
            text: 'Generate and save API Token',
            role: 'generate',
            handler: handleApiTokenGeneration,
          },
          {
            text: 'Cancel',
            role: 'cancel',
          },
        ]}
      />
    </IonCard>
  );
};

export default withRouter(Rancher);
