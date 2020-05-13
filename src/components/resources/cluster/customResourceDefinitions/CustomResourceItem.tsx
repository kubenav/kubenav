import {
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useState } from 'react';

import Editor from '../../../misc/Editor';

interface ICustomResourceItemProps {
  item: any;
}

const CustomResourceItem: React.FunctionComponent<ICustomResourceItemProps> = ({ item }: ICustomResourceItemProps) => {
  const [showModal, setShowModal] = useState<boolean>(false);

  return (
    <React.Fragment>
      <IonItem button={true} onClick={() => setShowModal(true)}>
        <IonLabel>
          <h2>{item.metadata ? item.metadata.name : ''}</h2>
        </IonLabel>
      </IonItem>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start" onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
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

export default CustomResourceItem;
