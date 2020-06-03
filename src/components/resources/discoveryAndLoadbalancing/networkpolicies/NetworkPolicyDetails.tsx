import { IonCardContent, IonCardHeader, IonCardTitle, IonChip, IonCol, IonGrid, IonLabel, IonRow } from '@ionic/react';
import { V1NetworkPolicy, V1NetworkPolicyPeer, V1NetworkPolicyPort } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';

interface INetworkPolicyDetailsProps extends RouteComponentProps {
  item: V1NetworkPolicy;
  section: string;
  type: string;
}

const NetworkPolicyDetails: React.FunctionComponent<INetworkPolicyDetailsProps> = ({
  item,
  type,
}: INetworkPolicyDetailsProps) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.podSelector.matchLabels"
            title="Pod Selector"
            value={(value) =>
              Object.keys(value).map((label) => {
                return (
                  <IonChip key={label} className="unset-chip-height">
                    <IonLabel>
                      {label}: {value[label]}
                    </IonLabel>
                  </IonChip>
                );
              })
            }
          />
          <Row
            obj={item}
            objKey="spec.policyTypes"
            title="Policy Types"
            value={(value) => value.join(', ')}
            defaultValue="-"
          />
        </Configuration>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      <IonRow>
        {item.spec && item.spec.egress ? (
          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Egress Rules</IonCardTitle>
              </IonCardHeader>
              {item.spec.egress.map((egress, index) => {
                return (
                  <IonCardContent key={index}>
                    <Row
                      obj={egress}
                      objKey="ports"
                      title="Ports"
                      value={(ports) =>
                        ports.map((port: V1NetworkPolicyPort, index: number) => {
                          return (
                            <IonChip key={index} className="unset-chip-height">
                              <IonLabel>
                                {port.port}/{port.protocol}
                              </IonLabel>
                            </IonChip>
                          );
                        })
                      }
                    />
                    <Row
                      obj={egress}
                      objKey="to"
                      title="Peers"
                      value={(peers) =>
                        peers.map((peer: V1NetworkPolicyPeer, index: number) => {
                          return (
                            <React.Fragment key={index}>
                              {peer.ipBlock ? (
                                <IonChip className="unset-chip-height">
                                  <IonLabel>
                                    {peer.ipBlock ? peer.ipBlock.cidr : null}
                                    {peer.ipBlock ? peer.ipBlock.except?.join(', ') : null}
                                  </IonLabel>
                                </IonChip>
                              ) : null}
                              {peer.namespaceSelector && peer.namespaceSelector.matchLabels
                                ? Object.keys(peer.namespaceSelector.matchLabels).map((label) => {
                                    return (
                                      <IonChip key={label} className="unset-chip-height">
                                        <IonLabel>
                                          {label}:{' '}
                                          {peer.namespaceSelector && peer.namespaceSelector.matchLabels
                                            ? peer.namespaceSelector.matchLabels[label]
                                            : null}
                                        </IonLabel>
                                      </IonChip>
                                    );
                                  })
                                : null}
                              {peer.podSelector && peer.podSelector.matchLabels
                                ? Object.keys(peer.podSelector.matchLabels).map((label) => {
                                    return (
                                      <IonChip key={label} className="unset-chip-height">
                                        <IonLabel>
                                          {label}:{' '}
                                          {peer.podSelector && peer.podSelector.matchLabels
                                            ? peer.podSelector.matchLabels[label]
                                            : null}
                                        </IonLabel>
                                      </IonChip>
                                    );
                                  })
                                : null}
                            </React.Fragment>
                          );
                        })
                      }
                    />
                  </IonCardContent>
                );
              })}
            </IonCardEqualHeight>
          </IonCol>
        ) : null}

        {item.spec && item.spec.ingress ? (
          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Ingress Rules</IonCardTitle>
              </IonCardHeader>
              {item.spec.ingress.map((ingress, index) => {
                return (
                  <IonCardContent key={index} className="ion-card-content-divider">
                    <Row
                      obj={ingress}
                      objKey="ports"
                      title="Ports"
                      value={(ports) =>
                        ports.map((port: V1NetworkPolicyPort, index: number) => {
                          return (
                            <IonChip key={index} className="unset-chip-height">
                              <IonLabel>
                                {port.port}/{port.protocol}
                              </IonLabel>
                            </IonChip>
                          );
                        })
                      }
                    />
                    <Row
                      obj={ingress}
                      objKey="from"
                      title="Peers"
                      value={(peers) =>
                        peers.map((peer: V1NetworkPolicyPeer, index: number) => {
                          return (
                            <React.Fragment key={index}>
                              {peer.ipBlock ? (
                                <IonChip className="unset-chip-height">
                                  <IonLabel>
                                    {peer.ipBlock ? peer.ipBlock.cidr : null}
                                    {peer.ipBlock ? peer.ipBlock.except?.join(', ') : null}
                                  </IonLabel>
                                </IonChip>
                              ) : null}
                              {peer.namespaceSelector && peer.namespaceSelector.matchLabels
                                ? Object.keys(peer.namespaceSelector.matchLabels).map((label) => {
                                    return (
                                      <IonChip key={label} className="unset-chip-height">
                                        <IonLabel>
                                          {label}:{' '}
                                          {peer.namespaceSelector && peer.namespaceSelector.matchLabels
                                            ? peer.namespaceSelector.matchLabels[label]
                                            : null}
                                        </IonLabel>
                                      </IonChip>
                                    );
                                  })
                                : null}
                              {peer.podSelector && peer.podSelector.matchLabels
                                ? Object.keys(peer.podSelector.matchLabels).map((label) => {
                                    return (
                                      <IonChip key={label} className="unset-chip-height">
                                        <IonLabel>
                                          {label}:{' '}
                                          {peer.podSelector && peer.podSelector.matchLabels
                                            ? peer.podSelector.matchLabels[label]
                                            : null}
                                        </IonLabel>
                                      </IonChip>
                                    );
                                  })
                                : null}
                            </React.Fragment>
                          );
                        })
                      }
                    />
                  </IonCardContent>
                );
              })}
            </IonCardEqualHeight>
          </IonCol>
        ) : null}
      </IonRow>
    </IonGrid>
  );
};

export default NetworkPolicyDetails;
