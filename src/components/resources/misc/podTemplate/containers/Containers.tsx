import {
  IonCardContent,
  IonCardHeader, IonCardTitle,
  IonCol,
  IonList,
} from '@ionic/react';
import { V1Container, V1ContainerStatus } from '@kubernetes/client-node'
import React from 'react';

import { IContainerMetrics } from '../../../../../declarations';
import IonCardEqualHeight from '../../../../misc/IonCardEqualHeight';
import Container from './Container';

interface IContainersProps {
  containers: V1Container[];
  logs?: boolean;
  metrics?: IContainerMetrics[];
  name?: string;
  namespace?: string;
  statuses?: V1ContainerStatus[];
  title: string;
}

const Containers: React.FunctionComponent<IContainersProps> = ({
  containers,
  logs,
  metrics,
  name,
  namespace,
  statuses,
  title
}) => {
  const getContainerStatus = (name: string, containerStatuses: V1ContainerStatus[]): V1ContainerStatus|undefined => {
    if (containerStatuses.filter((containerStatus) => containerStatus.name === name).length === 1) {
      return containerStatuses.filter((containerStatus) => containerStatus.name === name)[0];
    }

    return undefined
  };

  const getContainerMetrics = (name: string, containerMetrics: IContainerMetrics[]): IContainerMetrics|undefined => {
    if (containerMetrics.filter((containerMetric) => containerMetric.name === name).length === 1) {
      return containerMetrics.filter((containerMetric) => containerMetric.name === name)[0];
    }

    return undefined
  };

  return (
    <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>{title}</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          <IonList>
            {containers.map((container, index) => (
              <Container
                key={index}
                container={container}
                logs={logs}
                metrics={metrics ? getContainerMetrics(container.name, metrics) : undefined}
                name={name}
                namespace={namespace}
                status={statuses ? getContainerStatus(container.name, statuses) : undefined}
              />
            ))}
          </IonList>
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  )
};

export default Containers;
