import { IonIcon, IonItem, IonItemOption, IonItemOptions, IonItemSliding, IonLabel, isPlatform } from '@ionic/react';
import { radioButtonOff, radioButtonOn, trash } from 'ionicons/icons';
import React, { useContext, useEffect, useState } from 'react';

import { ICluster, IContext } from '../../../declarations';
import { AppContext } from '../../../utils/context';
import EditCluster from './EditCluster';

interface IClusterItemProps {
  cluster: ICluster;
}

const ClusterItem: React.FunctionComponent<IClusterItemProps> = ({ cluster }) => {
  const context = useContext<IContext>(AppContext);

  const [status, setStatus] = useState<boolean>(false);

  useEffect(() => {
    (async () => {
      try {
        const data = await context.request('GET', '', '', cluster);
        if (data && data.paths) {
          setStatus(true);
        } else {
          setStatus(false);
        }
      } catch (err) {
        setStatus(false);
      }
    })();

    return () => {};
  }, []); /* eslint-disable-line */

  return (
    <IonItemSliding>
      <IonItem button={true} onClick={() => context.changeCluster(cluster.id)}>
        <IonIcon
          slot="end"
          color={status ? 'success' : 'danger'}
          icon={context.cluster && cluster.id === context.cluster ? radioButtonOn : radioButtonOff}
        />
        <IonLabel>{cluster.name}</IonLabel>
      </IonItem>
      {isPlatform('hybrid') ? (
        <IonItemOptions side="end">
          <EditCluster cluster={cluster} />
          <IonItemOption color="danger" onClick={() => context.deleteCluster(cluster.id)}>
            <IonIcon slot="start" icon={trash} />
            Delete
          </IonItemOption>
        </IonItemOptions>
      ) : null}
    </IonItemSliding>
  );
};

export default ClusterItem;
