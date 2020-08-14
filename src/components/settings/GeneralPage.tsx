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

  const changeTimeout = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      timeout: parseInt(event.target.value),
      sshKey: context.settings.sshKey,
      sshPort: context.settings.sshPort,
      sshUser: context.settings.sshUser,
      proxyEnabled: context.settings.proxyEnabled,
      proxyAddress: context.settings.proxyAddress,
    });
  };

  const toggleDarkMode = (event) => {
    context.editSettings({
      darkMode: event.detail.checked,
      timeout: context.settings.timeout,
      sshKey: context.settings.sshKey,
      sshPort: context.settings.sshPort,
      sshUser: context.settings.sshUser,
      proxyEnabled: context.settings.proxyEnabled,
      proxyAddress: context.settings.proxyAddress,
    });
  };

  const changeSSHKey = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      timeout: context.settings.timeout,
      sshKey: event.target.value,
      sshPort: context.settings.sshPort,
      sshUser: context.settings.sshUser,
      proxyEnabled: context.settings.proxyEnabled,
      proxyAddress: context.settings.proxyAddress,
    });
  };

  const changeSSHPort = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      timeout: context.settings.timeout,
      sshKey: context.settings.sshKey,
      sshPort: event.target.value,
      sshUser: context.settings.sshUser,
      proxyEnabled: context.settings.proxyEnabled,
      proxyAddress: context.settings.proxyAddress,
    });
  };

  const changeSSHUser = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      timeout: context.settings.timeout,
      sshKey: context.settings.sshKey,
      sshPort: context.settings.sshPort,
      sshUser: event.target.value,
      proxyEnabled: context.settings.proxyEnabled,
      proxyAddress: context.settings.proxyAddress,
    });
  };

  const toggleProxyEnabled = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      timeout: context.settings.timeout,
      sshKey: context.settings.sshKey,
      sshPort: context.settings.sshPort,
      sshUser: context.settings.sshUser,
      proxyEnabled: event.detail.checked,
      proxyAddress: context.settings.proxyAddress,
    });
  };

  const changeProxyAddress = (event) => {
    context.editSettings({
      darkMode: context.settings.darkMode,
      timeout: context.settings.timeout,
      sshKey: context.settings.sshKey,
      sshPort: context.settings.sshPort,
      sshUser: context.settings.sshUser,
      proxyEnabled: context.settings.proxyEnabled,
      proxyAddress: event.target.value,
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

          <IonItemGroup>
            <IonItemDivider>
              <IonLabel>SSH</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel position="stacked">Port</IonLabel>
              <IonInput type="text" required={true} value={context.settings.sshPort} onInput={changeSSHPort} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Private Key</IonLabel>
              <IonTextarea autoGrow={true} value={context.settings.sshKey} onInput={changeSSHKey} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">User</IonLabel>
              <IonInput type="text" required={true} value={context.settings.sshUser} onInput={changeSSHUser} />
            </IonItem>
          </IonItemGroup>

          <IonItemGroup>
            <IonItemDivider>
              <IonLabel>Proxy</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel>Enabled</IonLabel>
              <IonToggle checked={context.settings.proxyEnabled} onIonChange={toggleProxyEnabled} />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Address</IonLabel>
              <IonInput
                type="text"
                required={true}
                value={context.settings.proxyAddress}
                onInput={changeProxyAddress}
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
