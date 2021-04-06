import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { V1PodList } from '@kubernetes/client-node';
import React, { memo, useContext } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../declarations';
import { kubernetesRequest, pluginRequest } from '../../../utils/api';
import { IS_INCLUSTER } from '../../../utils/constants';
import { AppContext } from '../../../utils/context';
import LoadingErrorCard from '../../misc/LoadingErrorCard';
import Details from './Details';
import Trace, { ITrace, traceTitle } from './Trace';

interface IResponse {
  data: ITrace[];
}

interface IMatchParams {
  trace: string;
}

type ITracePageProps = RouteComponentProps<IMatchParams>;

const TracePage: React.FunctionComponent<ITracePageProps> = ({ match }: ITracePageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const { isError, isFetching, data, error, refetch } = useQuery<ITrace, Error>(
    ['JaegerTracePage', cluster ? cluster.id : '', match.params.trace],
    async () => {
      try {
        let portforwardingPath = '';

        if (!IS_INCLUSTER) {
          const podList: V1PodList = await kubernetesRequest(
            'GET',
            `/api/v1/namespaces/${context.settings.jaegerNamespace}/pods?labelSelector=${context.settings.jaegerSelector}`,
            '',
            context.settings,
            await context.kubernetesAuthWrapper(''),
          );

          if (podList.items.length > 0 && podList.items[0].metadata) {
            portforwardingPath = `/api/v1/namespaces/${podList.items[0].metadata.namespace}/pods/${podList.items[0].metadata.name}/portforward`;
          } else {
            throw new Error(
              `Could not find Pod in Namespace "${context.settings.jaegerNamespace}" with selector "${context.settings.jaegerSelector}".`,
            );
          }
        }

        const result: IResponse = await pluginRequest(
          'jaeger',
          context.settings.jaegerPort,
          context.settings.jaegerAddress,
          {
            type: 'trace',
            trace: match.params.trace,
            username: context.settings.jaegerUsername,
            password: context.settings.jaegerPassword,
            queryBasePath: context.settings.jaegerQueryBasePath,
          },
          portforwardingPath,
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        if (result.data && result.data.length > 0) {
          return result.data[0];
        } else {
          throw new Error('Could not find trace.');
        }
      } catch (err) {
        throw err;
      }
    },
    context.settings.queryConfig,
  );

  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    refetch();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton defaultHref="/plugins/jaeger" />
          </IonButtons>
          <IonTitle>{data ? traceTitle(data) : ''}</IonTitle>
          <IonButtons slot="primary">
            <Details refresh={refetch} />
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!isError && cluster && data ? (
          <Trace trace={data} />
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error as Error}
            icon="/assets/icons/kubernetes/jaeger.png"
            text="Could not get Trace"
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(TracePage, (): boolean => {
  return true;
});
