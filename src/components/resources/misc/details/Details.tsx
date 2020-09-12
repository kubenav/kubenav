import { IonButton, IonIcon, IonList, IonPopover, isPlatform } from '@ionic/react';
import { ellipsisHorizontal, ellipsisVertical } from 'ionicons/icons';
import React, { useState } from 'react';

import useWindowWidth from '../../../../utils/useWindowWidth';
import DeleteItem from './DeleteItem';
import EditItem from './EditItem';
import LogsItem from './LogsItem';
import RestartItem from './RestartItem';
import ScaleItem from './ScaleItem';
import ShellItem from './ShellItem';
import SSHItem from './SSHItem';
import ViewItem from './ViewItem';

interface IDetailsProps {
  type: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
}

const Details: React.FunctionComponent<IDetailsProps> = ({ type, item, url }: IDetailsProps) => {
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();
  const width = useWindowWidth();

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
          {(isPlatform('hybrid') || width < 992) && type === 'pods' ? (
            <LogsItem activator="item" item={item} url={url} />
          ) : null}
          {(isPlatform('hybrid') || width < 992) && type === 'pods' ? (
            <ShellItem activator="item" item={item} url={url} />
          ) : null}
          {(isPlatform('hybrid') || width < 992) && type === 'nodes' ? <SSHItem activator="item" item={item} /> : null}
          <ViewItem activator="item" item={item} />
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

export default Details;
