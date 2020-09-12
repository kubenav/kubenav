import { IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonList, isPlatform } from '@ionic/react';
import { V1Container, V1ContainerStatus } from '@kubernetes/client-node';
import React from 'react';

import { IContainerMetrics } from '../../../../declarations';
import useWindowWidth from '../../../../utils/useWindowWidth';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import Container from './Container';

interface IContainersProps {
  containers: V1Container[];
  logs?: boolean;
  terminal?: boolean;
  metrics?: IContainerMetrics[];
  name?: string;
  namespace?: string;
  statuses?: V1ContainerStatus[];
  title: string;
}

const Containers: React.FunctionComponent<IContainersProps> = ({
  containers,
  logs,
  terminal,
  metrics,
  name,
  namespace,
  statuses,
  title,
}: IContainersProps) => {
  const width = useWindowWidth();

  const getContainerStatus = (name: string, containerStatuses: V1ContainerStatus[]): V1ContainerStatus | undefined => {
    if (containerStatuses.filter((containerStatus) => containerStatus.name === name).length === 1) {
      return containerStatuses.filter((containerStatus) => containerStatus.name === name)[0];
    }

    return undefined;
  };

  const getContainerMetrics = (name: string, containerMetrics: IContainerMetrics[]): IContainerMetrics | undefined => {
    if (containerMetrics.filter((containerMetric) => containerMetric.name === name).length === 1) {
      return containerMetrics.filter((containerMetric) => containerMetric.name === name)[0];
    }

    return undefined;
  };

  return (
    <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>{title}</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          {isPlatform('hybrid') || width < 992 ? (
            <IonList>
              {containers.map((container, index) => (
                <Container
                  key={index}
                  mobile={true}
                  container={container}
                  logs={logs}
                  terminal={terminal}
                  metrics={metrics ? getContainerMetrics(container.name, metrics) : undefined}
                  name={name}
                  namespace={namespace}
                  status={statuses ? getContainerStatus(container.name, statuses) : undefined}
                />
              ))}
            </IonList>
          ) : (
            <div className="table">
              <table>
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Ready</th>
                    <th>Restarts</th>
                    <th>State</th>
                    <th className="center" colSpan={3}>
                      CPU
                    </th>
                    <th className="center" colSpan={3}>
                      Memory
                    </th>
                    <th className="center">Logs</th>
                    <th className="center">Term</th>
                  </tr>
                </thead>
                <tbody>
                  {containers.map((container, index) => (
                    <Container
                      key={index}
                      mobile={false}
                      container={container}
                      logs={logs}
                      terminal={terminal}
                      metrics={metrics ? getContainerMetrics(container.name, metrics) : undefined}
                      name={name}
                      namespace={namespace}
                      status={statuses ? getContainerStatus(container.name, statuses) : undefined}
                    />
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  );
};

export default Containers;
