import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonList, IonRow } from '@ionic/react';
import { V1Secret } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import Configuration from '../../misc/template/Configuration';
import Data from '../../misc/template/Data';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';

interface ISecretDetailsProps extends RouteComponentProps {
  item: V1Secret;
  section: string;
  type: string;
}

const SecretDetails: React.FunctionComponent<ISecretDetailsProps> = ({ item, type }: ISecretDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="type" title="Type" />
        </Configuration>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.data ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Data</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {Object.keys(item.data).map((key) => (
                    <Data key={key} name={key} data={atob(item.data ? item.data[key] : '')} />
                  ))}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}

      {item.stringData ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>String Data</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {Object.keys(item.stringData).map((key) => (
                    <Data key={key} name={key} data={item.stringData ? item.stringData[key] : ''} />
                  ))}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
      {context.settings.jaegerEnabled ? <TraceList item={item} /> : null}
    </IonGrid>
  );
};

export default SecretDetails;
