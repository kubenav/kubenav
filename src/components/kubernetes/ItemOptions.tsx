import {
  IonItemOptions,
  IonItemSliding,
} from '@ionic/react';
import React from 'react';

import DeleteItem from './DeleteItem';
import EditItem from './EditItem';

interface IItemOptionsProps {
  item: any;
  url: string;
}

const ItemOptions: React.FunctionComponent<IItemOptionsProps> = ({ item, url, children }) => {
  return (
    <IonItemSliding>
      {children}

      <IonItemOptions side="end">
        <EditItem activator="item-option" item={item} url={url} />
        <DeleteItem activator="item-option" item={item} url={url} />
      </IonItemOptions>
    </IonItemSliding>
  );
};

export default ItemOptions;
