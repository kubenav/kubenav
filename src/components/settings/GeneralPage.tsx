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
  IonSelect,
  IonSelectOption,
  IonTextarea,
  IonTitle,
  IonToggle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext } from 'react';

import { IContext } from '../../declarations';
import { IS_INCLUSTER } from '../../utils/constants';
import { AppContext } from '../../utils/context';

const GeneralPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const handleValueChange = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: event.target.value });
  };

  const handleNumberValueChange = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: parseInt(event.target.value) });
  };

  const handleToggleChange = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: event.detail.checked });
  };

  const handleRangeChange = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: event.detail.value });
  };

  const handleRangeChangeQueryRefetchInterval = (event) => {
    context.editSettings({ ...context.settings, [event.target.name]: event.detail.value * 1000 });
  };

  const handleSelect = (event) => {
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
              <IonLabel>General</IonLabel>
            </IonItemDivider>
            <IonItem>
              <IonLabel>Theme</IonLabel>
              <IonSelect value={context.settings.theme} name="theme" onIonChange={handleSelect} interface="popover">
                <IonSelectOption value="system">System</IonSelectOption>
                <IonSelectOption value="dark">Dark</IonSelectOption>
                <IonSelectOption value="light">Light</IonSelectOption>
              </IonSelect>
            </IonItem>
            <IonItem>
              <IonLabel className="label-for-range" position="stacked">
                Request Timeout (in seconds)
              </IonLabel>
              <IonRange
                min={10}
                max={120}
                step={10}
                pin={true}
                color="primary"
                name="timeout"
                value={context.settings.timeout}
                onIonChange={handleRangeChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel className="label-for-range" position="stacked">
                Terminal Font Size (in px)
              </IonLabel>
              <IonRange
                min={8}
                max={48}
                step={2}
                pin={true}
                color="primary"
                name="terminalFontSize"
                value={context.settings.terminalFontSize}
                onIonChange={handleRangeChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel className="label-for-range" position="stacked">
                Terminal Scrollback (in lines)
              </IonLabel>
              <IonRange
                min={1000}
                max={50000}
                step={1000}
                pin={true}
                color="primary"
                name="terminalScrollback"
                value={context.settings.terminalScrollback}
                onIonChange={handleRangeChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel>Show Pod Metrics in List View</IonLabel>
              <IonToggle
                name="showPodMetricsInListViews"
                checked={context.settings.showPodMetricsInListViews}
                onIonChange={handleToggleChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel className="label-for-range" position="stacked">
                Refresh Interval (in seconds)
              </IonLabel>
              <IonRange
                min={30}
                max={600}
                step={30}
                pin={true}
                color="primary"
                name="queryRefetchInterval"
                value={context.settings.queryRefetchInterval / 1000}
                onIonChange={handleRangeChangeQueryRefetchInterval}
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

          {IS_INCLUSTER ? null : (
            <IonItemGroup>
              <IonItemDivider>
                <IonLabel>Prometheus</IonLabel>
              </IonItemDivider>
              <IonItem>
                <IonLabel>Enabled</IonLabel>
                <IonToggle
                  name="prometheusEnabled"
                  checked={context.settings.prometheusEnabled}
                  onIonChange={handleToggleChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Namespace</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  placeholder="monitoring"
                  name="prometheusNamespace"
                  value={context.settings.prometheusNamespace}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Selector</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  placeholder="app=prometheus"
                  name="prometheusSelector"
                  value={context.settings.prometheusSelector}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Port</IonLabel>
                <IonInput
                  type="number"
                  required={true}
                  placeholder="9090"
                  name="prometheusPort"
                  value={context.settings.prometheusPort}
                  onInput={handleNumberValueChange}
                />
              </IonItem>
            </IonItemGroup>
          )}

          {IS_INCLUSTER ? null : (
            <IonItemGroup>
              <IonItemDivider>
                <IonLabel>Proxy</IonLabel>
              </IonItemDivider>
              <IonItem>
                <IonLabel>Enabled</IonLabel>
                <IonToggle
                  name="proxyEnabled"
                  checked={context.settings.proxyEnabled}
                  onIonChange={handleToggleChange}
                />
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
          )}
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default memo(GeneralPage, (): boolean => {
  return true;
});
