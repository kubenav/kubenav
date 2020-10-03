import {
  IonButton,
  IonIcon,
  IonItem,
  IonItemOption,
  IonItemOptions,
  IonItemSliding,
  IonLabel,
  isPlatform,
} from '@ionic/react';
import { trash } from 'ionicons/icons';
import React, { useContext, useRef } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { IBookmark, IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import useWindowWidth from '../../utils/useWindowWidth';

interface IBookmarkItemProps extends RouteComponentProps {
  bookmark: IBookmark;
}

const BookmarkItem: React.FunctionComponent<IBookmarkItemProps> = ({ bookmark, history }: IBookmarkItemProps) => {
  const context = useContext<IContext>(AppContext);
  const width = useWindowWidth();

  const itemSlidingRef = useRef<HTMLIonItemSlidingElement>(null);

  const closeItemSliding = () => {
    if (itemSlidingRef && itemSlidingRef.current) {
      itemSlidingRef.current.close();
    }
  };

  const deleteBookmark = () => {
    const tmpBookmarks = context.bookmarks.filter((b) => b.url !== bookmark.url);
    context.editBookmarks(tmpBookmarks);
    closeItemSliding();
  };

  const goToPage = () => {
    context.setNamespace(bookmark.namespace);
    history.push(bookmark.url);
  };

  return (
    <IonItemSliding ref={itemSlidingRef}>
      <IonItem button={true} onClick={goToPage}>
        <IonLabel>
          <h2>{bookmark.title}</h2>
          <p>{bookmark.namespace === '' ? 'in all Namespaces' : `in Namespace ${bookmark.namespace}`}</p>
        </IonLabel>
        {isPlatform('hybrid') || isPlatform('mobile') || width < 992 ? null : (
          <IonButton
            color="danger"
            fill="outline"
            slot="end"
            onClick={(e) => {
              e.stopPropagation();
              e.persist();
              deleteBookmark();
            }}
          >
            <IonIcon slot="start" icon={trash} />
            Delete
          </IonButton>
        )}
      </IonItem>
      {isPlatform('hybrid') || isPlatform('mobile') || width < 992 ? (
        <IonItemOptions side="end">
          <IonItemOption color="danger" onClick={deleteBookmark}>
            <IonIcon slot="start" icon={trash} />
            Delete
          </IonItemOption>
        </IonItemOptions>
      ) : null}
    </IonItemSliding>
  );
};

export default withRouter(BookmarkItem);
