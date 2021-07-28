import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonChip,
  IonCol,
  IonGrid,
  IonItem,
  IonItemDivider,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import {
  V1EndpointAddress,
  CoreV1EndpointPort,
  V1Endpoints,
  V1EndpointSubset,
  V1ObjectReference,
} from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import Dashboard from '../../../plugins/prometheus/Dashboard';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import Metadata from '../../misc/template/Metadata';

interface IEndpointDetailsProps extends RouteComponentProps {
  item: V1Endpoints;
  section: string;
  type: string;
}

const EndpointDetails: React.FunctionComponent<IEndpointDetailsProps> = ({ item, type }: IEndpointDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  const itemLink = (ref: V1ObjectReference | undefined): string => {
    if (ref && ref.kind && ref.kind.toLowerCase() === 'pod') {
      return `/resources/workloads/pods/${ref.namespace ? ref.namespace : ''}/${ref.name ? ref.name : ''}`;
    }

    return `/resources/discovery-and-loadbalancing/endpoints/${
      item.metadata && item.metadata.namespace ? item.metadata.namespace : ''
    }/${item.metadata && item.metadata.name ? item.metadata.name : ''}`;
  };

  return (
    <IonGrid>
      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      <IonItemDivider>
        <IonLabel>Subsets</IonLabel>
      </IonItemDivider>

      {item.subsets ? (
        <IonRow>
          {item.subsets.map((subset: V1EndpointSubset, index: number) => {
            return (
              <IonCol key={index} sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
                <IonCard>
                  <IonCardHeader>
                    <IonCardTitle>Addresses</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    {subset.ports
                      ? subset.ports.map((port: CoreV1EndpointPort, index: number) => {
                          return (
                            <IonChip key={index} className="unset-chip-height">
                              <IonLabel>
                                {port.name} {port.port}
                                {port.protocol ? `/${port.protocol}` : ''}
                              </IonLabel>
                            </IonChip>
                          );
                        })
                      : null}

                    <IonList>
                      {subset.addresses
                        ? subset.addresses.map((address: V1EndpointAddress, index: number) => {
                            return (
                              <IonItem key={index} routerLink={itemLink(address.targetRef)} routerDirection="forward">
                                <IonLabel>
                                  <h2>IP: {address.ip}</h2>
                                  <p>
                                    {address.hostname
                                      ? `Hostname: ${address.hostname} ${address.nodeName ? '| ' : ''}`
                                      : ''}
                                    {address.nodeName ? `Nodename: ${address.nodeName}` : ''}
                                  </p>
                                </IonLabel>
                              </IonItem>
                            );
                          })
                        : null}
                    </IonList>
                  </IonCardContent>
                </IonCard>
              </IonCol>
            );
          })}
        </IonRow>
      ) : null}

      {context.settings.prometheusEnabled ? (
        <Dashboard
          title="Metrics"
          charts={[
            {
              title: 'Addresses',
              unit: '',
              size: {
                xs: '12',
                sm: '12',
                md: '12',
                lg: '12',
                xl: '12',
              },
              type: 'area',
              queries: [
                {
                  label: 'Available',
                  query: `kube_endpoint_address_available{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", endpoint="${item.metadata ? item.metadata.name : ''}"}`,
                },
                {
                  label: 'Not Ready',
                  query: `kube_endpoint_address_not_ready{namespace="${
                    item.metadata ? item.metadata.namespace : ''
                  }", endpoint="${item.metadata ? item.metadata.name : ''}"}`,
                },
              ],
            },
          ]}
        />
      ) : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
      {context.settings.jaegerEnabled ? <TraceList item={item} /> : null}
    </IonGrid>
  );
};

export default EndpointDetails;
