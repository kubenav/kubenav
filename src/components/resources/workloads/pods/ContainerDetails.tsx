import {
  IonButton,
  IonButtons,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonContent,
  IonGrid,
  IonHeader,
  IonIcon,
  IonLabel,
  IonModal,
  IonRow,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import {
  V1Container,
  V1ContainerPort,
  V1ContainerState,
  V1ContainerStatus,
  V1EnvVarSource,
} from '@kubernetes/client-node';
import { close } from 'ionicons/icons';
import yaml from 'js-yaml';
import React from 'react';

import { IS_INCLUSTER } from '../../../../utils/constants';
import Editor from '../../../misc/Editor';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import Row from '../../misc/template/Row';
import Port from '../../misc/template/Port';

interface IContainerProps {
  name?: string;
  namespace?: string;
  container: V1Container;
  status?: V1ContainerStatus;
  showModal: boolean;
  setShowModal: (value: boolean) => void;
}

const Container: React.FunctionComponent<IContainerProps> = ({
  name,
  namespace,
  container,
  status,
  showModal,
  setShowModal,
}: IContainerProps) => {
  const containerState = (state: V1ContainerState): string => {
    if (state.running) {
      return `Started at ${state.running.startedAt}`;
    } else if (state.waiting) {
      return `Waiting: ${state.waiting.message}`;
    } else if (state.terminated) {
      return `Terminated with ${state.terminated.exitCode} at ${state.terminated.finishedAt}: ${state.terminated.reason}`;
    }

    return 'Indeterminate';
  };

  const envValueFrom = (source: V1EnvVarSource): string => {
    if (source.configMapKeyRef) {
      return source.configMapKeyRef.name
        ? `${source.configMapKeyRef.key} (${source.configMapKeyRef.name})`
        : source.configMapKeyRef.key;
    } else if (source.fieldRef) {
      return source.fieldRef.fieldPath;
    } else if (source.resourceFieldRef) {
      return source.resourceFieldRef.resource;
    } else if (source.secretKeyRef) {
      return source.secretKeyRef.name
        ? `${source.secretKeyRef.key} (${source.secretKeyRef.name})`
        : source.secretKeyRef.key;
    }

    return '';
  };

  return (
    <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonButton onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
            </IonButton>
          </IonButtons>
          <IonTitle>{container.name}</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonGrid>
          <IonRow>
            <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
              <IonCardEqualHeight>
                <IonCardHeader>
                  <IonCardTitle>Configuration</IonCardTitle>
                </IonCardHeader>
                <IonCardContent>
                  <IonGrid>
                    <Row obj={container} objKey="name" title="Name" />
                    <Row obj={container} objKey="image" title="Image" />
                    <Row obj={container} objKey="imagePullPolicy" title="Image Pull Policy" />
                    <Row obj={container} objKey="workingDir" title="Working Dir" />
                    <Row
                      obj={container}
                      objKey="command"
                      title="Command"
                      value={(command) => JSON.stringify(command)}
                    />
                    <Row
                      obj={container}
                      objKey="args"
                      title="Args"
                      value={(args) => (
                        <ul className="no-margin-list">
                          {args.map((arg, index) => (
                            <li key={index}>{arg}</li>
                          ))}
                        </ul>
                      )}
                    />
                    <Row
                      obj={container}
                      objKey="ports"
                      title="Ports"
                      value={(ports) =>
                        ports.map((port: V1ContainerPort, index: number) => {
                          return (
                            <Port
                              key={index}
                              enabled={
                                !IS_INCLUSTER &&
                                status !== undefined &&
                                (port.protocol === undefined || port.protocol === 'TCP')
                              }
                              name={name ? name : ''}
                              namespace={namespace ? namespace : ''}
                              selector=""
                              port={port.containerPort}
                            >
                              <IonLabel>
                                {port.containerPort}
                                {port.protocol ? `/${port.protocol}` : ''}
                                {port.name ? ` (${port.name})` : ''}
                              </IonLabel>
                            </Port>
                          );
                        })
                      }
                    />
                  </IonGrid>
                </IonCardContent>
              </IonCardEqualHeight>
            </IonCol>

            {status ? (
              <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
                <IonCardEqualHeight>
                  <IonCardHeader>
                    <IonCardTitle>Status</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <IonGrid>
                      <Row obj={status} objKey="state" title="State" value={(state) => containerState(state)} />
                      <Row
                        obj={status}
                        objKey="lastState"
                        title="Last State"
                        value={(lastState) => containerState(lastState)}
                      />
                      <Row
                        obj={status}
                        objKey="ready"
                        title="Ready"
                        value={(ready) => (ready ? '1' : '0')}
                        defaultValue="false"
                      />
                      <Row obj={status} objKey="restartCount" title="Restart Count" />
                    </IonGrid>
                  </IonCardContent>
                </IonCardEqualHeight>
              </IonCol>
            ) : null}
          </IonRow>

          <IonRow>
            {container.env ? (
              <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
                <IonCardEqualHeight>
                  <IonCardHeader>
                    <IonCardTitle>Environment Variables</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <IonGrid>
                      {container.env.map((env, index) => (
                        <IonRow key={index}>
                          <IonCol size="auto">
                            <b>{env.name}:</b>
                          </IonCol>
                          {env.value ? <IonCol>{env.value}</IonCol> : null}
                          {env.valueFrom ? <IonCol>Source: {envValueFrom(env.valueFrom)}</IonCol> : null}
                        </IonRow>
                      ))}
                    </IonGrid>
                  </IonCardContent>
                </IonCardEqualHeight>
              </IonCol>
            ) : null}

            {container.volumeMounts ? (
              <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
                <IonCardEqualHeight>
                  <IonCardHeader>
                    <IonCardTitle>Volume Mounts</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <IonGrid>
                      {container.volumeMounts.map((volume, index) => (
                        <IonRow key={index}>
                          <IonCol size="auto">
                            <b>{volume.name}:</b>
                          </IonCol>
                          <IonCol>
                            {volume.mountPath} {volume.readOnly ? '(ro)' : ''}
                          </IonCol>
                        </IonRow>
                      ))}
                    </IonGrid>
                  </IonCardContent>
                </IonCardEqualHeight>
              </IonCol>
            ) : null}
          </IonRow>

          <IonRow>
            {container.livenessProbe ? (
              <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
                <IonCardEqualHeight>
                  <IonCardHeader>
                    <IonCardTitle>Liveness Probe</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <Editor readOnly={true} value={yaml.safeDump(container.livenessProbe)} />
                  </IonCardContent>
                </IonCardEqualHeight>
              </IonCol>
            ) : null}

            {container.readinessProbe ? (
              <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
                <IonCardEqualHeight>
                  <IonCardHeader>
                    <IonCardTitle>Readiness Probe</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <Editor readOnly={true} value={yaml.safeDump(container.readinessProbe)} />
                  </IonCardContent>
                </IonCardEqualHeight>
              </IonCol>
            ) : null}

            {container.startupProbe ? (
              <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
                <IonCardEqualHeight>
                  <IonCardHeader>
                    <IonCardTitle>Startup Probe</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <Editor readOnly={true} value={yaml.safeDump(container.startupProbe)} />
                  </IonCardContent>
                </IonCardEqualHeight>
              </IonCol>
            ) : null}
          </IonRow>
        </IonGrid>
      </IonContent>
    </IonModal>
  );
};

export default Container;
