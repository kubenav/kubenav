import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import ItemStatus from '../../misc/template/ItemStatus';

interface IPodItemProps extends RouteComponentProps {
  item: V1Pod;
  section: string;
  type: string;
}

const PodItem: React.FunctionComponent<IPodItemProps> = ({ item, section, type }) => {
  const getPodStatus = (pod: V1Pod): string => {
    if (pod.status && pod.status.phase === 'Failed') {
      return 'danger';
    }

    if (pod.status && pod.status.phase === 'Pending') {
      return 'warning';
    }

    if (pod.status && pod.status.initContainerStatuses) {
      for (let container of pod.status.initContainerStatuses) {
        if (
          container.state
          && (container.state.waiting || (container.state.terminated && container.state.terminated.exitCode !== 0))
        ) {
          return 'danger';
        }
      }
    }

    if (pod.status && pod.status.containerStatuses) {
      for (let container of pod.status.containerStatuses) {
        if (
          container.state
          && (container.state.waiting || (container.state.terminated && container.state.terminated.exitCode !== 0))
        ) {
          return 'danger';
        }
      }

      return 'success';
    }

    return '';
  };

  let status = getPodStatus(item);

  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <ItemStatus status={status} />
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}</p>
      </IonLabel>
    </IonItem>
  )
};

export default PodItem;
