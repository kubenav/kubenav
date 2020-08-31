import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
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
  const [showSelect, setShowSelect] = useState<boolean>(false);
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
                    setShowSelect(false);
                    setShowPopover(false);
                  }}
                >
                  <IonLabel>Search</IonLabel>
                </IonItem>
                <IonItem
                  button={true}
                  detail={false}
                  onClick={() => {
                    setShowSearch(false);
                    setShowSelect(!showSelect);
                    setShowPopover(false);
                  }}
                >
                  <IonLabel>Select</IonLabel>
                </IonItem>
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
                <IonSegmentButton key={index} mode="md" value={`term_${index}`} layout="icon-end">
                  <IonButton
                    fill="clear"
                    className="terminal-tab-close-button"
                    onClick={(e) => {
                      e.stopPropagation();
                      e.preventDefault();
                      removeTerminal(index);
                    }}
                  >
                    <IonIcon slot="icon-only" icon={close} className="terminal-tab-close-button-color" />
                  </IonButton>
                  <IonLabel>{terminal.name}</IonLabel>
                </IonSegmentButton>
              );
            })}
          </IonSegment>
        </IonToolbar>
      </IonHeader>

      <IonContent scrollX={false} scrollY={false}>
        {terminals.map((terminal, index) => {
          return activeTerminal === `term_${index}` ? (
            <Shell key={index} showSearch={showSearch} showSelect={showSelect} terminal={terminal} />
          ) : null;
        })}
      </IonContent>
    </IonModal>
  );
};

export default Terminals;
