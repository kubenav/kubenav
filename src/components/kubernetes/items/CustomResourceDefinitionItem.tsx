import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { V1beta1CustomResourceDefinition } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface ICustomResourceDefinitionItemProps extends RouteComponentProps {
  item: V1beta1CustomResourceDefinition;
  section: string;
  type: string;
}

const CustomResourceDefinitionItem: React.FunctionComponent<ICustomResourceDefinitionItemProps> = ({
 item,
 section,
 type,
}) => {
  return (
    <IonItem
      routerLink={`/customresources/${item.spec.group}/${item.spec.version}/${item.spec.names.plural}`}
      routerDirection="forward"
    >
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
      </IonLabel>
    </IonItem>
  )
};

export default CustomResourceDefinitionItem;
