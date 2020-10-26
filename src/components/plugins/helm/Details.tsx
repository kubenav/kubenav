import { IonButton, IonIcon, IonItem, IonLabel, IonList, IonPopover } from '@ionic/react';
import { ellipsisHorizontal, ellipsisVertical, refresh as refreshIcon } from 'ionicons/icons';
import React, { useState } from 'react';

type TShow = '';

interface IDetailsProps {
  refresh: () => void;
}

const Details: React.FunctionComponent<IDetailsProps> = ({ refresh }: IDetailsProps) => {
  const [, setShow] = useState<TShow>('');
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

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
