import { IonCardContent, IonCardHeader, IonCardTitle, IonCol } from '@ionic/react';
import React from 'react';

import IonCardEqualHeight from '../../misc/IonCardEqualHeight';
import ChartDetailsArea, { IPrometheusResult } from './ChartDetailsArea';
import ChartDetailsSinglestat from './ChartDetailsSinglestat';

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
  unit: string;
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
      sizeXs={chart.size.xs ? chart.size.xs : '12'}
      sizeSm={chart.size.xs ? chart.size.xs : '12'}
      sizeMd={chart.size.md ? chart.size.md : '12'}
      sizeLg={chart.size.lg ? chart.size.lg : '12'}
      sizeXl={chart.size.xl ? chart.size.xl : '12'}
    >
      <IonCardEqualHeight>
        <IonCardHeader>
          <IonCardTitle>{chart.title}</IonCardTitle>
        </IonCardHeader>
        <IonCardContent>
          {chart.type === 'area' && chart.results ? (
            <ChartDetailsArea unit={chart.unit} timeDiff={timeDiff} results={chart.results} />
          ) : chart.type === 'singlestat' && chart.results ? (
            <ChartDetailsSinglestat unit={chart.unit} results={chart.results} />
          ) : null}
        </IonCardContent>
      </IonCardEqualHeight>
    </IonCol>
  );
};

export default Chart;
