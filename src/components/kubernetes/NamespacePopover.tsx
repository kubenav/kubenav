import {
  IonAlert,
  IonButton,
  IonIcon,
  IonItem,
  IonLabel,
  IonList,
  IonPopover,
  IonSpinner,
} from '@ionic/react';
import { V1Namespace, V1NamespaceList } from '@kubernetes/client-node';
import { checkmark, options } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { AppContext } from '../../context';
import { IContext } from '../../declarations';

const NamespacePopover: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();
  const [namespaces, setNamespaces] = useState<V1NamespaceList>();

  const loadNamespaces = async () => {
    try {
      const data: V1NamespaceList = await context.request('GET', '/api/v1/namespaces', '');
      setNamespaces(data);
      setShowPopover(true);
    } catch (err) {
      setError(err);
    }
  };

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
    <React.Fragment>
      {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => { setShowPopover(false); setError(''); }} header="Could not get namespaces" message={error} buttons={['OK']} /> : (
        <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
          {namespaces ? (
            <IonList>
              <IonItem button={true} onClick={() => setAllNamespaces()}>
                {context.clusters && context.cluster && context.clusters.hasOwnProperty(context.cluster) && context.clusters[context.cluster].namespace === '' ? <IonIcon slot="end" color="primary" icon={checkmark} /> : null}
                <IonLabel>All Namespaces</IonLabel>
              </IonItem>

              {namespaces.items.map((namespace, index) => {
                return (
                  <IonItem key={index} button={true} onClick={() => setNamespace(namespace)}>
                    {namespace.metadata && context.clusters && context.cluster && context.clusters.hasOwnProperty(context.cluster) && context.clusters[context.cluster].namespace === namespace.metadata.name ? <IonIcon slot="end" color="primary" icon={checkmark} /> : null}
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

      <IonButton onClick={(e) => { e.persist(); setPopoverEvent(e); loadNamespaces(); }}>
        <IonIcon slot="icon-only" icon={options} />
      </IonButton>
    </React.Fragment>
  );
};

export default NamespacePopover;
