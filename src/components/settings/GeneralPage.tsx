import {
  IonButtons,
  IonContent,
  IonHeader,
  IonItem,
  IonItemDivider,
  IonItemGroup,
  IonLabel,
  IonList,
  IonMenuButton,
  IonPage,
  IonSelect,
  IonSelectOption,
  IonTitle,
  IonToggle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import React, { useContext } from 'react';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import OIDCProvider from './general/OIDCProvider';

const GeneralPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const changeEditorTheme = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      editorTheme: event.target.value,
    })
  };

  const toggleDarkMode = (event) => {
    context.editSettings({
      darkMode: event.detail.checked,
      editorTheme: context.settings.editorTheme,
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
              <IonLabel>Editor Theme</IonLabel>
              <IonSelect value={context.settings.editorTheme} onIonChange={changeEditorTheme}>
                <IonSelectOption value="ambiance">Ambiance</IonSelectOption>
                <IonSelectOption value="chaos">Chaos</IonSelectOption>
                <IonSelectOption value="chrome">Chrome</IonSelectOption>
                <IonSelectOption value="clouds">Clouds</IonSelectOption>
                <IonSelectOption value="clouds_midnight">Clouds Midnight</IonSelectOption>
                <IonSelectOption value="cobalt">Cobalt</IonSelectOption>
                <IonSelectOption value="crimson_editor">Crimson Editor</IonSelectOption>
                <IonSelectOption value="dawn">Dawn</IonSelectOption>
                <IonSelectOption value="dracula">Dracula</IonSelectOption>
                <IonSelectOption value="dreamweaver">Dreamweaver</IonSelectOption>
                <IonSelectOption value="eclipse">Eclipse</IonSelectOption>
                <IonSelectOption value="github">GitHub</IonSelectOption>
                <IonSelectOption value="gob">Gob</IonSelectOption>
                <IonSelectOption value="gruvbox">Gruvbox</IonSelectOption>
                <IonSelectOption value="idle_fingers">Idle Fingers</IonSelectOption>
                <IonSelectOption value="iplastic">iPlastic</IonSelectOption>
                <IonSelectOption value="katzenmilch">Katzenmilch</IonSelectOption>
                <IonSelectOption value="kr_theme">krTheme</IonSelectOption>
                <IonSelectOption value="kuroir">Kuroir</IonSelectOption>
                <IonSelectOption value="merbivore">Merbivore</IonSelectOption>
                <IonSelectOption value="merbivore_soft">Merbivore Soft</IonSelectOption>
                <IonSelectOption value="monokai">Monokai</IonSelectOption>
                <IonSelectOption value="mono_industrial">Mono Industrial</IonSelectOption>
                <IonSelectOption value="pastel_on_dark">Pastel on Dark</IonSelectOption>
                <IonSelectOption value="solarized_dark">Solarized Dark</IonSelectOption>
                <IonSelectOption value="solarized_light">Solarized Light</IonSelectOption>
                <IonSelectOption value="sqlserver">SQL Server</IonSelectOption>
                <IonSelectOption value="terminal">Terminal</IonSelectOption>
                <IonSelectOption value="textmate">TextMate</IonSelectOption>
                <IonSelectOption value="tomorrow">Tomorrow</IonSelectOption>
                <IonSelectOption value="tomorrow_night">Tomorrow Night</IonSelectOption>
                <IonSelectOption value="tomorrow_night_blue">Tomorrow Night Blue</IonSelectOption>
                <IonSelectOption value="tomorrow_night_bright">Tomorrow Night Bright</IonSelectOption>
                <IonSelectOption value="tomorrow_night_eighties">Tomorrow Night Eighties</IonSelectOption>
                <IonSelectOption value="twilight">Twilight</IonSelectOption>
                <IonSelectOption value="vibrant_ink">Vibrant Ink</IonSelectOption>
                <IonSelectOption value="xcode">Xcode</IonSelectOption>
              </IonSelect>
            </IonItem>
          </IonItemGroup>

          {isPlatform('hybrid') ? (
            <IonItemGroup>
              <IonItemDivider>
                <IonLabel>OIDC Provider</IonLabel>
              </IonItemDivider>
              {context.oidcProviders ? Object.keys(context.oidcProviders).map(provider => {
                return (
                  <OIDCProvider key={provider} provider={provider} />
                )
              }) : (
                <IonItem>
                  <IonLabel><h2>No OIDC Provider found</h2></IonLabel>
                </IonItem>
              )}
            </IonItemGroup>
          ) : null}
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default GeneralPage;
