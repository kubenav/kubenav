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
  IonTextarea,
  IonTitle,
  IonToggle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext } from 'react';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';

const GeneralPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const handleValueChange = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: event.target.value });
  };

  const handleToggleChange = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: event.detail.checked });
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
              <IonToggle name="darkMode" checked={context.settings.darkMode} onIonChange={handleToggleChange} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Timeout (in seconds)</IonLabel>
              <IonInput
                type="number"
                required={true}
                name="timeout"
                value={context.settings.timeout}
                onInput={handleValueChange}
              />
            </IonItem>
          </IonItemGroup>
          <IonItemGroup>
            <IonItemDivider>
              <IonLabel>Terminal</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel position="stacked">Font Size</IonLabel>
              <IonInput
                type="number"
                required={true}
                name="terminalFontSize"
                value={context.settings.terminalFontSize}
                onInput={handleValueChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Scrollback</IonLabel>
              <IonInput
                type="number"
                required={true}
                name="terminalScrollback"
                value={context.settings.terminalScrollback}
                onInput={handleValueChange}
              />
            </IonItem>
          </IonItemGroup>

          <IonItemGroup>
            <IonItemDivider>
              <IonLabel>SSH</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel position="stacked">Port</IonLabel>
              <IonInput
                type="text"
                required={true}
                name="sshPort"
                value={context.settings.sshPort}
                onInput={handleValueChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Private Key</IonLabel>
              <IonTextarea autoGrow={true} name="sshKey" value={context.settings.sshKey} onInput={handleValueChange} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">User</IonLabel>
              <IonInput
                type="text"
                required={true}
                name="sshUser"
                value={context.settings.sshUser}
                onInput={handleValueChange}
              />
            </IonItem>
          </IonItemGroup>

          <IonItemGroup>
            <IonItemDivider>
              <IonLabel>Proxy</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel>Enabled</IonLabel>
              <IonToggle name="proxyEnabled" checked={context.settings.proxyEnabled} onIonChange={handleToggleChange} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Address</IonLabel>
              <IonInput
                type="text"
                required={true}
                placeholder="http://localhost:8888"
                name="proxyAddress"
                value={context.settings.proxyAddress}
                onInput={handleValueChange}
              />
            </IonItem>
          </IonItemGroup>
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default memo(GeneralPage, (): boolean => {
  return true;
});
