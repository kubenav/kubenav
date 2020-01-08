import {
  IonItem,
  IonLabel,
} from '@ionic/react';
import { NetworkingV1beta1Ingress } from '@kubernetes/client-node'
import React from 'react';
import { RouteComponentProps } from 'react-router';

interface IIngressItemProps extends RouteComponentProps {
  item: NetworkingV1beta1Ingress;
  section: string;
  type: string;
}

const IngressItem: React.FunctionComponent<IIngressItemProps> = ({ item, section, type }) => {
  return (
    <IonItem routerLink={`/kubernetes/${section}/${type}/${item.metadata ? item.metadata.namespace : ''}/${item.metadata ? item.metadata.name : ''}`} routerDirection="forward">
      <IonLabel>
        <h2>{item.metadata ? item.metadata.name : ''}</h2>
        <p>Namespace: {item.metadata ? item.metadata.namespace : '-'}</p>
      </IonLabel>
    </IonItem>
  )
};

export default IngressItem;
