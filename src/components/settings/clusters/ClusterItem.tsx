import { IonIcon, IonItem, IonItemOption, IonItemOptions, IonItemSliding, IonLabel, isPlatform } from '@ionic/react';
import { radioButtonOff, radioButtonOn, trash } from 'ionicons/icons';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { ICluster, IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import EditCluster from './EditCluster';

interface IClusterItemProps {
  cluster: ICluster;
}

const ClusterItem: React.FunctionComponent<IClusterItemProps> = ({ cluster }: IClusterItemProps) => {
  const context = useContext<IContext>(AppContext);

  const { data } = useQuery<boolean, Error>(
    ['ClusterItem', cluster],
    async () => {
      try {
        const data = await kubernetesRequest(
          'GET',
          '',
          '',
          context.settings,
          await context.kubernetesAuthWrapper(cluster.id),
        );
        if (data && data.paths) {
          return true;
        } else {
          return false;
        }
      } catch (err) {
        return false;
      }
    },
    context.settings.queryConfig,
  );

  const changeCluster = async (id: string) => {
    await context.changeCluster(id);
  };

  return (
    <IonItemSliding>
      <IonItem button={true} onClick={() => changeCluster(cluster.id)}>
        <IonIcon
          slot="end"
          color={data ? 'success' : 'danger'}
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
