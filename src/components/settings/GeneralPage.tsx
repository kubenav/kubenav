import {
  IonButtons,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonItemDivider,
  IonItemGroup,
  IonLabel,
  IonList,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToggle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import React, { memo, useContext } from 'react';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import OIDCProvider from './general/OIDCProvider';

const GeneralPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const changeTimeout = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      timeout: parseInt(event.target.value),
    });
  };

  const toggleDarkMode = (event) => {
    context.editSettings({
      darkMode: event.detail.checked,
      timeout: context.settings.timeout,
    });
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>General</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonList>
          <IonItemGroup>
            <IonItemDivider>
              <IonLabel>Appearance</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel>Dark Mode</IonLabel>
              <IonToggle checked={context.settings.darkMode} onIonChange={toggleDarkMode} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Timeout (in seconds)</IonLabel>
              <IonInput type="number" required={true} value={context.settings.timeout} onInput={changeTimeout} />
            </IonItem>
          </IonItemGroup>

          {isPlatform('hybrid') ? (
            <IonItemGroup>
              <IonItemDivider>
                <IonLabel>OIDC Provider</IonLabel>
              </IonItemDivider>
              {context.oidcProviders ? (
                Object.keys(context.oidcProviders).map((provider) => {
                  return <OIDCProvider key={provider} provider={provider} />;
                })
              ) : (
                <IonItem>
                  <IonLabel>
                    <h2>No OIDC Provider found</h2>
                  </IonLabel>
                </IonItem>
              )}
            </IonItemGroup>
          ) : null}
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default memo(GeneralPage, (): boolean => {
  return true;
});
