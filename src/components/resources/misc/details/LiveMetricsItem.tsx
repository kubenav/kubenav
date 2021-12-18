import {
  IonButton,
  IonButtons,
  IonCard,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
} from '@ionic/react';
import { analytics, close } from 'ionicons/icons';
import React, { useContext, useEffect, useState } from 'react';
import { Area, AreaChart, ResponsiveContainer, XAxis, YAxis } from 'recharts';

import { IContext, TActivator, IPodMetrics } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { formatResourceValue } from '../../../../utils/helpers';

const reducer = (previousValue: number, currentValue: number) => previousValue + currentValue;

interface ILiveMetric {
  timestamp: number;
  cpu: number;
  memory: number;
}

interface ILiveMetricsItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const LiveMetricsItemActivator: React.FunctionComponent<ILiveMetricsItemActivatorProps> = ({
  activator,
  onClick,
}: ILiveMetricsItemActivatorProps) => {
  if (activator === 'item') {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={analytics} />
        <IonLabel>Live Metrics</IonLabel>
      </IonItem>
    );
  } else {
    return null;
  }
};

interface ILiveMetricsItemProps {
  show: boolean;
  hide: () => void;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const LiveMetricsItem: React.FunctionComponent<ILiveMetricsItemProps> = ({
  show,
  hide,
  item,
}: ILiveMetricsItemProps) => {
  const context = useContext<IContext>(AppContext);
  const [metrics, setMetrics] = useState<ILiveMetric[]>([]);

  const fetchMetrics = async () => {
    try {
      if (show) {
        const data: IPodMetrics = await kubernetesRequest(
          'GET',
          `/apis/metrics.k8s.io/v1beta1/namespaces/${
            item.metadata && item.metadata.namespace ? item.metadata.namespace : ''
          }/pods/${item.metadata && item.metadata.name ? item.metadata.name : ''}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const containerMetrics: ILiveMetric[] = [];

        if (data.containers) {
          for (const container of data.containers) {
            containerMetrics.push({
              timestamp: 0,
              cpu: parseInt(formatResourceValue('cpu', container?.usage?.cpu || '0')),
              memory: parseInt(formatResourceValue('memory', container?.usage?.memory || '0')),
            });
          }
        }

        setMetrics((prevMetrics) => {
          if (prevMetrics.length > 14) {
            return [
              ...prevMetrics.slice(-14),
              {
                timestamp: Math.floor(new Date().getTime() / 1000),
                cpu: containerMetrics.map((m) => m.cpu).reduce(reducer),
                memory: containerMetrics.map((m) => m.memory).reduce(reducer),
              },
            ];
          } else {
            return [
              ...prevMetrics,
              {
                timestamp: Math.floor(new Date().getTime() / 1000),
                cpu: containerMetrics.map((m) => m.cpu).reduce(reducer),
                memory: containerMetrics.map((m) => m.memory).reduce(reducer),
              },
            ];
          }
        });
      }
    } catch (err) {
      throw err;
    }
  };

  const formatTime = (time: number): string => {
    const d = new Date(time * 1000);
    return `${('0' + d.getHours()).slice(-2)}:${('0' + d.getMinutes()).slice(-2)}:${('0' + d.getSeconds()).slice(-2)}`;
  };

  useEffect(() => {
    const timer = setTimeout(() => {
      fetchMetrics();
    }, 3000);

    return () => clearTimeout(timer);
  });

  return (
    <React.Fragment>
      <IonModal isOpen={show} onDidDismiss={hide}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={hide}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{item.metadata ? item.metadata.name : ''}</IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>CPU Usage</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <div style={{ height: '300px', width: '100%' }}>
                {metrics.length > 0 && (
                  <ResponsiveContainer>
                    <AreaChart data={metrics}>
                      <XAxis
                        dataKey="timestamp"
                        scale="time"
                        type="number"
                        domain={['dataMin', 'dataMax']}
                        tickFormatter={formatTime}
                      />
                      <YAxis dataKey="cpu" unit="m" />
                      <Area
                        dataKey="cpu"
                        // NOTE: https://github.com/recharts/recharts/issues/2487
                        // eslint-disable-next-line @typescript-eslint/ban-ts-comment
                        // @ts-ignore
                        data={metrics}
                        name="CPU Usage"
                        stroke="#326ce5"
                        fill="#326ce5"
                        fillOpacity={0.2}
                        isAnimationActive={false}
                      />
                    </AreaChart>
                  </ResponsiveContainer>
                )}
              </div>
            </IonCardContent>
          </IonCard>
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Memory Usage</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              <div style={{ height: '300px', width: '100%' }}>
                {metrics.length > 0 && (
                  <ResponsiveContainer>
                    <AreaChart data={metrics}>
                      <XAxis
                        dataKey="timestamp"
                        scale="time"
                        type="number"
                        domain={['dataMin', 'dataMax']}
                        tickFormatter={formatTime}
                      />
                      <YAxis dataKey="memory" unit="Mi" />
                      <Area
                        dataKey="memory"
                        // NOTE: https://github.com/recharts/recharts/issues/2487
                        // eslint-disable-next-line @typescript-eslint/ban-ts-comment
                        // @ts-ignore
                        data={metrics}
                        name="Memory Usage"
                        stroke="#326ce5"
                        fill="#326ce5"
                        fillOpacity={0.2}
                        isAnimationActive={false}
                      />
                    </AreaChart>
                  </ResponsiveContainer>
                )}
              </div>
            </IonCardContent>
          </IonCard>
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default LiveMetricsItem;
