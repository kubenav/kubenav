import {
  IonButtons,
  IonContent,
  IonHeader,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToolbar
} from '@ionic/react';
import React, { useContext } from 'react';

import { AppContext } from '../context';
import { Context } from '../declarations';
import AddCluster from '../components/settings/AddCluster';
import Cluster from '../components/settings/Cluster';

const Clusters: React.FunctionComponent = () => {
  const context = useContext<Context>(AppContext);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Clusters</IonTitle>
          <AddCluster />
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {Object.keys(context.clusters).map(key => {
          return (
            <Cluster key={key} cluster={context.clusters[key]} />
          )
        })}
      </IonContent>
    </IonPage>
  );
};

export default Clusters;
