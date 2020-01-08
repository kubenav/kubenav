import {
  IonLabel,
  IonListHeader,
  IonMenuToggle,
} from '@ionic/react';
import React from 'react';

import { AppPages } from '../../declarations';
import SectionItem from './SectionItem';

interface ISectionProps {
  pages: AppPages;
  title: string;
  sectionKey: string;
  isMenu: boolean;
}

const Section: React.FunctionComponent<ISectionProps> = ({ pages, title, sectionKey, isMenu }) => {
  return (
    <React.Fragment>
      <IonListHeader>
        <IonLabel>{title}</IonLabel>
      </IonListHeader>
      {Object.keys(pages).map(pageKey =>
        isMenu ? (
          <IonMenuToggle key={pageKey} autoHide={false}>
            <SectionItem pages={pages} sectionKey={sectionKey} pageKey={pageKey} />
          </IonMenuToggle>
        ) : <SectionItem key={pageKey} pages={pages} sectionKey={sectionKey} pageKey={pageKey} />
      )}
    </React.Fragment>
  )
};

export default Section;
