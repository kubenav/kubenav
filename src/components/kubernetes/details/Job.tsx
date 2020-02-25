import {
  IonGrid,
  IonRow,
} from '@ionic/react';
import { V1Job } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { labelSelector, timeDifference } from '../../../utils/helpers';
import Conditions from '../Conditions';
import Configuration from '../Configuration';
import List from '../List';
import Metadata from '../Metadata';
import PodTemplate from '../PodTemplate';
import Row from '../Row';
import Status from '../Status';

interface IJobProps extends RouteComponentProps {
  item: V1Job;
  section: string;
  type: string;
}

const Job: React.FunctionComponent<IJobProps> = ({ item, type }) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.activeDeadlineSeconds" title="Active Deadline Seconds" />
          <Row obj={item} objKey="spec.backoffLimit" title="Back Off Limit" />
          <Row obj={item} objKey="spec.completions" title="Completions" />
          <Row obj={item} objKey="spec.parallelism" title="Parallelism" />
          <Row obj={item} objKey="spec.ttlSecondsAfterFinished" title="TTL Seconds After Finished" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.active" title="Active" />
          <Row obj={item} objKey="status.startTime" title="Started" value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())} />
          <Row obj={item} objKey="status.completionTime" title="Completed" value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())} />
          <Row obj={item} objKey="status.failed" title="Failed" />
          <Row obj={item} objKey="status.succeeded" title="Succeeded" />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? (
        <IonRow>
          <List name="Pods" section="workloads" type="pods" namespace={item.metadata.namespace} selector={`labelSelector=${labelSelector(item.spec.selector)}`} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List name="Events" section="cluster" type="events" namespace={item.metadata.namespace} selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
        </IonRow>
      ) : null}

      {item.spec && item.spec.template ? <PodTemplate template={item.spec.template} /> : null}
    </IonGrid>
  )
};

export default Job;
