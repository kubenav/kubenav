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
} from '@ionic/react';
import { close, documentText } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useState } from 'react';

import { TActivator } from '../../../../declarations';
import Editor from '../../../misc/Editor';

interface IViewYAMLItemProps {
  activator: TActivator;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const ViewYAMLItem: React.FunctionComponent<IViewYAMLItemProps> = ({ activator, item }: IViewYAMLItemProps) => {
  const [showModal, setShowModal] = useState<boolean>(false);

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
