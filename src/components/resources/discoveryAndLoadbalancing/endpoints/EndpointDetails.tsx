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
  V1EndpointPort,
  V1Endpoints,
  V1EndpointSubset,
  V1ObjectReference,
} from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Metadata from '../../misc/template/Metadata';

interface IEndpointDetailsProps extends RouteComponentProps {
  item: V1Endpoints;
  section: string;
  type: string;
}

const EndpointDetails: React.FunctionComponent<IEndpointDetailsProps> = ({ item, type }: IEndpointDetailsProps) => {
  const itemLink = (ref: V1ObjectReference | undefined): string => {
    if (ref && ref.kind && ref.kind.toLowerCase() === 'pod') {
      return `/resources/workloads/pods/${ref.namespace ? ref.namespace : ''}/${ref.name ? ref.name : ''}`;
    }

    return `/resources/discovery-and-loadbalancing/endpoints/${
      item.metadata && item.metadata.namespace ? item.metadata.namespace : ''
    }/
      ${item.metadata && item.metadata.name ? item.metadata.name : ''}`;
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
                  <IonCardHeader>
                    <IonCardTitle>Ports</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    {subset.ports
                      ? subset.ports.map((port: V1EndpointPort, index: number) => {
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
                  </IonCardContent>
                </IonCard>
              </IonCol>
            );
          })}
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default EndpointDetails;
