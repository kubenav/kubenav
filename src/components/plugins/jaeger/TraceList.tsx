import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import React from 'react';

interface ITrace {
  title: string;
  service: string;
  operation: string;
  tags: string;
  lookback: string;
  maxDuration: string;
  minDuration: string;
  limit: string;
}

interface ITraceListProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const TraceList: React.FunctionComponent<ITraceListProps> = ({ item }: ITraceListProps) => {
  const traces: ITrace[] = [];
  let error = '';

  try {
    if (item && item.metadata && item.metadata.annotations && item.metadata.annotations['kubenav.io/jaeger-traces']) {
      const parsedTraces: ITrace[] = JSON.parse(item.metadata.annotations['kubenav.io/jaeger-traces']);

      for (const trace of parsedTraces) {
        if (trace.title && trace.service) {
          traces.push({
            title: trace.title,
            service: trace.service,
            operation: trace.operation ? trace.operation : '',
            tags: trace.tags ? trace.tags : '',
            lookback: trace.lookback ? trace.lookback : '1h',
            minDuration: trace.minDuration ? trace.minDuration : '',
            maxDuration: trace.maxDuration ? trace.maxDuration : '',
            limit: trace.limit ? trace.limit : '20',
          });
        }
      }
    }
  } catch (err) {
    error = err.message;
  }

  if (traces.length > 0 || error) {
    return (
      <IonRow>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Jaeger Traces</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              {error ? (
                `Could not load traces: ${error}`
              ) : (
                <IonList>
                  {traces.map((trace: ITrace, index) => {
                    return (
                      <IonItem
                        key={index}
                        routerLink={`/plugins/jaeger?service=${trace.service}&operation=${trace.operation}&tags=${trace.tags}&lookback=${trace.lookback}&minDuration=${trace.minDuration}&maxDuration=${trace.maxDuration}&limit=${trace.limit}`}
                        routerDirection="forward"
                      >
                        <IonLabel class="ion-text-wrap">
                          <h2>{trace.title}</h2>
                          <p>
                            <b>Service:</b> {trace.service} <b>Lookback:</b> {trace.lookback} <b>Limit:</b>{' '}
                            {trace.limit}
                            {trace.operation ? (
                              <span>
                                {' '}
                                <b>Operation:</b> {trace.operation}
                              </span>
                            ) : null}
                            {trace.tags ? (
                              <span>
                                {' '}
                                <b>Tags:</b> {trace.tags}
                              </span>
                            ) : null}
                            {trace.minDuration ? (
                              <span>
                                {' '}
                                <b>Min. Duration:</b> {trace.minDuration}
                              </span>
                            ) : null}
                            {trace.maxDuration ? (
                              <span>
                                {' '}
                                <b>Max. Duration:</b> {trace.maxDuration}
                              </span>
                            ) : null}
                          </p>
                        </IonLabel>
                      </IonItem>
                    );
                  })}
                </IonList>
              )}
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>
    );
  } else {
    return null;
  }
};

export default TraceList;
