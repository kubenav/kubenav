import { IonCol, IonRow, isPlatform } from '@ionic/react';
import React, { useContext } from 'react';
import { ResponsiveContainer, Scatter, ScatterChart, Tooltip, XAxis, YAxis, ZAxis } from 'recharts';
import DefaultTooltipContent from 'recharts/lib/component/DefaultTooltipContent';

import { IContext } from '../../../declarations';
import { AppContext } from '../../../utils/context';
import { isDarkMode } from '../../../utils/helpers';
import { ITrace, getDuration, traceTitle } from './Trace';

interface IData {
  name: string;
  time: number;
  duration: number;
  spans: number;
}

interface IChartTracesProps {
  traces: ITrace[];
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const CustomTooltipContent = (props: any) => {
  if (props.payload && props.payload.length > 0) {
    for (let index = 0; index < props.payload.length; index++) {
      props.payload[index].color = '#326ce5';
    }

    return <DefaultTooltipContent {...props} label={props.payload[0].payload.name} />;
  }
  return <DefaultTooltipContent {...props} />;
};

const ChartTraces: React.FunctionComponent<IChartTracesProps> = ({ traces }: IChartTracesProps) => {
  const context = useContext<IContext>(AppContext);

  const data: IData[] = [];

  for (const trace of traces) {
    if (trace.spans.length > 0) {
      data.push({
        name: traceTitle(trace),
        time: Math.floor(trace.spans[0].startTime / 1000),
        duration: getDuration(trace.spans),
        spans: trace.spans.length,
      });
    }
  }

  const formatTime = (time: number): string => {
    const d = new Date(time);
    return `${('0' + d.getHours()).slice(-2)}:${('0' + d.getMinutes()).slice(-2)}:${('0' + d.getSeconds()).slice(
      -2,
    )}.${('0' + d.getMilliseconds()).slice(-3)}`;
  };

  return (
    <IonRow style={{ height: '200px', width: '100%' }}>
      <IonCol style={{ padding: '0px' }}>
        <ResponsiveContainer>
          <ScatterChart>
            <XAxis
              dataKey="time"
              scale="time"
              type="number"
              name="Time"
              domain={['dataMin', 'dataMax']}
              tickFormatter={formatTime}
            />
            <YAxis type="number" name="Duration" dataKey="duration" unit="ms" />
            <ZAxis type="number" name="Spans" dataKey="spans" range={[100, 1000]} />
            {!isPlatform('hybrid') ? (
              <Tooltip
                cursor={{ stroke: '#949494', strokeWidth: 2 }}
                contentStyle={
                  isDarkMode(context.settings.theme)
                    ? isPlatform('ios')
                      ? { backgroundColor: '1c1c1c', borderColor: '#949494' }
                      : { backgroundColor: '#1A1B1E', borderColor: '#949494' }
                    : { backgroundColor: '#ffffff', borderColor: '#949494' }
                }
                content={<CustomTooltipContent />}
                formatter={(value, name) => {
                  if (name === 'Name') {
                    return [value];
                  } else if (name === 'Time') {
                    return [formatTime(value), 'Time'];
                  } else {
                    return [value, name];
                  }
                }}
              />
            ) : null}
            <Scatter data={data} stroke="#326ce5" fill="#326ce5" shape="circle" />
          </ScatterChart>
        </ResponsiveContainer>
      </IonCol>
    </IonRow>
  );
};

export default ChartTraces;
