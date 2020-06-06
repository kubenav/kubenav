import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonGrid,
  IonItem,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import {
  V2beta1CrossVersionObjectReference,
  V2beta1ExternalMetricStatus,
  V2beta1HorizontalPodAutoscaler,
  V2beta1MetricSpec,
  V2beta1MetricStatus,
  V2beta1ObjectMetricStatus,
  V2beta1PodsMetricStatus,
  V2beta1ResourceMetricStatus,
} from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import List from '../../misc/List';
import Conditions from '../../misc/template/Conditions';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

const getExternalMetricSource = (
  name: string,
  statuses: V2beta1MetricStatus[],
): V2beta1ExternalMetricStatus | undefined => {
  for (const status of statuses) {
    if (status.external && status.external.metricName === name) {
      return status.external;
    }
  }

  return undefined;
};

const getObjectMetricStatus = (
  name: string,
  statuses: V2beta1MetricStatus[],
): V2beta1ObjectMetricStatus | undefined => {
  for (const status of statuses) {
    if (status.object && status.object.metricName === name) {
      return status.object;
    }
  }

  return undefined;
};

const getPodsMetricStatus = (name: string, statuses: V2beta1MetricStatus[]): V2beta1PodsMetricStatus | undefined => {
  for (const status of statuses) {
    if (status.pods && status.pods.metricName === name) {
      return status.pods;
    }
  }

  return undefined;
};

const getResourceMetricStatus = (
  name: string,
  statuses: V2beta1MetricStatus[],
): V2beta1ResourceMetricStatus | undefined => {
  for (const status of statuses) {
    if (status.resource && status.resource.name === name) {
      return status.resource;
    }
  }

  return undefined;
};

interface IMetricItemProps {
  metric: V2beta1MetricSpec;
  statuses?: V2beta1MetricStatus[];
}

const MetricItem: React.FunctionComponent<IMetricItemProps> = ({ metric, statuses }: IMetricItemProps) => {
  if (metric.external) {
    const status = statuses ? getExternalMetricSource(metric.external.metricName, statuses) : undefined;
    return (
      <IonItem>
        <IonLabel>
          <h2>External: {metric.external.metricName}</h2>
          <p>
            Target Average Value: {metric.external.targetAverageValue ? metric.external.targetAverageValue : '-'}
            {' | '}Target Value: {metric.external.targetValue ? metric.external.targetValue : '-'}
            {' | '}Current Average Value: {status && status.currentAverageValue ? status.currentAverageValue : '-'}
            {' | '}Current Value: {status && status.currentValue ? status.currentValue : '-'}
          </p>
        </IonLabel>
      </IonItem>
    );
  } else if (metric.object) {
    const status = statuses ? getObjectMetricStatus(metric.object.metricName, statuses) : undefined;
    return (
      <IonItem>
        <IonLabel>
          <h2>Object: {metric.object.metricName}</h2>
          <p>
            Average Value: {metric.object.averageValue ? metric.object.averageValue : '-'}
            {' | '}Target Value: {metric.object.targetValue ? metric.object.targetValue : '-'}
            {' | '}Current Value: {status && status.currentValue ? status.currentValue : '-'}
          </p>
        </IonLabel>
      </IonItem>
    );
  } else if (metric.pods) {
    const status = statuses ? getPodsMetricStatus(metric.pods.metricName, statuses) : undefined;
    return (
      <IonItem>
        <IonLabel>
          <h2>Pods: {metric.pods.metricName}</h2>
          <p>
            Target Average Value: {metric.pods.targetAverageValue ? metric.pods.targetAverageValue : '-'}
            {' | '}Current Average Value: {status && status.currentAverageValue ? status.currentAverageValue : '-'}
          </p>
        </IonLabel>
      </IonItem>
    );
  } else if (metric.resource) {
    const status = statuses ? getResourceMetricStatus(metric.resource.name, statuses) : undefined;
    return (
      <IonItem>
        <IonLabel class="ion-text-wrap">
          <h2>Resource: {metric.resource.name}</h2>
          <p>
            Target Average Utilization:{' '}
            {metric.resource.targetAverageUtilization ? `${metric.resource.targetAverageUtilization}%` : '-'}
            {' | '}Target Average Value: {metric.resource.targetAverageValue ? metric.resource.targetAverageValue : '-'}
            {' | '}Current Average Utilization:{' '}
            {status && status.currentAverageUtilization ? `${status.currentAverageUtilization}%` : '-'}
            {' | '}Current Average Value: {status && status.currentAverageValue ? status.currentAverageValue : '-'}
          </p>
        </IonLabel>
      </IonItem>
    );
  } else {
    return (
      <IonItem>
        <IonLabel>
          <h2>Invalid Metric Type: {metric.type}</h2>
        </IonLabel>
      </IonItem>
    );
  }
};

interface IHorizontalPodAutoscalerDetailsProps extends RouteComponentProps {
  item: V2beta1HorizontalPodAutoscaler;
  section: string;
  type: string;
}

const HorizontalPodAutoscalerDetails: React.FunctionComponent<IHorizontalPodAutoscalerDetailsProps> = ({
  item,
  type,
}: IHorizontalPodAutoscalerDetailsProps) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.minReplicas" title="Min Replicas" />
          <Row obj={item} objKey="spec.maxReplicas" title="Max Replicas" />
          <Row
            obj={item}
            objKey="spec.scaleTargetRef"
            title="Scale Target Ref"
            value={(scaleTargetRef: V2beta1CrossVersionObjectReference) => {
              return `${scaleTargetRef.apiVersion ? `${scaleTargetRef.apiVersion}/` : ''}${scaleTargetRef.kind}/${
                scaleTargetRef.name
              }`;
            }}
          />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.currentCPUUtilizationPercentage" title="Current CPU Utilization Percentage" />
          <Row obj={item} objKey="status.currentReplicas" title="Current Replicas" />
          <Row obj={item} objKey="status.desiredReplicas" title="Desired Replicas" />
          <Row obj={item} objKey="status.lastScaleTime" title="Last Scale Time" />
          <Row obj={item} objKey="status.observedGeneration" title="Observed Generation" />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.spec && item.spec.metrics && item.status && item.status.currentMetrics ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Metrics</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {item.spec.metrics.map((metric, index) => (
                    <MetricItem key={index} metric={metric} statuses={item.status?.currentMetrics} />
                  ))}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}

      {item.status && item.status.conditions ? (
        <IonRow>
          <Conditions conditions={item.status.conditions} forceFullWidth={true} />
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
    </IonGrid>
  );
};

export default HorizontalPodAutoscalerDetails;
