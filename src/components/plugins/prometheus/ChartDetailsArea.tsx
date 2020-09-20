import { IonCol, IonRow } from '@ionic/react';
import React, { useContext } from 'react';
import { Area, AreaChart, Legend, ResponsiveContainer, XAxis, YAxis } from 'recharts';

import { IContext } from '../../../declarations';
import { AppContext } from '../../../utils/context';
import { isDarkMode } from '../../../utils/helpers';

const colorsLight = [
  '#10dc60',
  '#ffce00',
  '#f04141',
  '#0cd1e8',
  '#7044ff',
  '#326ce5',
  '#28e070',
  '#ffd31a',
  '#f25454',
  '#24d6ea',
  '#7e57ff',
  '#477be8',
];

const colorsDark = [
  '#2fdf75',
  '#ffd534',
  '#ff4961',
  '#50c8ff',
  '#6a64ff',
  '#326ce5',
  '#44e283',
  '#ffd948',
  '#ff5b71',
  '#62ceff',
  '#7974ff',
  '#477be8',
];

const getColor = (index: number, darkMode: boolean): string => {
  const colors = darkMode ? colorsDark : colorsLight;
  return colors[index % colors.length];
};

export interface IPrometheusResult {
  label: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  values: any[][];
}

interface IChartDetailsAreaProps {
  timeDiff: number;
  results: IPrometheusResult[];
}

const ChartDetailsArea: React.FunctionComponent<IChartDetailsAreaProps> = ({
  timeDiff,
  results,
}: IChartDetailsAreaProps) => {
  const context = useContext<IContext>(AppContext);

  // formatTime is use to formate the shown values for the x axis. If the user selected a time span lower then 24h we
  // are showing the "hh:mm" for timespans larger then 24h we are showing "MM/DD hh:mm".
  const formatTime = (time: number): string => {
    const d = new Date(time * 1000);

    if (timeDiff >= 86400) {
      return `${('0' + (d.getMonth() + 1)).slice(-2)}/${('0' + d.getDate()).slice(-2)} ${('0' + d.getHours()).slice(
        -2,
      )}:${('0' + d.getMinutes()).slice(-2)}`;
    } else {
      return `${('0' + d.getHours()).slice(-2)}:${('0' + d.getMinutes()).slice(-2)}`;
    }
  };

  // The series variables contains the transformed Prometheus results. This is necessary, because the returned formate
  // from Prometheus can not directly used with Recharts.
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const series: any = [];

  for (let i = 0; i < results.length; i++) {
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const data: any = [];
    for (let j = 0; j < results[i].values.length; j++) {
      data.push({
        time: results[i].values[j][0],
        value: parseFloat(results[i].values[j][1]),
      });
    }
    series.push({ name: results[i].label, data: data });
  }

  return (
    <IonRow style={{ height: '300px', width: '100%' }}>
      <IonCol style={{ padding: '0px' }}>
        <ResponsiveContainer>
          <AreaChart>
            <XAxis
              dataKey="time"
              scale="time"
              type="number"
              domain={['dataMin', 'dataMax']}
              tickFormatter={formatTime}
            />
            <YAxis dataKey="value" />
            <Legend />
            {series.map((serie, index) => (
              <Area
                key={index}
                dataKey="value"
                data={serie.data}
                name={serie.name}
                stroke={getColor(index, isDarkMode(context.settings.theme))}
                fill={getColor(index, isDarkMode(context.settings.theme))}
                fillOpacity={0.2}
              />
            ))}
          </AreaChart>
        </ResponsiveContainer>
      </IonCol>
    </IonRow>
  );
};

export default ChartDetailsArea;
