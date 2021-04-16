import { IonButton, IonIcon, IonItem, IonLabel, IonList, IonPopover, IonSpinner, useIonRouter } from '@ionic/react';
import { V1Namespace, V1NamespaceList } from '@kubernetes/client-node';
import { checkmark, options } from 'ionicons/icons';
import React, { useContext, useEffect, useState } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';

interface INamespaceProps {
  baseUrl?: string;
}

const Namespaces: React.FunctionComponent<INamespaceProps> = (props: INamespaceProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();
  const router = useIonRouter();

  const [showPopover, setShowPopover] = useState<boolean>(false);
  const [popoverEvent, setPopoverEvent] = useState();

  const { isError, isLoading, error, data, refetch } = useQuery<V1NamespaceList, Error>(
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
    if (props.baseUrl) {
      router.push(`/${props.baseUrl}/${ns.metadata?.name || ''}`);
    } else {
      const namespace: string = ns.metadata !== undefined ? (ns.metadata.name ? ns.metadata.name : '') : '';
      context.setNamespace(namespace);
      setShowPopover(false);
    }
  };

  const setAllNamespaces = () => {
    if (props.baseUrl) {
      router.push(`/${props.baseUrl}`);
    } else {
      context.setNamespace('');
      setShowPopover(false);
    }
  };

  useEffect(() => {
    if (showPopover) {
      refetch();
    }
  }, [showPopover, refetch]);

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
