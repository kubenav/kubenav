import { IonButton, IonIcon, IonList, IonPopover, isPlatform } from '@ionic/react';
import { ellipsisHorizontal, ellipsisVertical } from 'ionicons/icons';
import React, { useState } from 'react';

import DeleteItem from './modify/DeleteItem';
import EditItem from './modify/EditItem';
import LogsItem from './modify/LogsItem';
import RestartItem from './modify/RestartItem';
import ScaleItem from './modify/ScaleItem';
import ShellItem from './modify/ShellItem';
import SSHItem from './modify/SSHItem';

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
          {isPlatform('hybrid') && type === 'pods' ? <LogsItem activator="item" item={item} url={url} /> : null}
          {isPlatform('hybrid') && type === 'pods' ? <ShellItem activator="item" item={item} url={url} /> : null}
          {isPlatform('hybrid') && type === 'nodes' ? <SSHItem activator="item" item={item} /> : null}
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
