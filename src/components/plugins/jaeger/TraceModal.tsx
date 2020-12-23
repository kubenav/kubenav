import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonModal,
  IonNote,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close } from 'ionicons/icons';
import React, { useState } from 'react';

import useWindowWidth from '../../../utils/useWindowWidth';
import Trace, { ITraceProps, formatTime, getDuration, traceTitle } from './Trace';

const TraceModal: React.FunctionComponent<ITraceProps> = ({ trace }: ITraceProps) => {
  const [show, setShow] = useState<boolean>(false);
  const width = useWindowWidth();
  const title = traceTitle(trace);

  return (
    <React.Fragment>
      <IonItem button={true} detail={false} onClick={() => setShow(true)}>
        <IonLabel class="ion-text-wrap">
          <h2>{title}</h2>
          <p>
            {trace.spans ? trace.spans.length : 0} Spans at {formatTime(Math.floor(trace.spans[0].startTime / 1000))}{' '}
            over {Object.keys(trace.processes).length} Services
            <br />
            {Object.keys(trace.processes)
              .map((processID) => trace.processes[processID].serviceName)
              .join(', ')}
          </p>
        </IonLabel>
        {trace.spans && trace.spans.length > 0 && width >= 640 ? (
          <IonNote slot="end">{getDuration(trace.spans).toFixed(2)}ms</IonNote>
        ) : null}
      </IonItem>

      <IonModal isOpen={show} onDidDismiss={() => setShow(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShow(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{title}</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Trace trace={trace} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default TraceModal;
