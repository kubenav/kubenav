import { IonChip, IonGrid, IonLabel, IonRow } from '@ionic/react';
import { V1NetworkPolicy, V1NetworkPolicyEgressRule, V1NetworkPolicyIngressRule } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import Configuration from '../../misc/template/Configuration';
import Status from '../../misc/template/Status';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';

interface INetworkPolicyDetailsProps extends RouteComponentProps {
  item: V1NetworkPolicy;
  section: string;
  type: string;
}

const NetworkPolicyDetails: React.FunctionComponent<INetworkPolicyDetailsProps> = ({
  item,
  type,
}: INetworkPolicyDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.podSelector.matchLabels"
            title="Pod Selector"
            value={(value) =>
              Object.keys(value).map((label) => {
                return (
                  <IonChip key={label} className="unset-chip-height">
                    <IonLabel>
                      {label}: {value[label]}
                    </IonLabel>
                  </IonChip>
                );
              })
            }
          />
          <Row
            obj={item}
            objKey="spec.policyTypes"
            title="Policy Types"
            value={(value) => value.join(', ')}
            defaultValue="-"
          />
        </Configuration>

        <Status>
          <Row
            obj={item}
            objKey="spec.egress"
            title="Egress Rules"
            value={(rules: V1NetworkPolicyEgressRule[] | undefined) => (rules ? rules.length : 0)}
            defaultValue="0"
          />
          <Row
            obj={item}
            objKey="spec.ingress"
            title="Ingress Rules"
            value={(rules: V1NetworkPolicyIngressRule[] | undefined) => (rules ? rules.length : 0)}
            defaultValue="0"
          />
        </Status>
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
    </IonGrid>
  );
};

export default NetworkPolicyDetails;
