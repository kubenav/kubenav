import {
  IonButtons,
  IonContent,
  IonHeader,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import React, { useContext } from 'react';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import AddCluster from './clusters/AddCluster';
import ClusterItem from './clusters/ClusterItem';

const ClustersPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Clusters</IonTitle>
          {isPlatform('hybrid') ? <AddCluster /> : null}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {context.clusters
          ? Object.keys(context.clusters).map((key) => {
              return context.clusters ? <ClusterItem key={key} cluster={context.clusters[key]} /> : null;
            })
          : null}
      </IonContent>
    </IonPage>
  );
};

export default ClustersPage;
