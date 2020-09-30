import { IonItemOptions, IonItemSliding } from '@ionic/react';
import React, { ReactElement, useRef, useState } from 'react';

import DeleteItem, { DeleteItemActivator } from './DeleteItem';
import ViewItem, { ViewItemActivator } from './ViewItem';

type TShow = '' | 'delete' | 'view';

interface IItemOptionsProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
  children: ReactElement;
}

const ItemOptions: React.FunctionComponent<IItemOptionsProps> = ({ item, url, children }: IItemOptionsProps) => {
  const itemSlidingRef = useRef<HTMLIonItemSlidingElement>(null);
  const [show, setShow] = useState<TShow>('');

  const showAction = (type: TShow) => {
    if (itemSlidingRef && itemSlidingRef.current) {
      itemSlidingRef.current.close();
    }

    setShow(type);
  };

  return (
    <IonItemSliding ref={itemSlidingRef}>
      {children}

      <IonItemOptions side="end">
        <ViewItemActivator activator="item-option" onClick={() => showAction('view')} />
        <ViewItem show={show === 'view'} hide={() => setShow('')} item={item} />

        <DeleteItemActivator activator="item-option" onClick={() => showAction('delete')} />
        <DeleteItem show={show === 'delete'} hide={() => setShow('')} item={item} url={url} />
      </IonItemOptions>
    </IonItemSliding>
  );
};

export default ItemOptions;
