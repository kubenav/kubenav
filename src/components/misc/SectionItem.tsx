import {
  IonAvatar,
  IonItem,
  IonLabel,
} from '@ionic/react';
import React from 'react';

import { AppPages } from '../../declarations';

interface SectionItemProps {
  pages: AppPages;
  sectionKey: string;
  pageKey: string;
}

const SectionItem: React.FunctionComponent<SectionItemProps> = ({ pages, sectionKey, pageKey }) => {
  return (
    <IonItem routerLink={`/kubernetes/${sectionKey}/${pageKey}`} routerDirection="root">
      <IonAvatar slot="start">
        <img alt={pages[pageKey].pluralText} src={pages[pageKey].icon} />
      </IonAvatar>
      <IonLabel>{pages[pageKey].pluralText}</IonLabel>
    </IonItem>
  )
};

export default SectionItem;
