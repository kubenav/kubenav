import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonGrid,
  IonList,
  IonRow,
} from '@ionic/react';
import { V1ConfigMap } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Data from '../Data';
import List from '../List';
import Metadata from '../Metadata';

interface IConfigMapProps extends RouteComponentProps {
  item: V1ConfigMap;
  section: string;
  type: string;
}

const ConfigMap: React.FunctionComponent<IConfigMapProps> = ({ item, type }) => {
  return (
    <IonGrid>
      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List name="Events" section="cluster" type="events" namespace={item.metadata.namespace} selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
        </IonRow>
      ) : null}

      {item.data ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Data</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {Object.keys(item.data).map((key) => <Data key={key} name={key} data={item.data![key]}/>)}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}

      {item.binaryData ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Binary Data</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonList>
                  {Object.keys(item.binaryData).map((key) => <Data key={key} name={key} data={item.binaryData![key]}/>)}
                </IonList>
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}
    </IonGrid>
  )
};

export default ConfigMap;
