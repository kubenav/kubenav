import {
  IonGrid, IonRow,
} from '@ionic/react';
import { V1Namespace } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Configuration from '../../../kubernetes/Configuration';
import Metadata from '../../../kubernetes/Metadata';
import Row from '../../../kubernetes/Row';
import Status from '../../../kubernetes/Status';

interface INamespaceDetailsProps extends RouteComponentProps {
  item: V1Namespace;
  section: string;
  type: string;
}

const NamespaceDetails: React.FunctionComponent<INamespaceDetailsProps> = ({ item, type }) => {
  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row
            obj={item}
            objKey="spec.finalizers"
            title="Finalizers"
            value={(finalizers) => finalizers.join(', ')}
            defaultValue="-"
          />
        </Configuration>

        <Status>
          <Row obj={item} objKey="status.phase" title="Phase" />
        </Status>
      </IonRow>

      {item.metadata ?  <Metadata metadata={item.metadata} type={type} /> : null}
    </IonGrid>
  )
};

export default NamespaceDetails;
