import {
  IonButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardSubtitle,
  IonCardTitle,
  IonContent,
  IonGrid,
  IonHeader,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import React, { memo, useContext } from 'react';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import Warnings from './Warnings';
import ClusterMetrics from './ClusterMetrics';

const OverviewPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Overview</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {context.clusters && context.cluster ? (
          <IonGrid>
            <ClusterMetrics />
            <Warnings />
          </IonGrid>
        ) : (
          <IonCard>
            <img alt="kubenav" src="/assets/card-header.png" />
            <IonCardHeader>
              <IonCardSubtitle>Welcome to kubenav</IonCardSubtitle>
              <IonCardTitle>Introduction</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <p className="paragraph-margin-bottom">
                Welcome to the kubenav app. Once you have added a cluster, you can start the exploration of them within
                the kubenav app. To add a new Kubernetes cluster to the app use the button <b>Add a Cluster</b> or the
                <b> Clusters</b> item from the menu.
              </p>
              <IonButton expand="block" routerLink="/settings/clusters" routerDirection="none">
                Add a Cluster
              </IonButton>
            </IonCardContent>
          </IonCard>
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(OverviewPage, (): boolean => {
  return true;
});
