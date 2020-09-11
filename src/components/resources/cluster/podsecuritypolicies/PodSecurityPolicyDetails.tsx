import { IonGrid } from '@ionic/react';
import { V1beta1PodSecurityPolicy } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

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
  return <IonGrid>{item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}</IonGrid>;
};

export default PodSecurityPolicyDetails;
