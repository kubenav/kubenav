import { Clipboard } from '@capacitor/clipboard';
import { ActionSheetButton, IonActionSheet, IonFab, IonFabButton, IonIcon, IonToast } from '@ionic/react';
import { repeatOutline } from 'ionicons/icons';
import React, { useContext, useEffect, useState, ReactElement } from 'react';

import { IContext, IPortForwarding, IPortForwardingContext } from '../declarations';
import {
  kubernetesPortForwardingActiveSessions,
  kubernetesPortForwardingRequest,
  kubernetesPortForwardingStopRequest,
} from './api';
import { IS_INCLUSTER } from './constants';
import { AppContext } from './context';
import { openURL } from './helpers';

// Creates a Context object. When React renders a component that subscribes to this Context object it will read the
// current context value from the closest matching Provider above it in the tree.
export const PortForwardingContext = React.createContext<IPortForwardingContext>({
  portForwardings: [],

  add: () => {
    // eslint-disable-next-line @typescript-eslint/no-empty-function
    return new Promise(() => {});
  },
});

// A React component that subscribes to context changes. This lets you subscribe to a context within a function
// component.
export const PortForwardingContextConsumer = PortForwardingContext.Consumer;

interface IPortForwardingContextProvider {
  children: ReactElement;
}

// Every Context object comes with a Provider React component that allows consuming components to subscribe to context
// changes.
export const PortForwardingContextProvider: React.FunctionComponent<IPortForwardingContextProvider> = ({
  children,
}: IPortForwardingContextProvider) => {
  const context = useContext<IContext>(AppContext);
  const [showPortForwardings, setShowPortForwardings] = useState<boolean>(false);
  const [portForwardings, setPortForwardings] = useState<IPortForwarding[]>([]);
  const [error, setError] = useState<string>('');
  const [message, setMessage] = useState<string>('');
  const [messagePort, setMessagePort] = useState<number>(0);
  const [showPortForwardingActions, setShowPortForwardingActions] = useState<boolean>(false);
  const [selectedPortForwarding, setSelectedPortForwarding] = useState<number>(0);

  useEffect(() => {
    // getActiveSessions tries to get all active port forwarding sessions from the Go backend. So that the list is
    // always up to date, also when an other operation regarding opening/deleting a session failes. Since port
    // forwarding is disabled for the incluster mode we do not have to make the API call.
    const getActiveSessions = async () => {
      if (!IS_INCLUSTER) {
        try {
          const sessions = await kubernetesPortForwardingActiveSessions();

          if (sessions !== null && sessions.length > 0) {
            const tmpPortForwardings: IPortForwarding[] = [];
            for (let i = 0; i < sessions.length; i++) {
              tmpPortForwardings.push({
                id: sessions[i].id,
                podName: sessions[i].podName,
                podNamespace: sessions[i].podNamespace,
                podPort: sessions[i].podPort,
                localPort: sessions[i].localPort,
              });
            }

            setPortForwardings(tmpPortForwardings);
          }
        } catch (err) {
          setError(`Could not get active port forwarding sessions: ${err.message}`);
        }
      }
    };

    const interval = setInterval(() => getActiveSessions(), 10000);

    return () => {
      clearInterval(interval);
    };
  }, [portForwardings]);

  const add = async (portForwarding: IPortForwarding) => {
    try {
      const pf = await kubernetesPortForwardingRequest(
        portForwarding.podName,
        portForwarding.podNamespace,
        portForwarding.podPort,
        portForwarding.localPort,
        context.settings,
        await context.kubernetesAuthWrapper(''),
      );

      portForwarding.id = pf.id;
      portForwarding.localPort = pf.localPort;

      setPortForwardings([...portForwardings, portForwarding]);
      setMessagePort(portForwarding.localPort);
      setMessage(
        `Start Port Forwarding for ${portForwarding.podName} (${portForwarding.localPort}:${portForwarding.podPort})`,
      );
    } catch (err) {
      setError(err.message);
    }
  };

  const remove = async (index: number) => {
    try {
      await kubernetesPortForwardingStopRequest(portForwardings[index].id);

      if (portForwardings.length > 1) {
        const copy = [...portForwardings];
        copy.splice(index, 1);
        setPortForwardings(copy);
      } else {
        setShowPortForwardings(false);
        setPortForwardings([]);
      }
    } catch (err) {
      setError(err.message);
    }
  };

  const generateButtons = (): ActionSheetButton[] => {
    const buttons: ActionSheetButton[] = [];

    for (let i = 0; i < portForwardings.length; i++) {
      buttons.push({
        text: `${portForwardings[i].localPort}:${portForwardings[i].podPort} ${portForwardings[i].podName}`,
        handler: () => {
          setShowPortForwardings(false);
          setSelectedPortForwarding(i);
          setShowPortForwardingActions(true);
        },
      });
    }

    return buttons;
  };

  const buttons = generateButtons();

  return (
    <PortForwardingContext.Provider
      value={{
        portForwardings: portForwardings,

        add: add,
      }}
    >
      {!showPortForwardings && !showPortForwardingActions && portForwardings.length > 0 ? (
        <IonFab vertical="bottom" horizontal="end" slot="fixed" style={{ bottom: '76px' }}>
          <IonFabButton onClick={() => setShowPortForwardings(true)}>
            <IonIcon icon={repeatOutline} color="#326ce5" />
          </IonFabButton>
        </IonFab>
      ) : null}

      {children}

      <IonToast isOpen={error !== ''} onDidDismiss={() => setError('')} message={`Error: ${error}`} duration={3000} />
      <IonToast
        isOpen={message !== ''}
        onDidDismiss={() => {
          setMessage('');
          setMessagePort(0);
        }}
        message={message}
        duration={3000}
        buttons={[
          {
            side: 'end',
            text: 'Copy',
            handler: () => {
              Clipboard.write({ string: `localhost:${messagePort}` });
            },
          },
          {
            side: 'end',
            text: 'Open',
            handler: () => openURL(`http://localhost:${messagePort}`),
          },
        ]}
      />

      <IonActionSheet
        isOpen={showPortForwardings}
        onDidDismiss={() => setShowPortForwardings(false)}
        header="Port Forwardings"
        buttons={buttons}
      />
      <IonActionSheet
        isOpen={showPortForwardingActions}
        onDidDismiss={() => setShowPortForwardingActions(false)}
        header="Select Action"
        buttons={[
          {
            text: 'Stop',
            handler: () => {
              remove(selectedPortForwarding);
            },
          },
          {
            text: 'Copy',
            handler: () => {
              Clipboard.write({ string: `localhost:${portForwardings[selectedPortForwarding].localPort}` });
            },
          },
          {
            text: 'Open',
            handler: () => openURL(`http://localhost:${portForwardings[selectedPortForwarding].localPort}`),
          },
        ]}
      />
    </PortForwardingContext.Provider>
  );
};
