import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonChip,
  IonCol,
  IonGrid,
  IonLabel,
  IonRow,
} from '@ionic/react';
import { V1ObjectMeta } from '@kubernetes/client-node'
import React from 'react';

import { isNamespaced, timeDifference } from '../../../../utils/helpers';
import Row from './Row';

interface IMetadataProps {
  metadata: V1ObjectMeta;
  type: string;
}

const Metadata: React.FunctionComponent<IMetadataProps> = ({ metadata, type }) => {
  return (
    <IonRow>
      <IonCol>
        <IonCard>
          <IonCardHeader>
            <IonCardTitle>Metadata</IonCardTitle>
          </IonCardHeader>
          <IonCardContent>
            <IonGrid>
              <Row obj={metadata} objKey="name" title="Name" />
              {isNamespaced(type) ? <Row obj={metadata} objKey="namespace" title="Namespace" /> : null}
              <Row
                obj={metadata}
                objKey="creationTimestamp"
                title="Age"
                value={(value) => timeDifference(new Date().getTime(), new Date(value.toString()).getTime())}
              />
              <Row
                obj={metadata}
                objKey="labels"
                title="Labels"
                value={(value) => Object.keys(value).map((label) => {
                  return (
                    <IonChip key={label} className="unset-chip-height">
                      <IonLabel>{label}: {value[label]}</IonLabel>
                    </IonChip>
                  )
                })}
              />
              <Row
                obj={metadata}
                objKey="annotations"
                title="Annotations"
                value={(value) => Object.keys(value).map((annotation) => {
                  return (
                    <IonChip key={annotation} className="unset-chip-height">
                      <IonLabel>{annotation}: {value[annotation]}</IonLabel>
                    </IonChip>
                  )
                })}
              />
            </IonGrid>
          </IonCardContent>
        </IonCard>
      </IonCol>
    </IonRow>
  )
};

export default Metadata;
