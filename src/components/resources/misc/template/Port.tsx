import { IonAlert, IonChip, IonToast } from '@ionic/react';
import { V1Container, V1PodList } from '@kubernetes/client-node';
import React, { useContext, useState, ReactElement } from 'react';

import { IContext, IPortForwardingContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { PortForwardingContext } from '../../../../utils/portforwarding';

// getPortFromTargetPort is used to get the port from a specified target port in a service.
// If the target port is a number we directly return the port number.
// Therefor we have to iterate over each container and port in a pod. If the port was found we return the container port
// number.
// If we couldn't found the correct port we are returning 0, which isn't a valid port for the port forwarding.
// eslint-disable-next-line @typescript-eslint/ban-types
const getPortFromTargetPort = (targetPort: object, containers: V1Container[]): number => {
  if (!isNaN((targetPort as unknown) as number)) {
    return (targetPort as unknown) as number;
  }

  for (const container of containers) {
    if (container.ports) {
      for (const port of container.ports) {
        if (port.name === ((targetPort as unknown) as string)) {
          return port.containerPort;
        }
      }
    }
  }

  return 0;
};

interface IPortProps {
  enabled: boolean;
  name: string;
  namespace: string;
  selector: string;
  port: number;
  // eslint-disable-next-line @typescript-eslint/ban-types
  targetPort?: object;
  children: ReactElement;
}

const Port: React.FunctionComponent<IPortProps> = ({
  enabled,
  name,
  namespace,
  selector,
  port,
  targetPort,
  children,
}: IPortProps) => {
  const context = useContext<IContext>(AppContext);
  const portForwardingContext = useContext<IPortForwardingContext>(PortForwardingContext);
  const [showPortLocalInput, setShowPortLocalInput] = useState<boolean>(false);
  const [error, setError] = useState<string>('');

  const portForward = async (localPort: number) => {
    try {
      if (name === '') {
        const podList: V1PodList = await kubernetesRequest(
          'GET',
          `/api/v1/namespaces/${namespace}/pods?labelSelector=${selector}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        if (podList.items.length > 0 && podList.items[0].metadata) {
          if (targetPort && podList.items[0].spec && podList.items[0].spec.containers) {
            port = getPortFromTargetPort(targetPort, podList.items[0].spec.containers);
            if (port === 0) {
              throw new Error('Target port was not found.');
            }
          }

          await portForwardingContext.add({
            id: '',
            podName: podList.items[0].metadata.name ? podList.items[0].metadata.name : '',
            podNamespace: namespace,
            podPort: port,
            localPort: localPort,
          });
        } else {
          throw new Error('Pod was not found.');
        }
      } else {
        await portForwardingContext.add({
          id: '',
          podName: name,
          podNamespace: namespace,
          podPort: port,
          localPort: localPort,
        });
      }
    } catch (err) {
      setError(`Error: ${err.message}`);
    }
  };

  return (
    <React.Fragment>
      <IonAlert
        isOpen={showPortLocalInput}
        onDidDismiss={() => setShowPortLocalInput(false)}
        header="Port"
        message="Enter the local port number"
        inputs={[
          {
            name: 'localPort',
            type: 'number',
            value: 0,
          },
        ]}
        buttons={[
          { text: 'Cancel', role: 'cancel', handler: () => setShowPortLocalInput(false) },
          { text: 'Start', handler: (data) => portForward(parseInt(data.localPort)) },
        ]}
      />

      <IonToast isOpen={error !== ''} onDidDismiss={() => setError('')} message={error} duration={3000} />

      <IonChip className="unset-chip-height" onClick={enabled ? () => setShowPortLocalInput(true) : undefined}>
        {children}
      </IonChip>
    </React.Fragment>
  );
};

export default Port;
