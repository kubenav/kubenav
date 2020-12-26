import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCol,
  IonGrid,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonProgressBar,
  IonRow,
  IonSegment,
  IonSegmentButton,
  IonSelect,
  IonSelectOption,
} from '@ionic/react';
import { V1PodList } from '@kubernetes/client-node';
import React, { useContext, useState } from 'react';

import { IContext } from '../../../declarations';
import { kubernetesRequest, pluginRequest } from '../../../utils/api';
import { IS_INCLUSTER } from '../../../utils/constants';
import { AppContext } from '../../../utils/context';
import ChartTraces from './ChartTraces';
import { ITrace } from './Trace';
import TraceModal from './TraceModal';

interface IResponse {
  data: ITrace[];
}

export interface IRequest {
  end: string;
  limit: string;
  lookback: string;
  maxDuration: string;
  minDuration: string;
  operation: string;
  service: string;
  start: string;
  tags: string;
}

interface ITracesProps {
  request: IRequest;
  services: string[];
  operations: string[];
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  handleRequest: (event: any) => void;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  handleRequestService: (event: any) => void;
}

const Traces: React.FunctionComponent<ITracesProps> = ({
  request,
  services,
  operations,
  handleRequest,
  handleRequestService,
}: ITracesProps) => {
  const context = useContext<IContext>(AppContext);

  const [activeSegment, setActiveSegment] = useState<string>('service');
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [traces, setTraces] = useState<ITrace[]>([]);
  const [error, setError] = useState<string>('');
  const [isFetching, setIsFetching] = useState<boolean>(false);

  const runQuery = async () => {
    try {
      setError('');
      setIsFetching(true);
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

      let st = '';
      let et = '';

      if (request.lookback === 'custom') {
        st = `${Date.parse(request.start)}000`;
        et = `${Date.parse(request.end)}000`;
      }

      const result: IResponse = await pluginRequest(
        'jaeger',
        context.settings.jaegerPort,
        context.settings.jaegerAddress,
        {
          type: 'traces',
          end: et,
          limit: request.limit,
          lookback: request.lookback,
          maxDuration: request.maxDuration,
          minDuration: request.minDuration,
          operation: request.operation,
          service: request.service,
          start: st,
          tags: request.tags,
          username: context.settings.jaegerUsername,
          password: context.settings.jaegerPassword,
          queryBasePath: context.settings.jaegerQueryBasePath,
        },
        portforwardingPath,
        context.settings,
        await context.kubernetesAuthWrapper(''),
      );

      setTraces(result.data);
      setIsFetching(false);
    } catch (err) {
      setIsFetching(false);
      setTraces([]);
      setError(err.message);
    }
  };

  return (
    <React.Fragment>
      {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}

      <IonGrid>
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardContent>
                <IonSegment value={activeSegment} onIonChange={(e) => setActiveSegment(e.detail.value as string)}>
                  <IonSegmentButton value="service">
                    <IonLabel>Service</IonLabel>
                  </IonSegmentButton>
                  <IonSegmentButton value="options">
                    <IonLabel>Options</IonLabel>
                  </IonSegmentButton>
                </IonSegment>

                {activeSegment === 'service' ? (
                  <IonGrid>
                    <IonRow>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="10" sizeXl="10">
                        {services.length > 0 ? (
                          <IonItem>
                            <IonLabel>Service</IonLabel>
                            <IonSelect
                              name="service"
                              value={request.service}
                              onIonChange={handleRequestService}
                              interface="popover"
                            >
                              {services.map((service, index) => (
                                <IonSelectOption key={index} value={service}>
                                  {service}
                                </IonSelectOption>
                              ))}
                            </IonSelect>
                          </IonItem>
                        ) : (
                          <IonItem>
                            <IonInput
                              type="text"
                              required={true}
                              placeholder="Service"
                              name="service"
                              value={request.service}
                              onIonChange={handleRequest}
                            />
                          </IonItem>
                        )}
                      </IonCol>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="2" sizeXl="2">
                        <IonButton expand="block" onClick={() => runQuery()}>
                          Search
                        </IonButton>
                      </IonCol>
                    </IonRow>
                  </IonGrid>
                ) : null}

                {activeSegment === 'options' ? (
                  <IonGrid>
                    <IonRow>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
                        <IonItem>
                          <IonLabel position="stacked">Operation</IonLabel>
                          <IonSelect
                            name="operation"
                            value={request.operation}
                            onIonChange={handleRequest}
                            interface="popover"
                          >
                            <IonSelectOption value="">all</IonSelectOption>
                            {operations.map((operation, index) => (
                              <IonSelectOption key={index} value={operation}>
                                {operation}
                              </IonSelectOption>
                            ))}
                          </IonSelect>
                        </IonItem>
                      </IonCol>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
                        <IonItem>
                          <IonLabel position="stacked">Tags</IonLabel>
                          <IonInput
                            type="text"
                            required={true}
                            placeholder="http.status_code=200 error=true"
                            name="tags"
                            value={request.tags}
                            onIonChange={handleRequest}
                          />
                        </IonItem>
                      </IonCol>
                    </IonRow>
                    <IonRow>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="4" sizeLg="4" sizeXl="4">
                        <IonItem>
                          <IonLabel position="stacked">Lookback</IonLabel>
                          <IonSelect
                            name="lookback"
                            value={request.lookback}
                            onIonChange={handleRequest}
                            interface="popover"
                          >
                            <IonSelectOption value="1h">Last Hour</IonSelectOption>
                            <IonSelectOption value="2h">Last 2 Hours</IonSelectOption>
                            <IonSelectOption value="3h">Last 3 Hours</IonSelectOption>
                            <IonSelectOption value="6h">Last 6 Hours</IonSelectOption>
                            <IonSelectOption value="12h">Last 12 Hours</IonSelectOption>
                            <IonSelectOption value="24h">Last 24 Hours</IonSelectOption>
                            <IonSelectOption value="48h">Last 2 Days</IonSelectOption>
                            <IonSelectOption value="custom">Custom</IonSelectOption>
                          </IonSelect>
                        </IonItem>
                      </IonCol>
                      {request.lookback === 'custom' ? (
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="4" sizeLg="4" sizeXl="4">
                          <IonItem>
                            <IonLabel position="stacked">Start Time</IonLabel>
                            <IonInput
                              type="text"
                              required={true}
                              placeholder="2020-12-24T15:00:00Z"
                              name="start"
                              value={request.start}
                              onIonChange={handleRequest}
                            />
                          </IonItem>
                        </IonCol>
                      ) : null}
                      {request.lookback === 'custom' ? (
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="4" sizeLg="4" sizeXl="4">
                          <IonItem>
                            <IonLabel position="stacked">End Time</IonLabel>
                            <IonInput
                              type="text"
                              required={true}
                              placeholder="2020-12-24T16:00:00Z"
                              name="end"
                              value={request.end}
                              onIonChange={handleRequest}
                            />
                          </IonItem>
                        </IonCol>
                      ) : null}
                    </IonRow>
                    <IonRow>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="4" sizeLg="4" sizeXl="4">
                        <IonItem>
                          <IonLabel position="stacked">Min Duration</IonLabel>
                          <IonInput
                            type="text"
                            required={true}
                            placeholder="100ms"
                            name="minDuration"
                            value={request.minDuration}
                            onIonChange={handleRequest}
                          />
                        </IonItem>
                      </IonCol>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="4" sizeLg="4" sizeXl="4">
                        <IonItem>
                          <IonLabel position="stacked">Max Duration</IonLabel>
                          <IonInput
                            type="text"
                            required={true}
                            placeholder="100ms"
                            name="maxDuration"
                            value={request.maxDuration}
                            onIonChange={handleRequest}
                          />
                        </IonItem>
                      </IonCol>
                      <IonCol sizeXs="12" sizeSm="12" sizeMd="4" sizeLg="4" sizeXl="4">
                        <IonItem>
                          <IonLabel position="stacked">Limit</IonLabel>
                          <IonInput
                            type="text"
                            required={true}
                            name="limit"
                            value={request.limit}
                            onIonChange={handleRequest}
                          />
                        </IonItem>
                      </IonCol>
                    </IonRow>
                  </IonGrid>
                ) : null}
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>

        {traces.length > 0 ? (
          <IonRow>
            <IonCol>
              <IonCard>
                <IonCardContent>
                  <ChartTraces traces={traces} />
                </IonCardContent>
              </IonCard>
            </IonCol>
          </IonRow>
        ) : null}

        {error || traces.length > 0 ? (
          <IonRow>
            <IonCol>
              <IonCard>
                <IonCardContent>
                  {error ? (
                    error
                  ) : (
                    <IonList>
                      {traces.map((trace, index) => (
                        <TraceModal key={index} trace={trace} />
                      ))}
                    </IonList>
                  )}
                </IonCardContent>
              </IonCard>
            </IonCol>
          </IonRow>
        ) : null}
      </IonGrid>
    </React.Fragment>
  );
};

export default Traces;
