import { IonGrid } from '@ionic/react';
import { V1beta1PodSecurityPolicy } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
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
    </IonGrid>
  );
};

export default PodSecurityPolicyDetails;
