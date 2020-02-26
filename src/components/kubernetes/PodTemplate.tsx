import {
  IonItemDivider,
  IonLabel,
  IonRow,
} from '@ionic/react';
import { V1PodTemplateSpec } from '@kubernetes/client-node'
import React from 'react';

import Containers from './Containers';
import Tolerations from './Tolerations';
import Volumes from './Volumes';

interface IPodTemplateProps {
  template: V1PodTemplateSpec;
}

const PodTemplate: React.FunctionComponent<IPodTemplateProps> = ({ template }) => {
  return (
    <React.Fragment>
      <IonItemDivider>
        <IonLabel>Pod Template</IonLabel>
      </IonItemDivider>

      <IonRow>
        {template.spec && template.spec.initContainers && template.spec.initContainers.length > 0 ? (
          <Containers containers={template.spec.initContainers} statuses={undefined} title="Init Containers" />
        ) : null}
        {template.spec && template.spec.containers && template.spec.containers.length > 0 ? (
          <Containers containers={template.spec.containers} statuses={undefined} title="Containers" />
        ) : null}
      </IonRow>

      <IonRow>
        {template.spec && template.spec.volumes ? <Volumes volumes={template.spec.volumes} /> : null}
        {template.spec
        && template.spec.tolerations
        && template.spec.tolerations.filter((toleration) => !!toleration.key).length > 0
          ? <Tolerations tolerations={template.spec.tolerations} /> : null}
      </IonRow>
    </React.Fragment>
  )
};

export default PodTemplate;
