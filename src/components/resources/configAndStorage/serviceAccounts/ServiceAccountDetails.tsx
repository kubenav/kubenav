import { IonGrid, IonRow } from '@ionic/react';
import { V1ServiceAccount } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import List from '../../misc/List';
import Metadata from '../../misc/template/Metadata';
import Permissions from './Permissions';

interface IServiceAccountDetailsProps extends RouteComponentProps {
  item: V1ServiceAccount;
  section: string;
  type: string;
}

const ServiceAccountDetails: React.FunctionComponent<IServiceAccountDetailsProps> = ({
  item,
  type,
}: IServiceAccountDetailsProps) => {
  return (
    <IonGrid>
      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <Permissions namespace={item.metadata.namespace} serviceAccountName={item.metadata.name} />
      ) : null}

      {item.metadata && item.metadata.name && item.metadata.namespace ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace={item.metadata.namespace}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default ServiceAccountDetails;
