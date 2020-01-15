import {
  IonIcon,
  IonItem,
  IonItemOption,
  IonItemOptions,
  IonItemSliding,
  IonLabel,
} from '@ionic/react';
import { radioButtonOff, radioButtonOn, trash } from 'ionicons/icons';
import React, {useContext, useEffect, useState} from 'react';

import { AppContext } from '../../context';
import { ICluster, IContext} from '../../declarations';
import EditCluster from './EditCluster';

interface IClusterProps {
  cluster: ICluster;
}

const Cluster: React.FunctionComponent<IClusterProps> = ({ cluster }) => {
  const context = useContext<IContext>(AppContext);

  const [status, setStatus] = useState<boolean>(false);

  useEffect(() => {
    (async() => {
      try {
        await context.request('GET', '/api/v1', '', cluster);
        setStatus(true);
      } catch (err) {
        setStatus(false);
      }
    })();

    return () => {};
  }, []); /* eslint-disable-line */

  return (
    <IonItemSliding>
      <IonItem onClick={() => context.changeCluster(cluster.id)}>
        <IonIcon slot="end" color={status ? 'success' : 'danger'} icon={context.cluster && cluster.id === context.cluster ? radioButtonOn : radioButtonOff} />
        <IonLabel>{cluster.name}</IonLabel>
      </IonItem>
      <IonItemOptions side="end">
        <EditCluster cluster={cluster} />
        <IonItemOption color="danger" onClick={() => context.deleteCluster(cluster.id)}>
          <IonIcon slot="start" icon={trash} />
          Delete
        </IonItemOption>
      </IonItemOptions>
    </IonItemSliding>
  );
};

export default Cluster;
