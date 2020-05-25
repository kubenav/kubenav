import { IonItem, IonLabel } from '@ionic/react';
import React from 'react';

interface ICustomResourceItemProps {
  group: string;
  version: string;
  name: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const CustomResourceItem: React.FunctionComponent<ICustomResourceItemProps> = ({
  group,
  version,
  name,
  item,
}: ICustomResourceItemProps) => {
  return (
    <IonItem
      routerLink={`/customresources/${group}/${version}/${name}/${item.metadata.namespace}/${item.metadata.name}`}
      routerDirection="forward"
    >
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
      </IonLabel>
    </IonItem>
  );
};

export default CustomResourceItem;
