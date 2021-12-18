import { App } from '@capacitor/app';
import {
  IonAvatar,
  IonButtons,
  IonCard,
  IonCardContent,
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
  isPlatform,
} from '@ionic/react';
import React, { memo, useEffect, useState } from 'react';

import { VERSION } from '../../utils/constants';
import { openURL } from '../../utils/helpers';
import useWindowWidth from '../../utils/useWindowWidth';
import License from './info/License';

const InfoPage: React.FunctionComponent = () => {
  const width = useWindowWidth();
  const [version, setVersion] = useState<string>(VERSION ? VERSION : '');

  useEffect(() => {
    const getInfo = async () => {
      const info = await App.getInfo();
      if (info && info.version) {
        setVersion(version);
      }
    };

    if (isPlatform('hybrid')) {
      getInfo();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

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
          {isPlatform('hybrid') || isPlatform('mobile') || width < 992 ? (
            <img alt="kubenav" src="/assets/card-header.png" />
          ) : null}
          <IonCardContent>
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
              <IonItem onClick={() => openURL('https://kubenav.io')} button={true}>
                <IonAvatar slot="start">
                  <img alt="Website" src="/assets/icons/misc/browser.png" />
                </IonAvatar>
                <IonLabel>Website</IonLabel>
              </IonItem>
              <IonItem onClick={() => openURL('https://docs.kubenav.io')} button={true}>
                <IonAvatar slot="start">
                  <img alt="Documentation" src="/assets/icons/misc/documentation.png" />
                </IonAvatar>
                <IonLabel>Documentation</IonLabel>
              </IonItem>
              <IonItem onClick={() => openURL('https://github.com/kubenav/kubenav')} button={true}>
                <IonAvatar slot="start">
                  <img alt="GitHub" src="/assets/icons/misc/github.png" />
                </IonAvatar>
                <IonLabel>GitHub</IonLabel>
              </IonItem>
              <IonItem onClick={() => openURL('https://twitter.com/kubenav')} button={true}>
                <IonAvatar slot="start">
                  <img alt="Twitter" src="/assets/icons/misc/twitter.png" />
                </IonAvatar>
                <IonLabel>Twitter</IonLabel>
              </IonItem>

              {!isPlatform('ios') ? (
                <React.Fragment>
                  <IonListHeader mode="md">
                    <IonLabel>Donation</IonLabel>
                  </IonListHeader>
                  <IonItem onClick={() => openURL('https://github.com/sponsors/ricoberger')} button={true}>
                    <IonAvatar slot="start">
                      <img alt="GitHub Sponsors" src="/assets/icons/misc/github.png" />
                    </IonAvatar>
                    <IonLabel>GitHub Sponsors</IonLabel>
                  </IonItem>
                  <IonItem onClick={() => openURL('https://www.paypal.me/ricoberger')} button={true}>
                    <IonAvatar slot="start">
                      <img alt="PayPal" src="/assets/icons/misc/paypal.png" />
                    </IonAvatar>
                    <IonLabel>PayPal</IonLabel>
                  </IonItem>
                </React.Fragment>
              ) : null}
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
