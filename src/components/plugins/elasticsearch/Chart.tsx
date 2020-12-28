import { IonCol, IonRow, isPlatform } from '@ionic/react';
import React, { useContext } from 'react';
import { Bar, BarChart, ResponsiveContainer, Tooltip, XAxis } from 'recharts';

import { IContext } from '../../../declarations';
import { AppContext } from '../../../utils/context';
import { isDarkMode } from '../../../utils/helpers';

export interface IBucket {
  // eslint-disable-next-line @typescript-eslint/naming-convention
  key_as_string: string;
  key: number;
  // eslint-disable-next-line @typescript-eslint/naming-convention
  doc_count: number;
}

export interface ILogCount {
  buckets: IBucket[];
  interval: string;
}

export interface IAggregations {
  logcount: ILogCount;
}

export interface IPrometheusResult {
  label: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  values: any[][];
}

interface IChartProps {
  aggregations: IAggregations;
}

const Chart: React.FunctionComponent<IChartProps> = ({ aggregations }: IChartProps) => {
  const context = useContext<IContext>(AppContext);

  const formatTime = (time: number): string => {
    const d = new Date(time);
    return `${('0' + (d.getMonth() + 1)).slice(-2)}/${('0' + d.getDate()).slice(-2)} ${('0' + d.getHours()).slice(
      -2,
    )}:${('0' + d.getMinutes()).slice(-2)}`;
  };

  return (
    <IonRow style={{ height: '200px', width: '100%' }}>
      <IonCol style={{ padding: '0px' }}>
        <ResponsiveContainer>
          <BarChart data={aggregations.logcount.buckets}>
            <XAxis
              dataKey="key"
              scale="time"
              type="number"
              domain={['dataMin', 'dataMax']}
              tickFormatter={formatTime}
            />
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
                formatter={(value) => {
                  return [value, 'Count'];
                }}
                labelFormatter={formatTime}
              />
            ) : null}
            <Bar dataKey="doc_count" stroke="#326ce5" fill="#326ce5" />
          </BarChart>
        </ResponsiveContainer>
      </IonCol>
    </IonRow>
  );
};

export default Chart;
