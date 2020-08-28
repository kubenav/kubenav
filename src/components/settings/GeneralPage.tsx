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
  IonRange,
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

  const handleRangeChange = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: event.detail.value });
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
              <IonRange
                min={10}
                max={120}
                step={10}
                pin={true}
                snaps={true}
                color="primary"
                name="timeout"
                value={context.settings.timeout}
                onIonChange={handleRangeChange}
              />
            </IonItem>
          </IonItemGroup>
          <IonItemGroup>
            <IonItemDivider>
              <IonLabel>Terminal</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel position="stacked">Font Size (in px)</IonLabel>
              <IonRange
                min={8}
                max={48}
                step={2}
                pin={true}
                snaps={true}
                color="primary"
                name="terminalFontSize"
                value={context.settings.terminalFontSize}
                onIonChange={handleRangeChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel position="stacked">Scrollback (in lines)</IonLabel>
              <IonRange
                min={1000}
                max={50000}
                step={1000}
                pin={true}
                snaps={true}
                color="primary"
                name="terminalScrollback"
                value={context.settings.terminalScrollback}
                onIonChange={handleRangeChange}
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
