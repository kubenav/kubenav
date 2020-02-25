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

import AddCluster from '../components/settings/AddCluster';
import Cluster from '../components/settings/Cluster';
import { IContext } from '../declarations';
import { AppContext } from '../utils/context';

const Clusters: React.FunctionComponent = () => {
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
        {context.clusters ? Object.keys(context.clusters).map(key => {
          return (
            <Cluster key={key} cluster={context.clusters![key]} />
          )
        }) : null}
      </IonContent>
    </IonPage>
  );
};

export default Clusters;
