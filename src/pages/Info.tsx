import {
  IonAvatar,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonContent,
  IonHeader,
  IonItem,
  IonLabel,
  IonList, IonListHeader,
  IonMenuButton,
  IonNote,
  IonPage,
  IonTitle,
  IonToolbar
} from '@ionic/react';
import { useGetInfo } from '@ionic/react-hooks/device';
import React, {useEffect, useState} from 'react';

import License from '../components/settings/License';

const VERSION = process.env.REACT_APP_VERSION;

const Info: React.FunctionComponent = () => {
  const { info } = useGetInfo();
  const [version, setVersion] = useState<string>(VERSION ? VERSION : '');

  useEffect(() => {
    if (info && info.appVersion) {
      setVersion(info.appVersion);
    }
  }, [info]);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Info</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonCard>
          <img alt="kubenav" src="/assets/card-header.png" />
          <IonCardHeader>
            <IonCardTitle>kubenav</IonCardTitle>
          </IonCardHeader>
          <IonCardContent>
            <p>
              kubenav is a mobile and desktop app to help you manage Kubernetes clusters. The app provides an overview of all your workloads and resources running in your clusters, including the current status. The details view of your workloads contains all the necessary logs and events to debug your clusters in case of problems. You can also edit and delete resources within the app.
            </p>
            <p className="paragraph-margin-bottom">
              The app is developed using Ionic Framework and Capacitor. The most parts of the app are implemented using React functional component and TypeScript. So we can achieve nearly 100% code sharing between the mobile and desktop implementation.
            </p>
            <IonList>
              <IonListHeader>
                <IonLabel>General</IonLabel>
              </IonListHeader>
              <IonItem>
                <IonAvatar slot="start">
                  <img alt="version" src="/assets/icons/misc/info.png" />
                </IonAvatar>
                <IonLabel>Version</IonLabel>
                <IonNote slot="end">{version}</IonNote>
              </IonItem>

              <License />

              <IonListHeader>
                <IonLabel>Links</IonLabel>
              </IonListHeader>
              <IonItem href="https://kubenav.io" target="_system">
                <IonAvatar slot="start">
                  <img alt="Website" src="/assets/icons/misc/browser.png" />
                </IonAvatar>
                <IonLabel>Website</IonLabel>
              </IonItem>
              <IonItem href="https://github.com/kubenav/kubenav" target="_system">
                <IonAvatar slot="start">
                  <img alt="GitHub" src="/assets/icons/misc/github.png" />
                </IonAvatar>
                <IonLabel>GitHub</IonLabel>
              </IonItem>
              <IonItem href="https://twitter.com/kubenav" target="_system">
                <IonAvatar slot="start">
                  <img alt="Twitter" src="/assets/icons/misc/twitter.png" />
                </IonAvatar>
                <IonLabel>Twitter</IonLabel>
              </IonItem>
            </IonList>
          </IonCardContent>
        </IonCard>
      </IonContent>
    </IonPage>
  );
};

export default Info;
