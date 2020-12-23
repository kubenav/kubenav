import {
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonGrid,
  IonItem,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import { NetworkingV1beta1Ingress } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import List from '../../misc/list/List';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';

interface IIngressDetailsProps extends RouteComponentProps {
  item: NetworkingV1beta1Ingress;
  section: string;
  type: string;
}

const IngressDetails: React.FunctionComponent<IIngressDetailsProps> = ({ item, type }: IIngressDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.backend"
            title="Default Backend"
            defaultValue="Default Backend is not configured"
          />
        </Configuration>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      <IonRow>
        {item.spec && item.spec.rules ? (
          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Rules</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {item.spec.rules.map((rule, index) => {
                    return (
                      <IonItem key={index}>
                        <IonLabel>
                          <h2>{rule.host}</h2>
                          {rule.http &&
                            rule.http.paths.map((path, index) => {
                              return (
                                <p key={index}>
                                  Path: {path.path} | Service Name: {path.backend.serviceName} | Service Port:{' '}
                                  {path.backend.servicePort}
                                </p>
                              );
                            })}
                        </IonLabel>
                      </IonItem>
                    );
                  })}
                </IonList>
              </IonCardContent>
            </IonCardEqualHeight>
          </IonCol>
        ) : null}

        {item.spec && item.spec.tls ? (
          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>TLS</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {item.spec.tls.map((tls, index) => {
                    return (
                      <IonItem key={index}>
                        <IonLabel>
                          <h2>{tls.secretName}</h2>
                          <p>Hosts: {tls.hosts && tls.hosts.join(', ')}</p>
                        </IonLabel>
                      </IonItem>
                    );
                  })}
                </IonList>
              </IonCardContent>
            </IonCardEqualHeight>
          </IonCol>
        ) : null}
      </IonRow>

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace={item.metadata.namespace}
            parent={item}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
      {context.settings.jaegerEnabled ? <TraceList item={item} /> : null}
    </IonGrid>
  );
};

export default IngressDetails;
