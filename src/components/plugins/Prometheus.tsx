import { IonButton, IonCardContent, IonCol, IonProgressBar, IonRow, IonSelect, IonSelectOption } from '@ionic/react';
import { V1PodList } from '@kubernetes/client-node';
import React, { memo, useContext, useEffect, useState } from 'react';
import { Area, AreaChart, Legend, ResponsiveContainer, XAxis, YAxis } from 'recharts';

import { IContext } from '../../declarations';
import { kubernetesRequest, pluginRequest } from '../../utils/api';
import { AppContext } from '../../utils/context';
import useAsyncFn from '../../utils/useAsyncFn';

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

interface IPluginPrometheusResult {
  label: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  values: any[][];
}

interface IPrometheusQuery {
  label: string;
  query: string;
}

interface IPrometheusProps {
  queries: IPrometheusQuery[];
}

const Prometheus: React.FunctionComponent<IPrometheusProps> = ({ queries }: IPrometheusProps) => {
  const context = useContext<IContext>(AppContext);

  // By default we are rendering the data for the last 1 hour. The intervall can be changed via an IonSelect field,
  // which retriggered the "fetch" function to get the new Prometheus data.
  const [timeDiff, setTimeDiff] = useState<number>(3600);

  // Get all Pods, which are matching the defined namespace and selector from the settings. When we find a Pod, this Pod
  // is used to fetch the metrics. Therefor we are sending the query to the Pod details and the Prometheus query to the
  // plugins API. To get the results, the server sends the query to the Pod via Port-Forwarding.
  // The returned Prometheus results are transformed for Recharts (recharts.org) and then rendered as Area chart.
  const [state, fetch] = useAsyncFn(
    async () => {
      try {
        const podList: V1PodList = await kubernetesRequest(
          'GET',
          `/api/v1/namespaces/${context.settings.prometheusNamespace}/pods?labelSelector=${context.settings.prometheusSelector}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        if (podList.items.length > 0 && podList.items[0].metadata) {
          const prometheusResults: IPluginPrometheusResult[] = await pluginRequest(
            'prometheus',
            context.settings.prometheusPort,
            {
              queries: queries,
              start: Math.floor(Date.now() / 1000) - timeDiff,
              end: Math.floor(Date.now() / 1000),
            },
            `/api/v1/namespaces/${podList.items[0].metadata.namespace}/pods/${podList.items[0].metadata.name}/portforward`,
            await context.kubernetesAuthWrapper(''),
          );

          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const series: any = [];

          for (let i = 0; i < prometheusResults.length; i++) {
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            const data: any = [];
            for (let j = 0; j < prometheusResults[i].values.length; j++) {
              data.push({
                time: prometheusResults[i].values[j][0],
                value: parseFloat(prometheusResults[i].values[j][1]),
              });
            }
            series.push({ name: prometheusResults[i].label, data: data });
          }

          return series;
        } else {
          throw new Error(
            `Could not found pod in namespace "${context.settings.prometheusNamespace}" with selector "${context.settings.prometheusSelector}".`,
          );
        }
      } catch (err) {
        throw err;
      }
    },
    [queries, timeDiff],
    { loading: true, error: undefined, value: undefined },
  );

  useEffect(() => {
    fetch();
  }, [fetch]);

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

  return (
    <IonCardContent>
      {state.loading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
      {!state.error && state.value ? (
        <div>
          <IonRow>
            <IonCol style={{ padding: '0px' }}>
              <IonSelect style={{ float: 'right' }} value={timeDiff} onIonChange={(e) => setTimeDiff(e.detail.value)}>
                <IonSelectOption value={300}>Last 5 minutes</IonSelectOption>
                <IonSelectOption value={900}>Last 15 minutes</IonSelectOption>
                <IonSelectOption value={1800}>Last 30 minutes</IonSelectOption>
                <IonSelectOption value={3600}>Last 1 hour</IonSelectOption>
                <IonSelectOption value={10800}>Last 3 hours</IonSelectOption>
                <IonSelectOption value={21600}>Last 6 hours</IonSelectOption>
                <IonSelectOption value={43200}>Last 12 hours</IonSelectOption>
                <IonSelectOption value={86400}>Last 24 hours</IonSelectOption>
                <IonSelectOption value={172800}>Last 2 days</IonSelectOption>
                <IonSelectOption value={604800}>Last 7 days</IonSelectOption>
                <IonSelectOption value={2592000}>Last 30 days</IonSelectOption>
              </IonSelect>
            </IonCol>
          </IonRow>

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
                  {state.value.map((serie, index) => (
                    <Area
                      key={index}
                      dataKey="value"
                      data={serie.data}
                      name={serie.name}
                      stroke={context.settings.darkMode ? colorsDark[index] : colorsLight[index]}
                      fill={context.settings.darkMode ? colorsDark[index] : colorsLight[index]}
                      fillOpacity={0.2}
                    />
                  ))}
                </AreaChart>
              </ResponsiveContainer>
            </IonCol>
          </IonRow>
        </div>
      ) : state.error ? (
        <div style={{ textAlign: 'center' }}>
          <p className="paragraph-margin-bottom">{state.error ? state.error.message : ''}</p>
          <IonButton expand="block" onClick={() => fetch()}>
            Reload
          </IonButton>
        </div>
      ) : null}
    </IonCardContent>
  );
};

export default memo(Prometheus, (): boolean => {
  return true;
});
