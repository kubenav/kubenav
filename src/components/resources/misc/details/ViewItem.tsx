import { Plugins, FilesystemDirectory, FilesystemEncoding } from '@capacitor/core';
import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonItemOption,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import { close, documentText } from 'ionicons/icons';
import yaml from 'js-yaml';
import React from 'react';

import { TActivator } from '../../../../declarations';
import Editor from '../../../misc/Editor';

const { Filesystem } = Plugins;

interface IViewItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const ViewItemActivator: React.FunctionComponent<IViewItemActivatorProps> = ({
  activator,
  onClick,
}: IViewItemActivatorProps) => {
  if (activator === 'item-option') {
    return (
      <IonItemOption color="primary" onClick={onClick}>
        <IonIcon slot="start" icon={documentText} />
        View
      </IonItemOption>
    );
  } else if (activator === 'button') {
    return (
      <IonButton onClick={onClick}>
        <IonIcon slot="icon-only" icon={documentText} />
      </IonButton>
    );
  } else {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={documentText} />
        <IonLabel>View</IonLabel>
      </IonItem>
    );
  }
};

interface IViewItemProps {
  show: boolean;
  hide: () => void;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const ViewItem: React.FunctionComponent<IViewItemProps> = ({ show, hide, item }: IViewItemProps) => {
  const handleExport = async () => {
    if (isPlatform('hybrid')) {
      try {
        await Filesystem.writeFile({
          path: `${item.metadata ? item.metadata.name : 'export'}.yaml`,
          data: yaml.dump(item),
          directory: FilesystemDirectory.Documents,
          encoding: FilesystemEncoding.UTF8,
        });
      } catch (err) {}
    } else {
      const element = document.createElement('a');
      const file = new Blob([yaml.dump(item)], { type: 'text/yaml' });
      element.href = URL.createObjectURL(file);
      element.download = `${item.metadata ? item.metadata.name : 'export'}.yaml`;
      document.body.appendChild(element);
      element.click();
    }
  };

  return (
    <React.Fragment>
      <IonModal isOpen={show} onDidDismiss={hide}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={hide}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{item.metadata ? item.metadata.name : ''}</IonTitle>
            <IonButtons slot="primary">
              <IonButton onClick={() => handleExport()}>Export</IonButton>
            </IonButtons>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Editor readOnly={true} value={yaml.dump(item)} fullHeight={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default ViewItem;
