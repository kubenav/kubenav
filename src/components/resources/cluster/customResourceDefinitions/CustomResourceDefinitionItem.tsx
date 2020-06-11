import { IonItem, IonLabel } from '@ionic/react';
import { V1beta1CustomResourceDefinition } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface ICustomResourceDefinitionItemProps extends RouteComponentProps {
  item: V1beta1CustomResourceDefinition;
  section: string;
  type: string;
}

const CustomResourceDefinitionItem: React.FunctionComponent<ICustomResourceDefinitionItemProps> = ({
  item,
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  section,
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  type,
}: ICustomResourceDefinitionItemProps) => {
  return (
    <IonItem
      routerLink={`/customresources/${item.spec ? item.spec.group : ''}/${item.spec ? item.spec.version : ''}/${
        item.spec && item.spec.names ? item.spec.names.plural : ''
      }`}
      routerDirection="forward"
    >
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
      </IonLabel>
    </IonItem>
  );
};

export default CustomResourceDefinitionItem;
