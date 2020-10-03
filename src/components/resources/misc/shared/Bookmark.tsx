import { IonIcon, IonItem, IonLabel } from '@ionic/react';
import { bookmark as bookmarkFilled, bookmarkOutline } from 'ionicons/icons';
import React, { useContext } from 'react';

import { IBookmark, IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';

interface IBookmarkProps {
  bookmark: IBookmark;
  hide: () => void;
}

const Bookmark: React.FunctionComponent<IBookmarkProps> = ({ bookmark, hide }: IBookmarkProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const saveBookmark = () => {
    const tmpBookmarks = context.bookmarks;
    tmpBookmarks.push(bookmark);
    context.editBookmarks(tmpBookmarks);

    hide();
  };

  const deleteBookmark = () => {
    const tmpBookmarks = context.bookmarks.filter((b) => b.url !== bookmark.url);
    context.editBookmarks(tmpBookmarks);

    hide();
  };

  if (context.bookmarks.filter((b) => b.url === bookmark.url && b.namespace === cluster?.namespace).length === 0) {
    return (
      <IonItem button={true} detail={false} onClick={saveBookmark}>
        <IonIcon slot="end" color="primary" icon={bookmarkOutline} />
        <IonLabel>Bookmark</IonLabel>
      </IonItem>
    );
  } else {
    return (
      <IonItem button={true} detail={false} onClick={deleteBookmark}>
        <IonIcon slot="end" color="primary" icon={bookmarkFilled} />
        <IonLabel>Bookmark</IonLabel>
      </IonItem>
    );
  }
};

export default Bookmark;
