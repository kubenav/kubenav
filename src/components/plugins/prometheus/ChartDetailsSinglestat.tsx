import { IonCol, IonRow, isPlatform } from '@ionic/react';
import React, { useContext } from 'react';
import { Area, AreaChart, ResponsiveContainer } from 'recharts';

import { IContext } from '../../../declarations';
import { AppContext } from '../../../utils/context';
import { isDarkMode } from '../../../utils/helpers';
import { IPrometheusResult } from './ChartDetailsArea';

interface IChartDetailsSinglestatProps {
  unit: string;
  results: IPrometheusResult[];
}

const ChartDetailsSinglestat: React.FunctionComponent<IChartDetailsSinglestatProps> = ({
  unit,
  results,
}: IChartDetailsSinglestatProps) => {
  const context = useContext<IContext>(AppContext);

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
    <IonRow
      style={{
        fontSize: '20px',
        fontWeight: 500,
        color: isDarkMode(context.settings.theme)
          ? isPlatform('ios')
            ? '#ffffff'
            : '#dbdbdb'
          : isPlatform('ios')
          ? '#000000'
          : '#262626',
        height: '100px',
        width: '100%',
      }}
    >
      {series.length > 0 ? (
        <div
          style={{
            margin: 'auto',
            left: 0,
            right: 0,
            top: 40,
            position: 'absolute',
            display: 'flex',
            justifyContent: 'center',
            zIndex: 1000,
          }}
        >
          {series[0].data[series[0].data.length - 1].value.toFixed(2)} {unit ? unit : ''}
        </div>
      ) : null}
      <IonCol style={{ padding: '0px' }}>
        <ResponsiveContainer>
          <AreaChart>
            {series.map((serie, index) => (
              <Area
                key={index}
                dataKey="value"
                data={serie.data}
                name={serie.name}
                stroke="#326ce5"
                fill="#326ce5"
                fillOpacity={0.2}
              />
            ))}
          </AreaChart>
        </ResponsiveContainer>
      </IonCol>
    </IonRow>
  );
};

export default ChartDetailsSinglestat;
