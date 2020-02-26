import {
  IonGrid,
  IonRow,
} from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import React, {useContext, useEffect, useState} from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext, IPodMetrics } from '../../../declarations';
import { AppContext } from '../../../utils/context';
import Affinities from '../Affinities';
import Conditions from '../Conditions';
import Configuration from '../Configuration';
import Containers from '../Containers';
import List from '../List';
import Metadata from '../Metadata';
import Row from '../Row';
import Status from '../Status';
import Tolerations from '../Tolerations';
import Volumes from '../Volumes';

interface IPodProps extends RouteComponentProps {
  item: V1Pod;
  section: string;
  type: string;
}

const Pod: React.FunctionComponent<IPodProps> = ({ item, type }) => {
  const context = useContext<IContext>(AppContext);

  const [metrics, setMetrics] = useState<IPodMetrics>();

  useEffect(() => {
    if (item.metadata && item.metadata.namespace && item.metadata.name) {
      (async() => {
        try {
          const data: IPodMetrics = await context.request('GET', `/apis/metrics.k8s.io/v1beta1/namespaces/${item.metadata!.namespace}/pods/${item.metadata!.name}`, '');
          setMetrics(data)
        } catch (err) {
          // TODO: Implement error handling.
        }
      })();
    }

    return () => {};
  }, [item, type]); /* eslint-disable-line */

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.priority" title="Priority" />
          <Row obj={item} objKey="spec.nodeName" title="Node" />
          <Row obj={item} objKey="spec.serviceAccount" title="Service Account" />
          <Row obj={item} objKey="spec.restartPolicy" title="Restart Policy" />
          <Row obj={item} objKey="spec.terminationGracePeriodSeconds" title="Termination Grace Period Seconds" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.qosClass" title="QoS" />
          <Row obj={item} objKey="status.phase" title="Phase" />
          <Row obj={item} objKey="status.podIP" title="Pod IP" />
          <Row obj={item} objKey="status.hostIP" title="Host IP" />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      <IonRow>
        {item.spec && item.spec.initContainers && item.spec.initContainers.length > 0 ? (
          <Containers
            containers={item.spec.initContainers}
            logs={true}
            metrics={metrics ? metrics.containers : undefined}
            name={item.metadata ? item.metadata.name : ''}
            namespace={item.metadata ? item.metadata.namespace : ''}
            statuses={item.status && item.status.initContainerStatuses ? item.status.initContainerStatuses : undefined}
            title="Init Containers"
          />
        ) : null}
        {item.spec && item.spec.containers && item.spec.containers.length > 0 ? (
          <Containers
            containers={item.spec.containers}
            logs={true}
            metrics={metrics ? metrics.containers : undefined}
            name={item.metadata ? item.metadata.name : ''}
            namespace={item.metadata ? item.metadata.namespace : ''}
            statuses={item.status && item.status.containerStatuses ? item.status.containerStatuses : undefined}
            title="Containers"
          />
        ) : null}
      </IonRow>

      <IonRow>
        {item.status && item.status.conditions ? <Conditions conditions={item.status.conditions} /> : null}
        {item.spec && item.spec.volumes ? <Volumes volumes={item.spec.volumes} /> : null}
        {item.spec && item.spec.tolerations && item.spec.tolerations.filter((toleration) =>
          !!toleration.key).length > 0 ? <Tolerations tolerations={item.spec.tolerations} /> : null}
        {item.spec && item.spec.affinity ? <Affinities affinities={item.spec.affinity} /> : null}
      </IonRow>

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List name="Events" section="cluster" type="events" namespace={item.metadata.namespace} selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
        </IonRow>
      ) : null}
    </IonGrid>
  )
};

export default Pod;
