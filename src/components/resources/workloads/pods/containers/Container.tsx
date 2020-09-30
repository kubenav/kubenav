import { IonIcon, IonItem, IonItemOptions, IonItemSliding, IonLabel } from '@ionic/react';
import { V1Container, V1ContainerStatus } from '@kubernetes/client-node';
import { checkmark, close } from 'ionicons/icons';
import React, { useRef, useState } from 'react';

import { IContainerMetrics } from '../../../../../declarations';
import { formatResourceValue } from '../../../../../utils/helpers';
import AddLogs from './AddLogs';
import AddShell from './AddShell';
import Details from './Details';

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
  mobile: boolean;
  container: V1Container;
  logs?: boolean;
  terminal?: boolean;
  metrics?: IContainerMetrics;
  name?: string;
  namespace?: string;
  status?: V1ContainerStatus;
}

const Container: React.FunctionComponent<IContainerProps> = ({
  mobile,
  container,
  logs,
  terminal,
  metrics,
  name,
  namespace,
  status,
}: IContainerProps) => {
  const itemSlidingRef = useRef<HTMLIonItemSlidingElement>(null);
  const [showDetailsModal, setShowDetailsModal] = useState(false);

  const closeItemSliding = () => {
    if (itemSlidingRef && itemSlidingRef.current) {
      itemSlidingRef.current.close();
    }
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
      {!mobile ? (
        <tr>
          <td>
            <span className="container-details-link" onClick={() => setShowDetailsModal(true)}>
              {container.name}
            </span>
          </td>
          <td>
            {status && status.ready ? (
              <IonIcon icon={checkmark} color="success" />
            ) : (
              <IonIcon icon={close} color="danger" />
            )}
          </td>
          <td>{status && status.restartCount ? status.restartCount : 0}</td>
          <td>{status ? getState(status) : ''}</td>
          <td className="center">
            <div className="tooltip">
              {metrics && metrics.usage && metrics.usage.hasOwnProperty('cpu')
                ? formatResourceValue('cpu', metrics.usage['cpu'])
                : '-'}
              <span className="tooltiptext">CPU Usage</span>
            </div>
          </td>
          <td className="center">
            <div className="tooltip">
              {container.resources && container.resources.requests && container.resources.requests.hasOwnProperty('cpu')
                ? formatResourceValue('cpu', container.resources.requests['cpu'])
                : '-'}
              <span className="tooltiptext">CPU Request</span>
            </div>
          </td>
          <td className="center">
            <div className="tooltip">
              {container.resources && container.resources.limits && container.resources.limits.hasOwnProperty('cpu')
                ? formatResourceValue('cpu', container.resources.limits['cpu'])
                : '-'}
              <span className="tooltiptext">CPU Limit</span>
            </div>
          </td>
          <td className="center">
            <div className="tooltip">
              {metrics && metrics.usage && metrics.usage.hasOwnProperty('memory')
                ? formatResourceValue('memory', metrics.usage['memory'])
                : '-'}
              <span className="tooltiptext">Memory Usage</span>
            </div>
          </td>
          <td className="center">
            <div className="tooltip">
              {container.resources &&
              container.resources.requests &&
              container.resources.requests.hasOwnProperty('memory')
                ? formatResourceValue('memory', container.resources.requests['memory'])
                : '-'}
              <span className="tooltiptext">Memory Request</span>
            </div>
          </td>
          <td className="center">
            <div className="tooltip">
              {container.resources && container.resources.limits && container.resources.limits.hasOwnProperty('memory')
                ? formatResourceValue('memory', container.resources.limits['memory'])
                : '-'}
              <span className="tooltiptext">Memory Limit</span>
            </div>
          </td>
          <td className="center">
            {logs && name && namespace ? (
              <AddLogs activator="button" namespace={namespace} pod={name} container={container.name} />
            ) : null}
          </td>
          <td className="center">
            {terminal && name && namespace ? (
              <AddShell activator="button" namespace={namespace} pod={name} container={container.name} />
            ) : null}
          </td>
        </tr>
      ) : (
        <IonItemSliding ref={itemSlidingRef}>
          <IonItem button={true} onClick={() => setShowDetailsModal(true)}>
            <IonLabel>
              <h2>{container.name}</h2>
              <p>
                {status
                  ? `Ready: ${status.ready ? '1' : '0'} | Restarts: ${
                      status.restartCount ? status.restartCount : 0
                    } | State: ${getState(status)}`
                  : ''}
                <br />
                CPU:{' '}
                {metrics && metrics.usage && metrics.usage.hasOwnProperty('cpu')
                  ? formatResourceValue('cpu', metrics.usage['cpu'])
                  : '-'}{' '}
                (
                {container.resources &&
                container.resources.requests &&
                container.resources.requests.hasOwnProperty('cpu')
                  ? formatResourceValue('cpu', container.resources.requests['cpu'])
                  : '-'}
                /
                {container.resources && container.resources.limits && container.resources.limits.hasOwnProperty('cpu')
                  ? formatResourceValue('cpu', container.resources.limits['cpu'])
                  : '-'}
                )
                <br />
                Memory:{' '}
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
                {container.resources &&
                container.resources.limits &&
                container.resources.limits.hasOwnProperty('memory')
                  ? formatResourceValue('memory', container.resources.limits['memory'])
                  : '-'}
                )
              </p>
            </IonLabel>
          </IonItem>

          {name && namespace ? (
            <IonItemOptions side="end">
              {logs ? (
                <AddLogs
                  activator="item-option"
                  namespace={namespace}
                  pod={name}
                  container={container.name}
                  closeItemSliding={closeItemSliding}
                />
              ) : null}
              {terminal ? (
                <AddShell
                  activator="item-option"
                  namespace={namespace}
                  pod={name}
                  container={container.name}
                  closeItemSliding={closeItemSliding}
                />
              ) : null}
            </IonItemOptions>
          ) : null}
        </IonItemSliding>
      )}

      <Details
        name={name}
        namespace={namespace}
        container={container}
        status={status}
        showModal={showDetailsModal}
        setShowModal={setShowDetailsModal}
      />
    </React.Fragment>
  );
};

export default Container;
