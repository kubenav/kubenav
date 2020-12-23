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
import React, { memo, useContext, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { IAppSections, IContext } from '../../declarations';
import {
  CUSTOM_URI_SCHEME,
  GOOGLE_REDIRECT_URI,
  INCLUSTER_URL,
  IS_INCLUSTER,
  OIDC_REDIRECT_URL,
} from '../../utils/constants';
import { AppContext } from '../../utils/context';
import Clusters from './Clusters';
import Sections from './Sections';

const { App } = Plugins;

App.addListener('appUrlOpen', (data) => {
  if (data.url.startsWith(GOOGLE_REDIRECT_URI)) {
    window.location.replace(data.url.replace(`${CUSTOM_URI_SCHEME}:`, ''));
  } else if (data.url.startsWith(OIDC_REDIRECT_URL)) {
    window.location.replace(data.url.replace(`${CUSTOM_URI_SCHEME}:`, ''));
  }
});

interface IMenuProps extends RouteComponentProps {
  sections: IAppSections;
}

const Menu: React.FunctionComponent<IMenuProps> = ({ sections, history, location }: IMenuProps) => {
  const context = useContext<IContext>(AppContext);
  const [eventSourceInitialized, setEventSourceInitialized] = useState<boolean>(false);

  if (isPlatform('electron') && !eventSourceInitialized) {
    setEventSourceInitialized(true);

    const eventSource = new EventSource(`${INCLUSTER_URL}/api/electron`);

    eventSource.addEventListener('navigation', async (event) => {
      const msg = event as MessageEvent;
      history.push(msg.data);
    });

    eventSource.addEventListener('cluster', async (event) => {
      const path = location.pathname;
      const msg = event as MessageEvent;

      // This must be the same as the changeCluster function in the Clusters.tsx file.
      await context.changeCluster(msg.data);

      if (path.startsWith('/resources')) {
        const parts = path.split('/');
        if (parts.length > 4) {
          history.push(parts.slice(0, 4).join('/'));
        }
      } else if (path.startsWith('/customresources')) {
        const parts = path.split('/');
        if (parts.length > 5) {
          history.push(parts.slice(0, 5).join('/'));
        }
      }
    });
  }

  return (
    <IonMenu contentId="main" type="overlay">
      <IonHeader>
        <IonToolbar>
          <IonTitle>Menu</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        <IonList>
          {context.clusters && Object.keys(context.clusters).length <= 1 ? null : <Clusters />}
          <IonMenuToggle autoHide={false}>
            <IonItem routerLink="/" routerDirection="root">
              <IonAvatar slot="start">
                <img alt="Overview" src="/assets/icons/kubernetes/kubernetes.png" />
              </IonAvatar>
              <IonLabel>Overview</IonLabel>
            </IonItem>
          </IonMenuToggle>
          <IonMenuToggle autoHide={false}>
            <IonItem routerLink="/bookmarks" routerDirection="root">
              <IonAvatar slot="start">
                <img alt="Bookmarks" src="/assets/icons/misc/bookmarks.png" />
              </IonAvatar>
              <IonLabel>Bookmarks</IonLabel>
            </IonItem>
          </IonMenuToggle>

          <Sections sections={sections} isMenu={true} />

          <IonListHeader mode="md">
            <IonLabel>Plugins</IonLabel>
          </IonListHeader>
          <IonMenuToggle autoHide={false}>
            <IonItem routerLink="/plugins/helm" routerDirection="root">
              <IonAvatar slot="start">
                <img alt="Helm" src="/assets/icons/kubernetes/helm.png" />
              </IonAvatar>
              <IonLabel>Helm</IonLabel>
            </IonItem>
          </IonMenuToggle>
          {context.settings.prometheusEnabled ? (
            <IonMenuToggle autoHide={false}>
              <IonItem routerLink="/plugins/prometheus" routerDirection="root">
                <IonAvatar slot="start">
                  <img alt="Prometheus" src="/assets/icons/kubernetes/prometheus.png" />
                </IonAvatar>
                <IonLabel>Prometheus</IonLabel>
              </IonItem>
            </IonMenuToggle>
          ) : null}
          {context.settings.elasticsearchEnabled ? (
            <IonMenuToggle autoHide={false}>
              <IonItem routerLink="/plugins/elasticsearch" routerDirection="root">
                <IonAvatar slot="start">
                  <img alt="Elasticsearch" src="/assets/icons/kubernetes/elasticsearch.png" />
                </IonAvatar>
                <IonLabel>Elasticsearch</IonLabel>
              </IonItem>
            </IonMenuToggle>
          ) : null}
          {context.settings.jaegerEnabled ? (
            <IonMenuToggle autoHide={false}>
              <IonItem routerLink="/plugins/jaeger" routerDirection="root">
                <IonAvatar slot="start">
                  <img alt="Jaeger" src="/assets/icons/kubernetes/jaeger.png" />
                </IonAvatar>
                <IonLabel>Jaeger</IonLabel>
              </IonItem>
            </IonMenuToggle>
          ) : null}

          <IonListHeader mode="md">
            <IonLabel>Settings</IonLabel>
          </IonListHeader>
          {IS_INCLUSTER && context.clusters && Object.keys(context.clusters).length <= 1 ? null : (
            <IonMenuToggle autoHide={false}>
              <IonItem routerLink="/settings/clusters" routerDirection="root">
                <IonAvatar slot="start">
                  <img alt="Clusters" src="/assets/icons/kubernetes/kubernetes.png" />
                </IonAvatar>
                <IonLabel>Clusters</IonLabel>
              </IonItem>
            </IonMenuToggle>
          )}
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
  );
};

export default withRouter(
  memo(Menu, (): boolean => {
    return true;
  }),
);
