import { IonCol, IonRow } from '@ionic/react';
import React from 'react';
import { Bar, ComposedChart, ResponsiveContainer, XAxis } from 'recharts';

import { ISpan } from './Trace';

interface IData {
  time: number;
  offset: number;
}

interface IChartSpansProps {
  spans: ISpan[];
}

const ChartSpans: React.FunctionComponent<IChartSpansProps> = ({ spans }: IChartSpansProps) => {
  const traceStartTime = spans[0].startTime;
  const data: IData[] = [];

  for (const span of spans) {
    const offset = span.startTime - traceStartTime;
    data.push({
      time: span.duration / 1000,
      offset: offset / 1000,
    });
  }

  return (
    <IonRow style={{ minHeight: `50px`, width: '100%' }}>
      <IonCol style={{ padding: '0px' }}>
        <ResponsiveContainer>
          <ComposedChart layout="vertical" data={data} barSize={2}>
            <XAxis type="number" hide={true} domain={['dataMin', 'dataMax']} />
            <Bar stackId="span" dataKey="offset" fill="#326ce5" fillOpacity={0} isAnimationActive={false} />
            <Bar stackId="span" dataKey="time" fill="#326ce5" isAnimationActive={false} />
          </ComposedChart>
        </ResponsiveContainer>
      </IonCol>
    </IonRow>
  );
};

export default ChartSpans;
