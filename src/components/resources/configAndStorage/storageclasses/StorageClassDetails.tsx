import { IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonGrid, IonRow } from '@ionic/react';
import { V1StorageClass } from '@kubernetes/client-node';
import React, { useContext } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { capitalize } from '../../../../utils/helpers';
import QueryList from '../../../plugins/elasticsearch/QueryList';
import TraceList from '../../../plugins/jaeger/TraceList';
import DashboardList from '../../../plugins/prometheus/DashboardList';
import IonCardEqualHeight from '../../../misc/IonCardEqualHeight';
import Configuration from '../../misc/template/Configuration';
import Metadata from '../../misc/template/Metadata';
import Row from '../../misc/template/Row';

interface IStorageClassDetailsProps extends RouteComponentProps {
  item: V1StorageClass;
  section: string;
  type: string;
}

const StorageClassDetails: React.FunctionComponent<IStorageClassDetailsProps> = ({
  item,
  type,
}: IStorageClassDetailsProps) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonGrid>
      <IonRow>
        <Configuration>
          <Row obj={item} objKey="provisioner" title="Provisioner" />
          <Row obj={item} objKey="reclaimPolicy" title="Reclaim Policy" />
          <Row obj={item} objKey="volumeBindingMode" title="Volume Binding Mode" />
          <Row
            obj={item}
            objKey="allowVolumeExpansion"
            title="Allow Volume Expansion"
            value={(value) => (value ? 'true' : 'false')}
          />
          <Row
            obj={item}
            objKey="mountOptions"
            title="Mount Options"
            value={(value) => (value ? value.join(', ') : '')}
          />
        </Configuration>

        {item.parameters ? (
          <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="6" sizeXl="6">
            <IonCardEqualHeight>
              <IonCardHeader>
                <IonCardTitle>Parameters</IonCardTitle>
              </IonCardHeader>
              <IonCardContent>
                <IonGrid>
                  {Object.keys(item.parameters).map((key: string) => {
                    if (item.parameters) {
                      return <Row key={key} obj={item.parameters} objKey={key} title={capitalize(key)} />;
                    } else {
                      return '';
                    }
                  })}
                </IonGrid>
              </IonCardContent>
            </IonCardEqualHeight>
          </IonCol>
        ) : null}
      </IonRow>

      {item.metadata ? <Metadata metadata={item.metadata} type={type} /> : null}

      {context.settings.prometheusEnabled ? <DashboardList item={item} /> : null}
      {context.settings.elasticsearchEnabled ? <QueryList item={item} /> : null}
      {context.settings.jaegerEnabled ? <TraceList item={item} /> : null}
    </IonGrid>
  );
};

export default StorageClassDetails;
