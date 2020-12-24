import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { V1PodList } from '@kubernetes/client-node';
import React, { memo, useContext, useState } from 'react';
import { useQuery } from 'react-query';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../declarations';
import { kubernetesRequest, pluginRequest } from '../../../utils/api';
import { IS_INCLUSTER } from '../../../utils/constants';
import { AppContext } from '../../../utils/context';
import Details from './Details';
import Traces, { IRequest } from './Traces';

interface IOperation {
  name: string;
  spanKind: string;
}

interface IOptions {
  services: string[];
  operations: IOperation[];
}

type ITracesPageProps = RouteComponentProps;

const TracesPage: React.FunctionComponent<ITracesPageProps> = ({ location }: ITracesPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const url = new URLSearchParams(location.search);

  const [request, setRequest] = useState<IRequest>({
    end: '',
    limit: url.get('limit') ? (url.get('limit') as string) : '20',
    lookback: url.get('lookback') ? (url.get('lookback') as string) : '1h',
    maxDuration: url.get('maxDuration') ? (url.get('maxDuration') as string) : '',
    minDuration: url.get('minDuration') ? (url.get('minDuration') as string) : '',
    operation: url.get('operation') ? (url.get('operation') as string) : '',
    service: url.get('service') ? (url.get('service') as string) : '',
    start: '',
    tags: url.get('tags') ? (url.get('tags') as string) : '',
  });

  const { isFetching, data, refetch } = useQuery<IOptions, Error>(
    ['JaegerTracesPage', cluster ? cluster.id : ''],
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

        const result: IOptions = await pluginRequest(
          'jaeger',
          context.settings.jaegerPort,
          context.settings.jaegerAddress,
          {
            type: 'operations',
            service: request.service,
            username: context.settings.jaegerUsername,
            password: context.settings.jaegerPassword,
            queryBasePath: context.settings.jaegerQueryBasePath,
          },
          portforwardingPath,
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        if (result && result.services && result.services.length > 0 && request.service === '') {
          setRequest({ ...request, service: result.services[0] });
        }

        return result;
      } catch (err) {
        throw err;
      }
    },
    context.settings.queryConfig,
  );

  const handleRequest = (event) => {
    setRequest({ ...request, [event.target.name]: event.detail.value });
  };

  // For the service we need this additional function, to trigger a refetch, when the services was selected via the
  // select field. This allows us to fetch all operations for a selected service.
  // When the service name is changed via the input field, we do not want to trigger a refetch after each key. This
  // means that the user has to manually initialize the refetch to get all operations.
  const handleRequestService = (event) => {
    setRequest({ ...request, [event.target.name]: event.detail.value });
    refetch();
  };

  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    refetch();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
            <IonBackButton />
          </IonButtons>
          <IonTitle>Jaeger</IonTitle>
          <IonButtons slot="primary">
            <Details refresh={refetch} />
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        <Traces
          request={request}
          services={data && data.services && data.services.length > 0 ? data.services : []}
          operations={
            data && data.operations && data.operations.length > 0 ? data.operations.map((service) => service.name) : []
          }
          handleRequest={handleRequest}
          handleRequestService={handleRequestService}
        />
      </IonContent>
    </IonPage>
  );
};

export default memo(TracesPage, (): boolean => {
  return true;
});
