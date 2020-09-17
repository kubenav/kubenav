import { IonButton, IonIcon, IonItem, IonLabel, IonList, IonPopover, IonSpinner } from '@ionic/react';
import { V1Namespace, V1NamespaceList } from '@kubernetes/client-node';
import { checkmark, options } from 'ionicons/icons';
import React, { useContext, useState } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

const Namespaces: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  const { isError, isLoading, error, data } = useQuery<V1NamespaceList, Error>(
    ['Namespaces', cluster ? cluster.id : ''],
    async () =>
      await kubernetesRequest(
        'GET',
        '/api/v1/namespaces',
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    context.settings.queryConfig,
  );

  const setNamespace = (ns: V1Namespace) => {
    const namespace: string = ns.metadata !== undefined ? (ns.metadata.name ? ns.metadata.name : '') : '';
    context.setNamespace(namespace);
    setShowPopover(false);
  };

  const setAllNamespaces = () => {
    context.setNamespace('');
    setShowPopover(false);
  };

  return (
    <React.Fragment>
      <IonPopover isOpen={showPopover} event={popoverEvent} onDidDismiss={() => setShowPopover(false)}>
        {isError ? (
          <IonList>
            <IonItem>{error ? error.message : 'Could not get Namespaces'}</IonItem>
          </IonList>
        ) : data ? (
          <IonList>
            <IonItem button={true} detail={false} onClick={() => setAllNamespaces()}>
              {cluster && cluster.namespace === '' ? <IonIcon slot="end" color="primary" icon={checkmark} /> : null}
              <IonLabel>All Namespaces</IonLabel>
            </IonItem>

            {data.items.map((namespace, index) => {
              return (
                <IonItem key={index} button={true} detail={false} onClick={() => setNamespace(namespace)}>
                  {namespace.metadata && cluster && cluster.namespace === namespace.metadata.name ? (
                    <IonIcon slot="end" color="primary" icon={checkmark} />
                  ) : null}
                  <IonLabel>{namespace.metadata ? namespace.metadata.name : ''}</IonLabel>
                </IonItem>
              );
            })}
          </IonList>
        ) : isLoading ? (
          <IonItem>
            <IonLabel>Loading ...</IonLabel>
            <IonSpinner />
          </IonItem>
        ) : null}
      </IonPopover>

      <IonButton
        onClick={(e) => {
          e.persist();
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          setPopoverEvent(e as any);
          setShowPopover(true);
        }}
      >
        <IonIcon slot="icon-only" icon={options} />
      </IonButton>
    </React.Fragment>
  );
};

export default Namespaces;
