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
import React, { useState } from 'react';

import { TActivator } from '../../../../declarations';
import Editor from '../../../misc/Editor';

const { Filesystem } = Plugins;

interface IViewYAMLItemProps {
  activator: TActivator;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const ViewYAMLItem: React.FunctionComponent<IViewYAMLItemProps> = ({ activator, item }: IViewYAMLItemProps) => {
  const [showModal, setShowModal] = useState<boolean>(false);

  const handleExport = async () => {
    if (isPlatform('hybrid')) {
      try {
        await Filesystem.writeFile({
          path: `${item.metadata ? item.metadata.name : 'export'}.yaml`,
          data: yaml.safeDump(item),
          directory: FilesystemDirectory.Documents,
          encoding: FilesystemEncoding.UTF8,
        });
      } catch (err) {}
    } else {
      const element = document.createElement('a');
      const file = new Blob([yaml.safeDump(item)], { type: 'text/yaml' });
      element.href = URL.createObjectURL(file);
      element.download = `${item.metadata ? item.metadata.name : 'export'}.yaml`;
      document.body.appendChild(element);
      element.click();
    }
  };

  return (
    <React.Fragment>
      {activator === 'item-option' ? (
        <IonItemOption color="primary" onClick={() => setShowModal(true)}>
          <IonIcon slot="start" icon={documentText} />
          View
        </IonItemOption>
      ) : null}

      {activator === 'button' ? (
        <IonButton onClick={() => setShowModal(true)}>
          <IonIcon slot="icon-only" icon={documentText} />
        </IonButton>
      ) : null}

      {activator === 'item' ? (
        <IonItem button={true} detail={false} onClick={() => setShowModal(true)}>
          <IonIcon slot="end" color="primary" icon={documentText} />
          <IonLabel>View</IonLabel>
        </IonItem>
      ) : null}

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShowModal(false)}>
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
          <Editor readOnly={true} value={yaml.safeDump(item)} fullHeight={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default ViewYAMLItem;
