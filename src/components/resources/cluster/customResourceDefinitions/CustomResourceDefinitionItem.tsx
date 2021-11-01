import { IonItem, IonLabel } from '@ionic/react';
import { V1CustomResourceDefinition } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface ICustomResourceDefinitionItemProps extends RouteComponentProps {
  item: V1CustomResourceDefinition;
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
    <React.Fragment>
      {item.spec.versions.map((version) => (
        <IonItem
          key={version.name}
          routerLink={`/customresources/${item.spec ? item.spec.group : ''}/${version.name}/${
            item.spec && item.spec.names ? item.spec.names.plural : ''
          }?scope=${item.spec && item.spec.scope ? item.spec.scope : ''}`}
          routerDirection="forward"
        >
          <IonLabel>
            <h2>
              {item.metadata ? item.metadata.name : ''}/{version.name}
            </h2>
          </IonLabel>
        </IonItem>
      ))}
    </React.Fragment>
  );
};

export default CustomResourceDefinitionItem;
