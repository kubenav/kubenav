import {
  IonItemOptions,
  IonItemSliding,
} from '@ionic/react';
import React from 'react';

import DeleteItem from './DeleteItem';
import EditItem from './EditItem';

interface ItemOptionsProps {
  item: any;
  url: string;
}

const ItemOptions: React.FunctionComponent<ItemOptionsProps> = ({ item, url, children }) => {
  return (
    <IonItemSliding>
      {children}

      <IonItemOptions side="end">
        <EditItem item={item} url={url} />
        <DeleteItem item={item} url={url} />
      </IonItemOptions>
    </IonItemSliding>
  );
};

export default ItemOptions;
