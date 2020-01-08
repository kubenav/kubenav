import {
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonContent,
  IonGrid,
  IonHeader,
  IonIcon,
  IonItem, IonItemOptions, IonItemSliding,
  IonLabel,
  IonModal,
  IonRow,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { V1Container, V1ContainerPort, V1ContainerState, V1ContainerStatus, V1EnvVarSource } from '@kubernetes/client-node'
import { close } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, {useState} from 'react';

import { ContainerMetrics } from '../../declarations';
import { formatResourceValue } from '../../utils';
import Editor from '../misc/Editor';
import Logs from './Logs';
import Row from './Row';

interface ContainerProps {
  container: V1Container;
  logs?: boolean;
  metrics?: ContainerMetrics;
  name?: string;
  namespace?: string;
  status?: V1ContainerStatus;
}

const Container: React.FunctionComponent<ContainerProps> = ({ container, logs, metrics, name, namespace, status }) => {
  const [showModal, setShowModal] = useState(false);

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
      return source.configMapKeyRef.name ? `${source.configMapKeyRef.key} (${source.configMapKeyRef.name})` : source.configMapKeyRef.key;
    } else if (source.fieldRef) {
      return source.fieldRef.fieldPath;
    } else if (source.resourceFieldRef) {
      return source.resourceFieldRef.resource;
    } else if (source.secretKeyRef) {
      return source.secretKeyRef.name ? `${source.secretKeyRef.key} (${source.secretKeyRef.name})` : source.secretKeyRef.key;
    }

    return '';
  };

  let resources: string[] = [];

  if (container.resources) {
    if (container.resources.limits) {
      resources.push(...Object.keys(container.resources.limits));
    }

    if (container.resources.requests) {
      resources.push(...Object.keys(container.resources.requests));
    }

    if (metrics && metrics.usage) {
      resources.push(...Object.keys(metrics.usage));
    }

    resources = Array.from(new Set(resources));
  }

  return (
    <React.Fragment>
      <IonItemSliding>
        <IonItem onClick={() => setShowModal(true)}>
          <IonLabel>
            <h2>{container.name}</h2>
          </IonLabel>
        </IonItem>

        {logs && name && namespace ? (
          <IonItemOptions side="end">
            <Logs name={name} namespace={namespace} container={container.name} />
          </IonItemOptions>
        ) : null}
      </IonItemSliding>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start" onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
            </IonButtons>
            <IonTitle>{container.name}</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <IonGrid>
            <IonRow>
              <IonCol>
                <IonCard>
                  <IonCardHeader>
                    <IonCardTitle>Configuration</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <IonGrid>
                      <Row obj={container} objKey="name" title="Name" />
                      <Row obj={container} objKey="image" title="Image" />
                      <Row obj={container} objKey="imagePullPolicy" title="Image Pull Policy" />
                      <Row obj={container} objKey="workingDir" title="Working Dir" />
                      <Row obj={container} objKey="command" title="Command" value={(command) => JSON.stringify(command)} />
                      <Row obj={container} objKey="args" title="Args" value={(args) => <ul className="no-margin-list">{args.map((arg, index) => <li key={index}>{arg}</li>)}</ul>} />
                      <Row obj={container} objKey="ports" title="Ports" value={(ports) => <ul className="no-margin-list">{ports.map((port: V1ContainerPort, index) => <li key={index}>{port.containerPort} {port.name ? `(${port.name})` : ''}</li>)}</ul>} />
                    </IonGrid>
                  </IonCardContent>
                </IonCard>
              </IonCol>
            </IonRow>

            {status ? (
              <IonRow>
                <IonCol>
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Status</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <IonGrid>
                        <Row obj={status} objKey="state" title="State" value={(state) => containerState(state)} />
                        <Row obj={status} objKey="lastState" title="Last State" value={(lastState) => containerState(lastState)} />
                        <Row obj={status} objKey="ready" title="Ready" value={(ready) => ready ? 'true' : 'false'} defaultValue="false" />
                        <Row obj={status} objKey="restartCount" title="Restart Count" />
                      </IonGrid>
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ) : null}

            {container.env ? (
              <IonRow>
                <IonCol>
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Environment Variables</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <IonGrid>
                        {container.env.map((env, index) => (
                          <IonRow key={index}>
                            <IonCol size="auto"><b>{env.name}:</b></IonCol>
                            {env.value ? <IonCol>{env.value}</IonCol> : null}
                            {env.valueFrom ? <IonCol>Source: {envValueFrom(env.valueFrom)}</IonCol> : null}
                          </IonRow>
                        ))}
                      </IonGrid>
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ) : null}

            {container.volumeMounts ? (
              <IonRow>
                <IonCol>
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Volume Mounts</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <IonGrid>
                        {container.volumeMounts.map((volume, index) => (
                          <IonRow key={index}>
                            <IonCol size="auto"><b>{volume.name}:</b></IonCol>
                            <IonCol>{volume.mountPath} {volume.readOnly ? '(ro)' : ''}</IonCol>
                          </IonRow>
                        ))}
                      </IonGrid>
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ) : null}

            {resources.length > 0 ? (
              <IonRow>
                <IonCol>
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Resources</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <div className="table">
                        <table>
                          <thead>
                            <tr>
                              <th />
                              <th>Requests</th>
                              <th>Limits</th>
                              <th>Usage</th>
                            </tr>
                          </thead>
                          <tbody>
                            {resources.map((resource, index) => {
                              return (
                                <tr key={index}>
                                  <td>{resource}</td>
                                  <td>{container.resources && container.resources.requests ? formatResourceValue(resource, container.resources.requests[resource]) : null}</td>
                                  <td>{container.resources && container.resources.limits ? formatResourceValue(resource, container.resources.limits[resource]) : null}</td>
                                  <td>{metrics && metrics.usage ? formatResourceValue(resource, metrics.usage[resource]) : null}</td>
                                </tr>
                              )
                            })}
                          </tbody>
                        </table>
                      </div>
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ) : null}

            {container.livenessProbe ? (
              <IonRow>
                <IonCol>
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Liveness Probe</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <Editor readOnly={true} value={yaml.safeDump(container.livenessProbe)} />
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ): null}

            {container.readinessProbe ? (
              <IonRow>
                <IonCol>
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Readiness Probe</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <Editor readOnly={true} value={yaml.safeDump(container.readinessProbe)} />
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ): null}

            {container.securityContext ? (
              <IonRow>
                <IonCol>
                  <IonCard>
                    <IonCardHeader>
                      <IonCardTitle>Security Context</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <Editor readOnly={true} value={yaml.safeDump(container.securityContext)} />
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ) : null}
          </IonGrid>
        </IonContent>
      </IonModal>
    </React.Fragment>
  )
};

export default Container;
