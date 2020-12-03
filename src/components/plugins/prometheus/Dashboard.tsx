import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonProgressBar,
  IonRow,
  IonSelect,
  IonSelectOption,
} from '@ionic/react';
import { V1PodList } from '@kubernetes/client-node';
import React, { memo, useContext, useState } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../declarations';
import { kubernetesRequest, pluginRequest } from '../../../utils/api';
import { IS_INCLUSTER } from '../../../utils/constants';
import { AppContext } from '../../../utils/context';
import Chart, { IChart, IChartResult } from './Chart';

interface IVariable {
  name: string;
  label: string;
  query: string;
  values: string[];
  value: string;
  allowAll: boolean;
}

interface IDashboardResult {
  variables: IVariable[];
  chartsResult: IChartResult[];
}

export interface IDashboardProps {
  title?: string;
  variables?: IVariable[];
  charts: IChart[];
}

const Dashboard: React.FunctionComponent<IDashboardProps> = ({ title, variables, charts }: IDashboardProps) => {
  const context = useContext<IContext>(AppContext);

  // By default we are rendering the data for the last 1 hour. The intervall can be changed via an IonSelect field,
  // which retriggered the "fetch" function to get the new Prometheus data.
  // Variables can be used to drill down the data, for example on the details page of a Pod we can select a container.
  const [timeDiff, setTimeDiff] = useState<number>(3600);
  const [selectedVariables, setSelectedVariables] = useState<IVariable[] | undefined>(variables);

  // Get all Pods, which are matching the defined namespace and selector from the settings. When we find a Pod, this Pod
  // is used to fetch the metrics. Therefor we are sending the charts to the Pod via port forwarding. The returned
  // charts are passed to Chart component, which transforms the data for Recharts (recharts.org) and reders the differen
  // series.
  // If kubenav is running inside a Kubernetes cluster (incluster mode), we are not using port forwarding. Instead we
  // are using the configured cluster url.
  const { isError, isFetching, data, error, refetch } = useQuery<IDashboardResult, Error>(
    ['Dashboard', title, variables, charts],
    async () => {
      try {
        let portforwardingPath = '';

        if (!IS_INCLUSTER) {
          const podList: V1PodList = await kubernetesRequest(
            'GET',
            `/api/v1/namespaces/${context.settings.prometheusNamespace}/pods?labelSelector=${context.settings.prometheusSelector}`,
            '',
            context.settings,
            await context.kubernetesAuthWrapper(''),
          );

          if (podList.items.length > 0 && podList.items[0].metadata) {
            portforwardingPath = `/api/v1/namespaces/${podList.items[0].metadata.namespace}/pods/${podList.items[0].metadata.name}/portforward`;
          } else {
            throw new Error(
              `Could not find Pod in Namespace "${context.settings.prometheusNamespace}" with selector "${context.settings.prometheusSelector}".`,
            );
          }
        }

        const dashboardResult: IDashboardResult = await pluginRequest(
          'prometheus',
          context.settings.prometheusPort,
          context.settings.prometheusAddress,
          {
            variables: selectedVariables ? selectedVariables : [],
            charts: charts,
            start: Math.floor(Date.now() / 1000) - timeDiff,
            end: Math.floor(Date.now() / 1000),
          },
          portforwardingPath,
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        return dashboardResult;
      } catch (err) {
        throw err;
      }
    },
    context.settings.queryConfig,
  );

  return (
    <IonRow>
      <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
        <IonCard>
          {title ? (
            <IonCardHeader>
              <IonCardTitle>{title}</IonCardTitle>
            </IonCardHeader>
          ) : null}
          <IonCardContent>
            {isFetching ? (
              <IonProgressBar slot="fixed" type="indeterminate" color="primary" />
            ) : !isError && data ? (
              <IonRow>
                {data && data.variables
                  ? data.variables.map((variable, index) =>
                      variable.value && variable.values ? (
                        <IonCol key={index}>
                          <IonItem>
                            <IonLabel>{variable.name}</IonLabel>
                            <IonSelect
                              interface="popover"
                              value={variable.value}
                              onIonChange={(e) => {
                                if (selectedVariables && data.variables) {
                                  const tmpVariales = data.variables;
                                  tmpVariales[index].value = e.detail.value;
                                  setSelectedVariables(tmpVariales);
                                  refetch();
                                }
                              }}
                            >
                              {variable.values.map((value) => (
                                <IonSelectOption key={value} value={value}>
                                  {value}
                                </IonSelectOption>
                              ))}
                            </IonSelect>
                          </IonItem>
                        </IonCol>
                      ) : null,
                    )
                  : null}

                <IonCol>
                  <IonItem>
                    <IonLabel>Time</IonLabel>
                    <IonSelect
                      interface="popover"
                      value={timeDiff}
                      onIonChange={(e) => {
                        setTimeDiff(e.detail.value);
                        refetch();
                      }}
                    >
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
                  </IonItem>
                </IonCol>
              </IonRow>
            ) : isError ? (
              <div style={{ textAlign: 'center' }}>
                <p className="paragraph-margin-bottom">{error ? error.message : ''}</p>
                <IonButton expand="block" onClick={() => refetch()}>
                  Reload
                </IonButton>
              </div>
            ) : null}
          </IonCardContent>
        </IonCard>
      </IonCol>

      {!isError && data && data.chartsResult
        ? data.chartsResult.map((chart, index) => <Chart key={index} timeDiff={timeDiff} chart={chart} />)
        : null}
    </IonRow>
  );
};

export default memo(Dashboard, (): boolean => {
  return true;
});
