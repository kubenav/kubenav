import {
  IonButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardSubtitle,
  IonCardTitle,
  IonContent,
  IonHeader,
  IonList,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToolbar
} from '@ionic/react';
import React, {useContext} from 'react';

import { IContext } from '../declarations';
import { AppContext } from '../utils/context';
import { resources } from '../utils/resources';
import Sections from './menu/Sections';

const HomePage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Home</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonList>
          {context.clusters && context.cluster ? (
            <IonCard>
              <img alt="kubenav" src="/assets/card-header.png" />
              <IonCardHeader>
                  <IonCardSubtitle>Welcome to kubenav</IonCardSubtitle>
                  <IonCardTitle>Explore your Kubernetes Clusters</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <p className="paragraph-margin-bottom">
                  Welcome back to the kubenav app. You are ready to explore your Kubernetes clusters. To get an overview
                  of your running Nodes, Deployments, Pods and Containers select the corresponding item from the menu or
                  from below.
                </p>
                <IonList>
                  <Sections sections={resources} isMenu={false} />
                </IonList>
              </IonCardContent>
            </IonCard>
          ) : (
            <IonCard>
              <img alt="kubenav" src="/assets/card-header.png" />
              <IonCardHeader>
                <IonCardSubtitle>Welcome to kubenav</IonCardSubtitle>
                <IonCardTitle>Introduction</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <p className="paragraph-margin-bottom">
                  Welcome to the kubenav app. After you added a cluster you can start the exploration of them within the
                  kubenav app. To add a new Kubernetes cluster to the app use the button <b>Add a Cluster</b> or the
                  <b>Clusters</b> item from the menu.
                </p>
                <IonButton
                  expand="block"
                  routerLink="/settings/clusters"
                  routerDirection="none"
                >
                  Add a Cluster
                </IonButton>
              </IonCardContent>
            </IonCard>
          )}
        </IonList>
      </IonContent>
    </IonPage>
  );
};

export default HomePage;
