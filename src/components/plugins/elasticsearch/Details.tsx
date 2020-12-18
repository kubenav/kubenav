import { IonButton, IonIcon, IonItem, IonLabel, IonList, IonPopover } from '@ionic/react';
import { ellipsisHorizontal, ellipsisVertical, help } from 'ionicons/icons';
import React, { useState } from 'react';

import { openURL } from '../../../utils/helpers';

const Details: React.FunctionComponent = () => {
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  return (
    <React.Fragment>
      <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
        <IonList>
          <IonItem
            button={true}
            detail={false}
            onClick={() => {
              openURL('https://docs.kubenav.io/plugins/elasticsearch/');
              setShowPopover(false);
            }}
          >
            <IonIcon slot="end" color="primary" icon={help} />
            <IonLabel>Help</IonLabel>
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
