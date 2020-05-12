import { Plugins } from '@capacitor/core';
import {
  IonAvatar,
  IonContent,
  IonHeader,
  IonItem,
  IonLabel,
  IonList,
  IonListHeader,
  IonMenu,
  IonMenuToggle,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import React from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { IAppSections } from '../../declarations';
import { CUSTOM_URI_SCHEME, GOOGLE_REDIRECT_URI, OIDC_REDIRECT_URL, SERVER } from '../../utils/constants';
import { saveCluster } from '../../utils/storage';
import Sections from './Sections'

const { App } = Plugins;

App.addListener('appUrlOpen', (data) => {
  if (data.url.startsWith(GOOGLE_REDIRECT_URI)) {
    window.location.replace(data.url.replace(`${CUSTOM_URI_SCHEME}:`, ''));
  } else if (data.url.startsWith(OIDC_REDIRECT_URL)) {
    window.location.replace(data.url.replace(`${CUSTOM_URI_SCHEME}:`, ''));
  }
});

if (isPlatform('electron')) {
  let eventSource = new EventSource(`${SERVER}/api/electron`);

  eventSource.addEventListener('navigation', (event) => {
    const msg = event as MessageEvent;
    window.location.href = msg.data;
  });

  eventSource.addEventListener('cluster', (event) => {
    const msg = event as MessageEvent;
    saveCluster(msg.data);
    window.location.href = '/';
  });
}

interface IMenuProps extends RouteComponentProps {
  sections: IAppSections;
}

const Menu: React.FunctionComponent<IMenuProps> = ({ sections }) => {
  return (
    <IonMenu contentId="main" type="overlay">
      <IonHeader>
        <IonToolbar>
          <IonTitle>Menu</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonList>
          <Sections sections={sections} isMenu={true} />

          <IonListHeader mode="md">
            <IonLabel>Settings</IonLabel>
          </IonListHeader>
          <IonMenuToggle autoHide={false}>
            <IonItem routerLink="/settings/clusters" routerDirection="root">
              <IonAvatar slot="start">
                <img alt="Clusters" src="/assets/icons/kubernetes/kubernetes.png" />
              </IonAvatar>
              <IonLabel>Clusters</IonLabel>
            </IonItem>
          </IonMenuToggle>
          <IonMenuToggle autoHide={false}>
            <IonItem routerLink="/settings/general" routerDirection="root">
              <IonAvatar slot="start">
                <img alt="Info" src="/assets/icons/misc/general.png" />
              </IonAvatar>
              <IonLabel>General</IonLabel>
            </IonItem>
          </IonMenuToggle>
          <IonMenuToggle autoHide={false}>
            <IonItem routerLink="/settings/info" routerDirection="root">
              <IonAvatar slot="start">
                <img alt="Info" src="/assets/icons/misc/info.png" />
              </IonAvatar>
              <IonLabel>Info</IonLabel>
            </IonItem>
          </IonMenuToggle>
        </IonList>
      </IonContent>
    </IonMenu>
  )
};

export default withRouter(Menu);
