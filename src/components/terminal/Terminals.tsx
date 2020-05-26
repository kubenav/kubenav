import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonItemDivider,
  IonItemGroup,
  IonLabel,
  IonList,
  IonModal,
  IonPopover,
  IonSegment,
  IonSegmentButton,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close, ellipsisHorizontal, ellipsisVertical } from 'ionicons/icons';
import React, { useState, useEffect } from 'react';

import { ITerminal } from '../../declarations';
import Shell from './Shell';

interface ITerminalsProps {
  showModal: boolean;
  setShowModal: (value: boolean) => void;
  terminals: ITerminal[];
  activeTerminal: string;
  setActiveTerminal: (value: string) => void;
  removeTerminal: (index: number) => void;
}

const Terminals: React.FunctionComponent<ITerminalsProps> = ({
  showModal,
  setShowModal,
  terminals,
  activeTerminal,
  setActiveTerminal,
  removeTerminal,
}: ITerminalsProps) => {
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [showSearch, setShowSearch] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  useEffect(() => {
    setShowSearch(false);
  }, [activeTerminal, showModal]);

  return (
    <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonButton
              onClick={() => {
                setShowModal(false);
              }}
            >
              <IonIcon slot="icon-only" icon={close} />
            </IonButton>
          </IonButtons>

          <IonTitle>Terminals</IonTitle>

          <IonButtons slot="primary">
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
          </IonButtons>

          <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
            <IonList>
              <IonItemGroup>
                <IonItem
                  button={true}
                  detail={false}
                  onClick={() => {
                    setShowSearch(!showSearch);
                    setShowPopover(false);
                  }}
                >
                  <IonLabel>Search</IonLabel>
                </IonItem>
              </IonItemGroup>
              <IonItemGroup>
                <IonItemDivider>
                  <IonLabel>Close</IonLabel>
                </IonItemDivider>
                {terminals.map((terminal, index) => {
                  return (
                    <IonItem
                      key={index}
                      button={true}
                      detail={false}
                      onClick={() => {
                        setShowPopover(false);
                        removeTerminal(index);
                      }}
                    >
                      <IonLabel>{terminal.name}</IonLabel>
                    </IonItem>
                  );
                })}
              </IonItemGroup>
            </IonList>
          </IonPopover>
        </IonToolbar>

        <IonToolbar>
          <IonSegment
            mode="md"
            scrollable={true}
            value={activeTerminal}
            onIonChange={(e) => setActiveTerminal(e.detail.value as string)}
          >
            {terminals.map((terminal, index) => {
              return (
                <IonSegmentButton key={index} value={`term_${index}`}>
                  <IonLabel>{terminal.name}</IonLabel>
                </IonSegmentButton>
              );
            })}
          </IonSegment>
        </IonToolbar>
      </IonHeader>

      <IonContent>
        {terminals.map((terminal, index) => {
          return activeTerminal === `term_${index}` ? (
            <Shell key={index} showSearch={showSearch} terminal={terminal} />
          ) : null;
        })}
      </IonContent>
    </IonModal>
  );
};

export default Terminals;
