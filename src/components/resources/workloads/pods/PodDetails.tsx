import { IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1Pod } from '@kubernetes/client-node';
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext, IPodMetrics } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import List from '../../misc/List';
import Affinities from '../../misc/podTemplate/affinities/Affinities';
import Containers from '../../misc/podTemplate/containers/Containers';
import Tolerations from '../../misc/podTemplate/tolerations/Tolerations';
import Volumes from '../../misc/podTemplate/volumes/Volumes';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';
import { getReady, getRestarts, getStatus } from './podHelpers';

interface IPodDetailsProps extends RouteComponentProps {
  item: V1Pod;
  section: string;
  type: string;
}

const PodDetails: React.FunctionComponent<IPodDetailsProps> = ({ item, type }) => {
  const context = useContext<IContext>(AppContext);

  const [metrics, setMetrics] = useState<IPodMetrics>();

  useEffect(() => {
    if (item.metadata && item.metadata.namespace && item.metadata.name) {
      (async () => {
        try {
          const data: IPodMetrics = await context.request(
            'GET',
            `/apis/metrics.k8s.io/v1beta1/namespaces/${item.metadata!.namespace}/pods/${item.metadata!.name}`,
            '',
          );
          setMetrics(data);
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
          <IonRow>
            <IonCol size="auto">
              <b>Ready:</b>
            </IonCol>
            <IonCol>{getReady(item)}</IonCol>
          </IonRow>
          <IonRow>
            <IonCol size="auto">
              <b>Restarts:</b>
            </IonCol>
            <IonCol>{getRestarts(item)}</IonCol>
          </IonRow>
          <IonRow>
            <IonCol size="auto">
              <b>Status:</b>
            </IonCol>
            <IonCol>{getStatus(item)}</IonCol>
          </IonRow>
          <Row obj={item} objKey="status.qosClass" title="QoS" />
          <Row obj={item} objKey="status.phase" title="Phase" />
          <Row obj={item} objKey="status.podIP" title="Pod IP" />
          <Row obj={item} objKey="status.hostIP" title="Host IP" />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

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
        {item.spec &&
        item.spec.tolerations &&
        item.spec.tolerations.filter((toleration) => !!toleration.key).length > 0 ? (
          <Tolerations tolerations={item.spec.tolerations} />
        ) : null}
        {item.spec && item.spec.affinity ? <Affinities affinities={item.spec.affinity} /> : null}
      </IonRow>

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace={item.metadata.namespace}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default PodDetails;
