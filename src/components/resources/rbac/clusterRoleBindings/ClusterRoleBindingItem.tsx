import { IonItem, IonLabel } from '@ionic/react';
import { V1ClusterRoleBinding, V1Subject } from '@kubernetes/client-node';
import React from 'react';
import { RouteComponentProps } from 'react-router';

import { timeDifference } from '../../../../utils/helpers';

const getSubjects = (subjects: V1Subject[], key: string): string => {
  const items: string[] = [];

  for (const subject of subjects) {
    items.push(subject[key]);
  }

  return items.join(', ');
};

interface IClusterRoleBindingItemProps extends RouteComponentProps {
  item: V1ClusterRoleBinding;
  section: string;
  type: string;
}

const ClusterRoleBindingItem: React.FunctionComponent<IClusterRoleBindingItemProps> = ({
  item,
  section,
  type,
}: IClusterRoleBindingItemProps) => {
  // - Role: Name is the name of resource being referenced.
  // - Kind: Kind of object being referenced.
  // - Subjects: Name of the object being referenced.
  // - Age: The time when the cluster role binding was created.
  return (
    <IonItem
      routerLink={`/resources/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${
        item.metadata ? item.metadata.name : ''
      }`}
      routerDirection="forward"
    >
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>
          Role: {item.roleRef.name}
          {item.subjects ? ` | Kind: ${getSubjects(item.subjects, 'kind')}` : ''}
          {item.subjects ? ` | Subjects: ${getSubjects(item.subjects, 'name')}` : ''}
          {item.metadata && item.metadata.creationTimestamp
            ? ` | Age: ${timeDifference(
                new Date().getTime(),
                new Date(item.metadata.creationTimestamp.toString()).getTime(),
              )}`
            : ''}
        </p>
      </IonLabel>
    </IonItem>
  );
};

export default ClusterRoleBindingItem;
