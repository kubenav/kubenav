import { IonCardContent, IonCardHeader, IonCardTitle, IonCol } from '@ionic/react';
import React from 'react';

import IonCardEqualHeight from '../../misc/IonCardEqualHeight';
import ChartDetailsArea, { IPrometheusResult } from './ChartDetailsArea';

export interface IPrometheusQuery {
  label: string;
  query: string;
}

export interface IChartSize {
  xs: string;
  sm: string;
  md: string;
  lg: string;
  xl: string;
}

export interface IChartMetaData {
  title: string;
  size: IChartSize;
  type: string;
}

export interface IChart extends IChartMetaData {
  queries: IPrometheusQuery[];
}

export interface IChartResult extends IChartMetaData {
  results: IPrometheusResult[] | null;
}

interface IChartProps {
  timeDiff: number;
  chart: IChartResult;
}

const Chart: React.FunctionComponent<IChartProps> = ({ timeDiff, chart }: IChartProps) => {
  return (
    <IonCol
      sizeXs={chart.size.xs}
      sizeSm={chart.size.xs}
      sizeMd={chart.size.md}
      sizeLg={chart.size.lg}
      sizeXl={chart.size.xl}
    >
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>{chart.title}</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          {chart.type === 'area' && chart.results ? (
            <ChartDetailsArea timeDiff={timeDiff} results={chart.results} />
          ) : null}
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  );
};

export default Chart;
