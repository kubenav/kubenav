import {
  IonButton,
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
  IonItem,
  IonItemOption,
  IonItemOptions,
  IonItemSliding,
  IonLabel,
  IonModal,
  IonRow,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import {
  V1Container,
  V1ContainerPort,
  V1ContainerState,
  V1ContainerStatus,
  V1EnvVarSource,
} from '@kubernetes/client-node';
import { close, list } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useState } from 'react';

import { IContainerMetrics } from '../../../../../declarations';
import { formatResourceValue } from '../../../../../utils/helpers';
import Editor from '../../../../misc/Editor';
import IonCardEqualHeight from '../../../../misc/IonCardEqualHeight';
import Row from '../../template/Row';
import Logs from './Logs';

// getState returns the current state of the given container. This is used for the list view for init containers and
// containers.
const getState = (containerStatus: V1ContainerStatus): string => {
  if (containerStatus.state && containerStatus.state.waiting) {
    return containerStatus.state.waiting.reason ? containerStatus.state.waiting.reason : '';
  }

  if (containerStatus.state && containerStatus.state.terminated) {
    return containerStatus.state.terminated.reason ? containerStatus.state.terminated.reason : '';
  }

  return 'Running';
};

interface IContainerProps {
  container: V1Container;
  logs?: boolean;
  metrics?: IContainerMetrics;
  name?: string;
  namespace?: string;
  status?: V1ContainerStatus;
}

const Container: React.FunctionComponent<IContainerProps> = ({ container, logs, metrics, name, namespace, status }) => {
  const [showModal, setShowModal] = useState(false);
  const [showLogs, setShowLogs] = useState(false);

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
        <IonItem button={true} onClick={() => setShowModal(true)}>
          <IonLabel>
            <h2>{container.name}</h2>
            <p>
              {status
                ? `Ready: ${status.ready ? '1' : '0'} | Restarts: ${
                    status.restartCount ? status.restartCount : 0
                  } | State: ${getState(status)}`
                : ''}
              <br />
              {/* tslint:disable-next-line:max-line-length */}
              CPU:{' '}
              {metrics && metrics.usage && metrics.usage.hasOwnProperty('cpu')
                ? formatResourceValue('cpu', metrics.usage['cpu'])
                : '-'}{' '}
              (
              {container.resources && container.resources.requests && container.resources.requests.hasOwnProperty('cpu')
                ? formatResourceValue('cpu', container.resources.requests['cpu'])
                : '-'}
              /
              {container.resources && container.resources.limits && container.resources.limits.hasOwnProperty('cpu')
                ? formatResourceValue('cpu', container.resources.limits['cpu'])
                : '-'}
              ) | Memory:{' '}
              {metrics && metrics.usage && metrics.usage.hasOwnProperty('memory')
                ? formatResourceValue('memory', metrics.usage['memory'])
                : '-'}{' '}
              (
              {container.resources &&
              container.resources.requests &&
              container.resources.requests.hasOwnProperty('memory')
                ? formatResourceValue('memory', container.resources.requests['memory'])
                : '-'}
              /
              {container.resources && container.resources.limits && container.resources.limits.hasOwnProperty('memory')
                ? formatResourceValue('memory', container.resources.limits['memory'])
                : '-'}
              )
            </p>
          </IonLabel>
          {!isPlatform('hybrid') && logs && name && namespace ? (
            <IonButton
              fill="outline"
              slot="end"
              onClick={(e) => {
                e.stopPropagation();
                setShowLogs(true);
              }}
            >
              <IonIcon slot="start" icon={list} />
              Logs
            </IonButton>
          ) : null}
        </IonItem>

        {isPlatform('hybrid') && logs && name && namespace ? (
          <IonItemOptions side="end">
            <IonItemOption color="primary" onClick={() => setShowLogs(true)}>
              <IonIcon slot="start" icon={list} />
              Logs
            </IonItemOption>
          </IonItemOptions>
        ) : null}
      </IonItemSliding>

      {container && name && namespace ? (
        <Logs
          showModal={showLogs}
          setShowModal={setShowLogs}
          name={name}
          namespace={namespace}
          container={container.name}
        />
      ) : null}

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
                        value={(ports) => (
                          <ul className="no-margin-list">
                            {ports.map((port: V1ContainerPort, index) => (
                              <li key={index}>
                                {port.containerPort} {port.name ? `(${port.name})` : ''}
                              </li>
                            ))}
                          </ul>
                        )}
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
                                  <td>
                                    {container.resources && container.resources.requests
                                      ? formatResourceValue(resource, container.resources.requests[resource])
                                      : null}
                                  </td>
                                  <td>
                                    {container.resources && container.resources.limits
                                      ? formatResourceValue(resource, container.resources.limits[resource])
                                      : null}
                                  </td>
                                  <td>
                                    {metrics && metrics.usage
                                      ? formatResourceValue(resource, metrics.usage[resource])
                                      : null}
                                  </td>
                                </tr>
                              );
                            })}
                          </tbody>
                        </table>
                      </div>
                    </IonCardContent>
                  </IonCard>
                </IonCol>
              </IonRow>
            ) : null}

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

              {container.securityContext ? (
                <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
                  <IonCardEqualHeight>
                    <IonCardHeader>
                      <IonCardTitle>Security Context</IonCardTitle>
                    </IonCardHeader>
                    <IonCardContent>
                      <Editor readOnly={true} value={yaml.safeDump(container.securityContext)} />
                    </IonCardContent>
                  </IonCardEqualHeight>
                </IonCol>
              ) : null}
            </IonRow>
          </IonGrid>
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default Container;
