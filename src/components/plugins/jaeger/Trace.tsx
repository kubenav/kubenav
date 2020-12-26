import { IonCard, IonCardContent, IonCol, IonGrid, IonList, IonRow } from '@ionic/react';
import React from 'react';

import ChartSpans from './ChartSpans';
import Span from './Span';

export interface IKeyValue {
  key: string;
  type: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  value: any;
}

export interface ILog {
  timestamp: number;
  fields: IKeyValue[];
}

export interface IProcess {
  serviceName: string;
  tags: IKeyValue[];
}

export interface IProcesses {
  [key: string]: IProcess;
}

export interface IReference {
  refType: string;
  spanID: string;
  traceID: string;
}

export interface ISpan {
  traceID: string;
  spanID: string;
  flags: number;
  operationName: string;
  references: IReference[];
  startTime: number;
  duration: number;
  tags: IKeyValue[];
  logs: ILog[];
  processID: string;
  chartOffset?: number;
  chartFill?: number;
  childs?: ISpan[];
}

export interface ITrace {
  traceID: string;
  spans: ISpan[];
  processes: IProcesses;
}

export interface ITraceProps {
  trace: ITrace;
}

export const getDuration = (spans: ISpan[]): number => {
  const startTimes: number[] = [];
  const endTimes: number[] = [];

  for (const span of spans) {
    startTimes.push(span.startTime);
    endTimes.push(span.startTime + span.duration);
  }

  return (Math.max(...endTimes) - Math.min(...startTimes)) / 1000;
};

export const traceTitle = (trace: ITrace): string => {
  return `${
    trace.processes.hasOwnProperty(trace.spans[0].processID)
      ? `${trace.processes[trace.spans[0].processID].serviceName}: `
      : ''
  }${trace.spans && trace.spans.length > 0 ? trace.spans[0].operationName : ''} (${trace.traceID})`;
};

export const formatTime = (time: number): string => {
  const d = new Date(time);
  return `${d.getFullYear()}-${('0' + (d.getMonth() + 1)).slice(-2)}-${('0' + d.getDate()).slice(-2)} ${(
    '0' + d.getHours()
  ).slice(-2)}:${('0' + d.getMinutes()).slice(-2)}:${('0' + d.getSeconds()).slice(-2)}.${(
    '0' + d.getMilliseconds()
  ).slice(-3)}`;
};

const createTree = (spans: ISpan[], traceStartTime: number, duration: number): ISpan[] => {
  const map = {};
  const roots: ISpan[] = [];

  for (let i = 0; i < spans.length; i++) {
    map[spans[i].spanID] = i;
    spans[i].childs = [];

    spans[i].chartOffset = ((spans[i].startTime - traceStartTime) / 1000 / duration) * 100;
    spans[i].chartFill = (spans[i].duration / 1000 / duration) * 100;
  }

  for (let i = 0; i < spans.length; i++) {
    const span = spans[i];

    if (span.references && span.references.length > 0) {
      const ref = span.references.filter((reference) => reference.refType === 'CHILD_OF');

      if (ref.length > 0 && map.hasOwnProperty(ref[0].spanID)) {
        spans[map[ref[0].spanID]].childs?.push(span);
      }
    } else {
      roots.push(span);
    }
  }

  return roots;
};

const Trace: React.FunctionComponent<ITraceProps> = ({ trace }: ITraceProps) => {
  const duration = getDuration(trace.spans);
  const rootSpans: ISpan[] = createTree(trace.spans, trace.spans[0].startTime, duration);

  return (
    <IonGrid>
      <IonRow>
        <IonCol>
          <IonCard>
            <IonCardContent>
              <b>Start Time: </b>
              {trace.spans && trace.spans.length > 0 ? formatTime(Math.floor(trace.spans[0].startTime / 1000)) : ''}
              &nbsp;&nbsp;&nbsp;
              <b>Duration: </b>
              {trace.spans && trace.spans.length > 0 ? `${duration}ms` : '0ms'}
              &nbsp;&nbsp;&nbsp;
              <b>Services: </b>
              {trace.processes ? Object.keys(trace.processes).length : 0}
              &nbsp;&nbsp;&nbsp;
              <b>Spans: </b>
              {trace.spans ? trace.spans.length : 0}
              &nbsp;&nbsp;&nbsp;
              <b>Trace ID: </b>
              {trace.traceID}
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>

      {trace.spans && trace.spans.length > 0 ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardContent>
                <ChartSpans spans={trace.spans} />
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}

      {trace.spans && trace.spans.length > 0 ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardContent>
                <IonList>
                  {rootSpans.map((span, index) => (
                    <Span key={index} span={span} processes={trace.processes} padding={0} />
                  ))}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default Trace;
