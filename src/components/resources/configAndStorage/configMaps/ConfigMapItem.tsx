import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1ConfigMap } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

interface IConfigMapItemProps extends RouteComponentProps {
  item: V1ConfigMap;
  section: string;
  type: string;
}

const ConfigMapItem: React.FunctionComponent<IConfigMapItemProps> = ({ item, section, type }) => {
  // - Data: Number of data entries in the config map.
  // - Age: The time when the config map was created.
  return (
    <IonItem routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Data: {item.data ? Object.keys(item.data).length : 0}
          {item.metadata && item.metadata.creationTimestamp ? ` | Age: ${timeDifference(new Date().getTime(), new Date(item.metadata.creationTimestamp.toString()).getTime())}` : ''}
        </p>
      </IonLabel>
    </IonItem>
  )
};

export default ConfigMapItem;
