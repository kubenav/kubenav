import { IonGrid, IonItemDivider, IonLabel, IonRow } from '@ionic/react';
import { V1beta1CronJob, V1Job } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';
import List from '../../misc/List';
import Containers from '../../misc/podTemplate/containers/Containers';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';

interface ICronJobDetailsProps extends RouteComponentProps {
  item: V1beta1CronJob;
  section: string;
  type: string;
}

const CronJobDetails: React.FunctionComponent<ICronJobDetailsProps> = ({ item, type }: ICronJobDetailsProps) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.schedule" title="Schedule" />
          <Row obj={item} objKey="spec.suspend" title="Suspend" value={(value) => (value ? 'true' : 'false')} />
          <Row obj={item} objKey="spec.concurrencyPolicy" title="Concurrency Policy" />
          <Row
            obj={item}
            objKey="status.lastScheduleTime"
            title="Last Schedule"
            value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())}
          />
          <Row obj={item} objKey="spec.successfulJobsHistoryLimit" title="Successful Job History Limit" />
          <Row obj={item} objKey="spec.failedJobsHistoryLimit" title="Failed Job History Limit" />
        </Configuration>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Jobs"
            section="workloads"
            type="jobs"
            namespace={item.metadata.namespace}
            filter={(job: V1Job) =>
              job.metadata && job.metadata.ownerReferences && job.metadata.ownerReferences.length === 1
                ? job.metadata.ownerReferences[0].name ===
                  (item.metadata && item.metadata.name ? item.metadata.name : '')
                : false
            }
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
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}

      <IonItemDivider>
        <IonLabel>Job Template</IonLabel>
      </IonItemDivider>

      <IonRow>
        {item.spec &&
        item.spec.jobTemplate.spec &&
        item.spec.jobTemplate.spec.template.spec &&
        item.spec.jobTemplate.spec.template.spec.initContainers &&
        item.spec.jobTemplate.spec.template.spec.initContainers.length > 0 ? (
          <Containers
            containers={item.spec.jobTemplate.spec.template.spec.initContainers}
            statuses={undefined}
            title="Init Containers"
          />
        ) : null}
        {item.spec &&
        item.spec.jobTemplate.spec &&
        item.spec.jobTemplate.spec.template.spec &&
        item.spec.jobTemplate.spec.template.spec.containers &&
        item.spec.jobTemplate.spec.template.spec.containers.length > 0 ? (
          <Containers
            containers={item.spec.jobTemplate.spec.template.spec.containers}
            statuses={undefined}
            title="Containers"
          />
        ) : null}
      </IonRow>
    </IonGrid>
  );
};

export default CronJobDetails;
