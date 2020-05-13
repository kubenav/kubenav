import {
  IonAvatar,
  IonButton,
  IonButtons,
  IonCol,
  IonContent,
  IonGrid,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonModal,
  IonNote,
  IonRow,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close } from 'ionicons/icons';
import React, { useState } from 'react';

const License: React.FunctionComponent = () => {
  const [showModal, setShowModal] = useState<boolean>(false);

  return (
    <React.Fragment>
      <IonItem button={true} onClick={() => setShowModal(true)}>
        <IonAvatar slot="start">
          <img alt="version" src="/assets/icons/misc/license.png" />
        </IonAvatar>
        <IonLabel>License</IonLabel>
        <IonNote slot="end">MIT</IonNote>
      </IonItem>

      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShowModal(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>MIT License</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <IonGrid>
            <IonRow>
              <IonCol>
                <p>Copyright (c) 2020 Rico Berger</p>

                <p>
                  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
                  associated documentation files (the &quot;Software&quot;), to deal in the Software without
                  restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute,
                  sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
                  furnished to do so, subject to the following conditions:
                </p>

                <p>
                  The above copyright notice and this permission notice shall be included in all copies or substantial
                  portions of the Software.
                </p>

                <p>
                  THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
                  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
                  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
                  OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
                  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
                </p>
              </IonCol>
            </IonRow>
          </IonGrid>
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default License;
