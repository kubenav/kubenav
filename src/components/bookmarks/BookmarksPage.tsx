import { IonButtons, IonContent, IonHeader, IonMenuButton, IonPage, IonTitle, IonToolbar } from '@ionic/react';
import React, { memo, useContext } from 'react';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import BookmarkItem from './BookmarkItem';

const BookmarksPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Bookmarks</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {context.bookmarks.map((bookmark, index) => (
          <BookmarkItem key={index} bookmark={bookmark} />
        ))}
      </IonContent>
    </IonPage>
  );
};

export default memo(BookmarksPage, (): boolean => {
  return true;
});
