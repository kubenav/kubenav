import { IonGrid } from '@ionic/react';
import { V1beta1PodSecurityPolicy } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import Metadata from '../../misc/template/Metadata';

interface IPodSecurityPolicyDetailsProps extends RouteComponentProps {
  item: V1beta1PodSecurityPolicy;
  section: string;
  type: string;
}

const PodSecurityPolicyDetails: React.FunctionComponent<IPodSecurityPolicyDetailsProps> = ({
  item,
  type,
}: IPodSecurityPolicyDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}
      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
      {context.settings.jaegerEnabled ? <TraceList item={item} /> : null}
    </IonGrid>
  );
};

export default PodSecurityPolicyDetails;
