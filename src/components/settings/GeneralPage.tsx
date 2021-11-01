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
  isPlatform,
} from '@ionic/react';
import { FingerprintAIO } from '@ionic-native/fingerprint-aio';
import React, { memo, useContext, useEffect, useState } from 'react';

import { IContext } from '../../declarations';
import { IS_INCLUSTER } from '../../utils/constants';
import { AppContext } from '../../utils/context';

const GeneralPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const [isFingerprintAvailable, setIsFingerprintAvailable] = useState<boolean>(false);

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

  useEffect(() => {
    const checkFingerprintAvailable = async () => {
      try {
        await FingerprintAIO.isAvailable();
        setIsFingerprintAvailable(true);
      } catch (err) {
        setIsFingerprintAvailable(false);
      }
    };

    if (isPlatform('hybrid')) {
      checkFingerprintAvailable();
    }
  }, []);

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
            {isFingerprintAvailable ? (
              <IonItem>
                <IonLabel>Authentication</IonLabel>
                <IonToggle
                  name="authenticationEnabled"
                  checked={context.settings.authenticationEnabled}
                  onIonChange={handleToggleChange}
                />
              </IonItem>
            ) : null}
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
              <IonLabel>Editor Format</IonLabel>
              <IonSelect
                value={context.settings.editorFormat}
                name="editorFormat"
                onIonChange={handleSelect}
                interface="popover"
              >
                <IonSelectOption value="yaml">Yaml</IonSelectOption>
                <IonSelectOption value="json">Json</IonSelectOption>
              </IonSelect>
            </IonItem>
            <IonItem>
              <IonLabel>Enable Pod Metrics</IonLabel>
              <IonToggle
                name="enablePodMetrics"
                checked={context.settings.enablePodMetrics}
                onIonChange={handleToggleChange}
              />
            </IonItem>
            <IonItem>
              <IonLabel className="label-for-range" position="stacked">
                Limit
              </IonLabel>
              <IonRange
                min={100}
                max={1000}
                step={100}
                pin={true}
                color="primary"
                name="queryLimit"
                value={context.settings.queryLimit}
                onIonChange={handleRangeChange}
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
              <IonItem>
                <IonLabel position="stacked">Username</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  name="prometheusUsername"
                  value={context.settings.prometheusUsername}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Password</IonLabel>
                <IonInput
                  type="password"
                  required={true}
                  name="prometheusPassword"
                  value={context.settings.prometheusPassword}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Dashboards Namespace</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  placeholder="kubenav"
                  name="prometheusDashboardsNamespace"
                  value={context.settings.prometheusDashboardsNamespace}
                  onInput={handleValueChange}
                />
              </IonItem>
            </IonItemGroup>
          )}

          {IS_INCLUSTER ? null : (
            <IonItemGroup>
              <IonItemDivider>
                <IonLabel>Elasticsearch</IonLabel>
              </IonItemDivider>
              <IonItem>
                <IonLabel>Enabled</IonLabel>
                <IonToggle
                  name="elasticsearchEnabled"
                  checked={context.settings.elasticsearchEnabled}
                  onIonChange={handleToggleChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Namespace</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  placeholder="logging"
                  name="elasticsearchNamespace"
                  value={context.settings.elasticsearchNamespace}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Selector</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  placeholder="app=elasticsearch"
                  name="elasticsearchSelector"
                  value={context.settings.elasticsearchSelector}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Port</IonLabel>
                <IonInput
                  type="number"
                  required={true}
                  placeholder="9200"
                  name="elasticsearchPort"
                  value={context.settings.elasticsearchPort}
                  onInput={handleNumberValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Username</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  name="elasticsearchUsername"
                  value={context.settings.elasticsearchUsername}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Password</IonLabel>
                <IonInput
                  type="password"
                  required={true}
                  name="elasticsearchPassword"
                  value={context.settings.elasticsearchPassword}
                  onInput={handleValueChange}
                />
              </IonItem>
            </IonItemGroup>
          )}

          {IS_INCLUSTER ? null : (
            <IonItemGroup>
              <IonItemDivider>
                <IonLabel>Jaeger</IonLabel>
              </IonItemDivider>
              <IonItem>
                <IonLabel>Enabled</IonLabel>
                <IonToggle
                  name="jaegerEnabled"
                  checked={context.settings.jaegerEnabled}
                  onIonChange={handleToggleChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Namespace</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  placeholder="tracing"
                  name="jaegerNamespace"
                  value={context.settings.jaegerNamespace}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Selector</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  placeholder="app=jaeger,app.kubernetes.io/component=query"
                  name="jaegerSelector"
                  value={context.settings.jaegerSelector}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Port</IonLabel>
                <IonInput
                  type="number"
                  required={true}
                  placeholder="16686"
                  name="jaegerPort"
                  value={context.settings.jaegerPort}
                  onInput={handleNumberValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Username</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  name="jaegerUsername"
                  value={context.settings.jaegerUsername}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Password</IonLabel>
                <IonInput
                  type="password"
                  required={true}
                  name="jaegerPassword"
                  value={context.settings.jaegerPassword}
                  onInput={handleValueChange}
                />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Query Base Path</IonLabel>
                <IonInput
                  type="text"
                  required={true}
                  name="jaegerQueryBasePath"
                  value={context.settings.jaegerQueryBasePath}
                  onInput={handleValueChange}
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
