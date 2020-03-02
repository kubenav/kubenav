import {
  IonGrid, IonRow,
} from '@ionic/react';
import { V1Namespace } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';
import Status from '../../misc/template/Status';

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
