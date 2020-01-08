import {
  IonGrid, IonRow,
} from '@ionic/react';
import { V1Namespace } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Configuration from '../Configuration';
import Metadata from '../Metadata';
import Row from '../Row';
import Status from '../Status';

interface NamespaceProps extends RouteComponentProps {
  item: V1Namespace;
  section: string;
  type: string;
}

const Namespace: React.FunctionComponent<NamespaceProps> = ({ item, type }) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="spec.finalizers" title="Finalizers" value={(finalizers) => finalizers.join(', ')} defaultValue="-" />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.phase" title="Phase" />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}
    </IonGrid>
  )
};

export default Namespace;
