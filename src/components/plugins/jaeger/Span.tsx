import { IonChip, IonCol, IonGrid, IonItem, IonLabel, IonNote, IonRow } from '@ionic/react';
import React, { useState } from 'react';

import useWindowWidth from '../../../utils/useWindowWidth';
import { ISpan, IProcesses, formatTime } from './Trace';

interface ISpanProps {
  span: ISpan;
  processes: IProcesses;
  padding: number;
}

const Span: React.FunctionComponent<ISpanProps> = ({ span, processes, padding }: ISpanProps) => {
  const [showDetails, setShowDetails] = useState<boolean>(false);
  const width = useWindowWidth();

  return (
    <React.Fragment>
      <IonItem>
        <IonLabel class="ion-text-wrap" style={{ paddingLeft: `${padding}px` }}>
          <span style={{ cursor: 'pointer' }} onClick={() => setShowDetails(!showDetails)}>
            <h2>{processes[span.processID].serviceName}</h2>
            <h3>{span.operationName}</h3>
          </span>
          <p style={{ display: showDetails ? 'block' : 'none' }}>
            <IonGrid>
              <IonRow>
                <IonCol size="auto">
                  <b>Span ID:</b>
                </IonCol>
                <IonCol>{span.spanID}</IonCol>
              </IonRow>
              {width < 640 ? (
                <IonRow>
                  <IonCol size="auto">
                    <b>Duration:</b>
                  </IonCol>
                  <IonCol>{span.duration / 1000}ms</IonCol>
                </IonRow>
              ) : null}
              {processes.hasOwnProperty(span.processID) &&
              processes[span.processID].tags &&
              processes[span.processID].tags.length > 0 ? (
                <IonRow>
                  <IonCol size="auto">
                    <b>Process:</b>
                  </IonCol>
                  <IonCol>
                    {processes[span.processID].tags.map((tag, tagIndex) => (
                      <IonChip key={tagIndex} className="unset-chip-height">
                        {tag.key}={tag.value}
                      </IonChip>
                    ))}
                  </IonCol>
                </IonRow>
              ) : null}
              {span.tags && span.tags.length > 0 ? (
                <IonRow>
                  <IonCol size="auto">
                    <b>Tags:</b>
                  </IonCol>
                  <IonCol>
                    {span.tags.map((tag, tagIndex) => (
                      <IonChip key={tagIndex} className="unset-chip-height">
                        {tag.key}={tag.value}
                      </IonChip>
                    ))}
                  </IonCol>
                </IonRow>
              ) : null}
              {span.logs && span.logs.length > 0 ? (
                <IonRow>
                  <IonCol size="auto">
                    <b>Logs:</b>
                  </IonCol>
                  <IonCol>
                    <IonGrid>
                      {span.logs.map((log, logIndex) => (
                        <IonRow key={logIndex}>
                          <IonCol size="auto">
                            <b>{formatTime(Math.floor(log.timestamp / 1000))}:</b>
                          </IonCol>
                          <IonCol>
                            {log.fields.map((field, fieldIndex) => (
                              <IonChip key={fieldIndex} className="unset-chip-height">
                                {field.key}={field.value}
                              </IonChip>
                            ))}
                          </IonCol>
                        </IonRow>
                      ))}
                    </IonGrid>
                  </IonCol>
                </IonRow>
              ) : null}
            </IonGrid>
          </p>
        </IonLabel>
        {width >= 640 ? <IonNote slot="end">{span.duration / 1000}ms</IonNote> : null}
        {span.chartFill !== undefined && span.chartOffset !== undefined ? (
          <span
            style={{
              height: '5px',
              width: '100%',
              position: 'absolute',
              bottom: '0',
              left: '0',
            }}
          >
            <span
              style={{
                height: '5px',
                width: `${span.chartFill}%`,
                backgroundColor: '#326ce5',
                position: 'absolute',
                left: `${span.chartOffset}%`,
              }}
            ></span>
          </span>
        ) : null}
      </IonItem>

      {span.childs && span.childs.length > 0
        ? span.childs.map((child, index) => (
            <Span key={index} span={child} processes={processes} padding={padding + 25} />
          ))
        : null}
    </React.Fragment>
  );
};

export default Span;
