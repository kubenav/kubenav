import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonList, IonRow } from '@ionic/react';
import { V1Secret } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Configuration from '../../misc/template/Configuration';
import Data from '../../misc/template/Data';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';

interface ISecretDetailsProps extends RouteComponentProps {
  item: V1Secret;
  section: string;
  type: string;
}

const SecretDetails: React.FunctionComponent<ISecretDetailsProps> = ({ item, type }) => {
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
                    <Data key={key} name={key} data={atob(item.data![key])} />
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
                    <Data key={key} name={key} data={item.stringData![key]} />
                  ))}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default SecretDetails;
