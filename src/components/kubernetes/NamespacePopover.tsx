import {
  IonAlert,
  IonButton,
  IonButtons,
  IonIcon,
  IonItem,
  IonLabel,
  IonList,
  IonPopover,
  IonSpinner,
} from '@ionic/react';
import { V1Namespace, V1NamespaceList } from '@kubernetes/client-node';
import { checkmark, options } from 'ionicons/icons';
import React, {useContext, useEffect, useState} from 'react';

import { AppContext } from '../../context';
import { Context } from '../../declarations';

const NamespacePopover: React.FunctionComponent = () => {
  const context = useContext<Context>(AppContext);

  const [error, setError] = useState<string>('');
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();
  const [namespaces, setNamespaces] = useState<V1NamespaceList>();

  useEffect(() => {
    if (showPopover) {
      (async() => {
        try {
          const data: V1NamespaceList = await context.request('GET', '/api/v1/namespaces', '');
          setNamespaces(data);
        } catch (err) {
          setError(err);
        }
      })();
    }

    return () => {};
  }, [showPopover]); /* eslint-disable-line */

  const setNamespace = (ns: V1Namespace) => {
    const namespace: string = ns.metadata !== undefined ? ns.metadata.name ? ns.metadata.name : '' : '';
    context.setNamespace(namespace);
    setShowPopover(false);
  };

  const setAllNamespaces = () => {
    context.setNamespace('');
    setShowPopover(false);
  };

  return (
    <IonButtons slot="primary">
      {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header="Could not get namespaces" message={error} buttons={['OK']} /> : (
        <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
          {namespaces ? (
            <IonList>
              <IonItem onClick={() => setAllNamespaces()}>
                {context.clusters[context.cluster].namespace === '' ? <IonIcon slot="end" color="primary" icon={checkmark} /> : null}
                <IonLabel>All Namespaces</IonLabel>
              </IonItem>

              {namespaces.items.map((namespace, index) => {
                return (
                  <IonItem key={index} onClick={() => setNamespace(namespace)}>
                    {namespace.metadata && context.clusters[context.cluster].namespace === namespace.metadata.name ? <IonIcon slot="end" color="primary" icon={checkmark} /> : null}
                    <IonLabel>{namespace.metadata ? namespace.metadata.name : ''}</IonLabel>
                  </IonItem>
                )
              })}
            </IonList>
          ) : (
            <IonItem>
              <IonLabel>Loading ...</IonLabel>
              <IonSpinner/>
            </IonItem>
          )}
        </IonPopover>
      )}

      <IonButton onClick={(e) => { e.persist(); setShowPopover(true); setPopoverEvent(e)}}>
        <IonIcon slot="icon-only" icon={options} />
      </IonButton>
    </IonButtons>
  );
};

export default NamespacePopover;
