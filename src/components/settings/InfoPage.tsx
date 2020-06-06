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
  IonList,
  IonListHeader,
  IonMenuButton,
  IonNote,
  IonPage,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { useGetInfo } from '@ionic/react-hooks/device';
import React, { memo, useEffect, useState } from 'react';

import { VERSION } from '../../utils/constants';
import License from './info/License';

const InfoPage: React.FunctionComponent = () => {
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
              kubenav is a mobile and desktop app to manage Kubernetes clusters. The app provides an overview of all
              resources in a Kubernetes clusters, including current status information for workloads. The details view
              for resources provides additional information. It is possible to view logs and events or to get a shell
              into a container. You can also edit and delete resources or scale your workloads within the app.
            </p>
            <p className="paragraph-margin-bottom">
              The app is developed using Ionic Framework and Capacitor. The frontend part of the app is implemented
              using TypeScript and React functional components. The backend part uses Go mobile for communication with
              the Kubernetes API server and Cloud Providers. So it is possible to achieve nearly 100% code sharing
              between the mobile and desktop implementation of kubenav.
            </p>
            <IonList>
              <IonListHeader mode="md">
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

              <IonListHeader mode="md">
                <IonLabel>Links</IonLabel>
              </IonListHeader>
              <IonItem href="https://kubenav.io" target="_blank" rel="noopener noreferrer">
                <IonAvatar slot="start">
                  <img alt="Website" src="/assets/icons/misc/browser.png" />
                </IonAvatar>
                <IonLabel>Website</IonLabel>
              </IonItem>
              <IonItem href="https://github.com/kubenav/kubenav" target="_blank" rel="noopener noreferrer">
                <IonAvatar slot="start">
                  <img alt="GitHub" src="/assets/icons/misc/github.png" />
                </IonAvatar>
                <IonLabel>GitHub</IonLabel>
              </IonItem>
              <IonItem href="https://twitter.com/kubenav" target="_blank" rel="noopener noreferrer">
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

export default memo(InfoPage, (): boolean => {
  return true;
});
