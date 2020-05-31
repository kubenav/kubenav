import { IonButton, IonIcon, IonList, IonPopover } from '@ionic/react';
import { ellipsisHorizontal, ellipsisVertical } from 'ionicons/icons';
import React, { useState } from 'react';

import DeleteItem from './modify/DeleteItem';
import EditItem from './modify/EditItem';
import RestartItem from './modify/RestartItem';
import ScaleItem from './modify/ScaleItem';

interface IDetailsPopoverProps {
  type: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
}

const DetailsPopover: React.FunctionComponent<IDetailsPopoverProps> = ({ type, item, url }: IDetailsPopoverProps) => {
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  return (
    <React.Fragment>
      <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
        <IonList>
          {type === 'deployments' ||
          type === 'statefulsets' ||
          type === 'replicationcontrollers' ||
          type === 'replicasets' ? (
            <ScaleItem activator="item" item={item} url={url} />
          ) : null}
          {type === 'deployments' || type === 'statefulsets' || type === 'daemonsets' ? (
            <RestartItem activator="item" item={item} url={url} />
          ) : null}
          <EditItem activator="item" item={item} url={url} />
          <DeleteItem activator="item" item={item} url={url} />
        </IonList>
      </IonPopover>

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

export default DetailsPopover;
