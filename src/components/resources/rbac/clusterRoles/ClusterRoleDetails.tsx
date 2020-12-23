import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1ClusterRole } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import List from '../../misc/list/List';
import Metadata from '../../misc/template/Metadata';
import Rules from '../misc/Rules';

interface IClusterRoleDetailsProps extends RouteComponentProps {
  item: V1ClusterRole;
  section: string;
  type: string;
}

const ClusterRoleDetails: React.FunctionComponent<IClusterRoleDetailsProps> = ({
  item,
  type,
}: IClusterRoleDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.rules ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Rules</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <Rules rules={item.rules} />
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}

      {item.metadata && item.metadata.name ? (
        <IonRow>
          <List
            name="Events"
            section="cluster"
            type="events"
            namespace=""
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

export default ClusterRoleDetails;
