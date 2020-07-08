import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1beta1PodSecurityPolicy } from '@kubernetes/client-node';
import yaml from 'js-yaml';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Editor from '../../../misc/Editor';
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
  return (
    <IonGrid>
      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {item.spec ? (
        <IonRow>
          <IonCol>
            <IonCard>
              <IonCardHeader>
                <IonCardTitle>Policy</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <Editor readOnly={true} value={yaml.safeDump(item.spec)} />
              </IonCardContent>
            </IonCard>
          </IonCol>
        </IonRow>
      ) : null}
    </IonGrid>
  );
};

export default PodSecurityPolicyDetails;
