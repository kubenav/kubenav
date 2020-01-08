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
} from '@ionic/react';
import React from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { AppSections } from '../../declarations';
import Sections from './Sections'

interface IMenuProps extends RouteComponentProps {
  sections: AppSections;
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

          <IonListHeader>
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
