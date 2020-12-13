import { IonGrid, IonRow } from '@ionic/react';
import { V1Job } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { labelSelector, timeDifference } from '../../../../utils/helpers';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import List from '../../misc/list/List';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

interface IJobDetailsProps extends RouteComponentProps {
  item: V1Job;
  section: string;
  type: string;
}

const JobDetails: React.FunctionComponent<IJobDetailsProps> = ({ item, type }: IJobDetailsProps) => {
  const context = useContext<IContext>(AppContext);

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
          <Row
            obj={item}
            objKey="status.startTime"
            title="Started"
            value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())}
          />
          <Row
            obj={item}
            objKey="status.completionTime"
            title="Completed"
            value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())}
          />
          <Row obj={item} objKey="status.failed" title="Failed" />
          <Row obj={item} objKey="status.succeeded" title="Succeeded" />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.namespace && item.spec && item.spec.selector ? (
        <IonRow>
          <List
            name="Pods"
            section="workloads"
            type="pods"
            namespace={item.metadata.namespace}
            parent={item}
            selector={`labelSelector=${labelSelector(item.spec.selector)}`}
          />
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace={item.metadata.namespace}
            parent={item}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
    </IonGrid>
  );
};

export default JobDetails;
