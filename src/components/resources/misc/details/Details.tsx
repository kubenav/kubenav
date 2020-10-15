import { IonButton, IonIcon, IonItem, IonLabel, IonList, IonPopover, isPlatform } from '@ionic/react';
import { ellipsisHorizontal, ellipsisVertical, refresh as refreshIcon } from 'ionicons/icons';
import React, { useState } from 'react';

import { IBookmark } from '../../../../declarations';
import useWindowWidth from '../../../../utils/useWindowWidth';
import Bookmark from '../shared/Bookmark';
import CreateJobItem, { CreateJobItemActivator } from './CreateJobItem';
import DeleteItem, { DeleteItemActivator } from './DeleteItem';
import EditItem, { EditItemActivator } from './EditItem';
import LogsItem, { LogsItemActivator } from './LogsItem';
import RestartItem, { RestartItemActivator } from './RestartItem';
import ScaleItem, { ScaleItemActivator } from './ScaleItem';
import ShellItem, { ShellItemActivator } from './ShellItem';
import SSHItem, { SSHItemActivator } from './SSHItem';
import ViewItem, { ViewItemActivator } from './ViewItem';

type TShow = '' | 'createjob' | 'delete' | 'edit' | 'logs' | 'restart' | 'scale' | 'shell' | 'ssh' | 'view';

interface IDetailsProps {
  refresh: () => void;
  type: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
  bookmark: IBookmark;
}

const Details: React.FunctionComponent<IDetailsProps> = ({ refresh, type, item, url, bookmark }: IDetailsProps) => {
  const [show, setShow] = useState<TShow>('');
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();
  const width = useWindowWidth();

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
          {type === 'cronjobs' ? (
            <CreateJobItemActivator activator="item" onClick={() => showType('createjob')} />
          ) : null}
          {type === 'deployments' ||
          type === 'statefulsets' ||
          type === 'replicationcontrollers' ||
          type === 'replicasets' ? (
            <ScaleItemActivator activator="item" onClick={() => showType('scale')} />
          ) : null}
          {type === 'deployments' || type === 'statefulsets' || type === 'daemonsets' ? (
            <RestartItemActivator activator="item" onClick={() => showType('restart')} />
          ) : null}
          {(isPlatform('hybrid') || isPlatform('mobile') || width < 992) && type === 'pods' ? (
            <LogsItemActivator activator="item" onClick={() => showType('logs')} />
          ) : null}
          {(isPlatform('hybrid') || isPlatform('mobile') || width < 992) && type === 'pods' ? (
            <ShellItemActivator activator="item" onClick={() => showType('shell')} />
          ) : null}
          {(isPlatform('hybrid') || isPlatform('mobile') || width < 992) && type === 'nodes' ? (
            <SSHItemActivator activator="item" onClick={() => showType('ssh')} item={item} />
          ) : null}
          <ViewItemActivator activator="item" onClick={() => showType('view')} />
          <EditItemActivator activator="item" onClick={() => showType('edit')} />
          <DeleteItemActivator activator="item" onClick={() => showType('delete')} />
        </IonList>
      </IonPopover>

      <CreateJobItem show={show === 'createjob'} hide={() => setShow('')} item={item} />
      <ScaleItem show={show === 'scale'} hide={() => setShow('')} item={item} url={url} />
      <RestartItem show={show === 'restart'} hide={() => setShow('')} item={item} url={url} />
      <LogsItem show={show === 'logs'} hide={() => setShow('')} item={item} url={url} />
      <ShellItem show={show === 'shell'} hide={() => setShow('')} item={item} url={url} />
      <SSHItem show={show === 'ssh'} hide={() => setShow('')} item={item} />
      <ViewItem show={show === 'view'} hide={() => setShow('')} item={item} />
      <EditItem show={show === 'edit'} hide={() => setShow('')} item={item} url={url} />
      <DeleteItem show={show === 'delete'} hide={() => setShow('')} item={item} url={url} />

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
