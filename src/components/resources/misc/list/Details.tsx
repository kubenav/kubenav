import { IonButton, IonIcon, IonItem, IonLabel, IonList, IonPopover } from '@ionic/react';
import { ellipsisHorizontal, ellipsisVertical, refresh as refreshIcon } from 'ionicons/icons';
import React, { useState } from 'react';

import { IAppPage, IBookmark } from '../../../../declarations';
import Bookmark from '../shared/Bookmark';
import CreateItem, { CreateItemActivator } from './CreateItem';

type TShow = '' | 'create';

interface IDetailsProps {
  refresh: () => void;
  bookmark: IBookmark;
  type: string;
  page?: IAppPage;
}

const Details: React.FunctionComponent<IDetailsProps> = ({ refresh, bookmark, type, page }: IDetailsProps) => {
  const [show, setShow] = useState<TShow>('');
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  const showType = (type: TShow) => {
    setShowPopover(false);
    setShow(type);
  };

  return (
    <React.Fragment>
      <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
        <IonList>
          <IonItem
            button={true}
            detail={false}
            onClick={() => {
              refresh();
              showType('');
            }}
          >
            <IonIcon slot="end" color="primary" icon={refreshIcon} />
            <IonLabel>Refresh</IonLabel>
          </IonItem>
          <Bookmark bookmark={bookmark} hide={() => showType('')} />
          {page !== undefined &&
          type !== 'componentstatuses' &&
          type !== 'customresourcedefinitions' &&
          type !== 'events' &&
          type !== 'nodes' ? (
            <CreateItemActivator activator="item" onClick={() => showType('create')} />
          ) : null}
        </IonList>
      </IonPopover>

      {page !== undefined ? (
        <CreateItem show={show === 'create'} hide={() => setShow('')} type={type} page={page} refresh={refresh} />
      ) : null}

      <IonButton
        onClick={(e) => {
          e.persist();
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          setPopoverEvent(e as any);
          setShowPopover(true);
        }}
      >
        <IonIcon slot="icon-only" ios={ellipsisHorizontal} md={ellipsisVertical} />
      </IonButton>
    </React.Fragment>
  );
};

export default Details;
