import { IonItemOptions, IonItemSliding } from '@ionic/react';
import React, { ReactElement } from 'react';

import DeleteItem from './DeleteItem';
import EditItem from './EditItem';

interface IItemOptionsProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
  children: ReactElement;
}

const ItemOptions: React.FunctionComponent<IItemOptionsProps> = ({ item, url, children }: IItemOptionsProps) => {
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
