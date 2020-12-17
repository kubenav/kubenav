import { IonGrid, IonRow } from '@ionic/react';
import { V1ServiceAccount } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import List from '../../misc/list/List';
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
  const context = useContext<IContext>(AppContext);

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
            parent={item}
            selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
          />
        </IonRow>
      ) : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
    </IonGrid>
  );
};

export default ServiceAccountDetails;
