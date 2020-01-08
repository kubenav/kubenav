import {
  IonGrid,
  IonRow,
} from '@ionic/react';
import { V1ServiceAccount } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import List from '../List';
import Metadata from '../Metadata';

interface IServiceAccountProps extends RouteComponentProps {
  item: V1ServiceAccount;
  section: string;
  type: string;
}

const ServiceAccount: React.FunctionComponent<IServiceAccountProps> = ({ item, type }) => {
  return (
    <IonGrid>
      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List name="Events" section="cluster" type="events" namespace={item.metadata.namespace} selector={`fieldSelector=involvedObject.name=${item.metadata.name}`} />
        </IonRow>
      ) : null}
    </IonGrid>
  )
};

export default ServiceAccount;
