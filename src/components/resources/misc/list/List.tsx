import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonList } from '@ionic/react';
import React, { useContext } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { resources } from '../../../../utils/resources';

interface IListProps {
  name: string;
  section: string;
  type: string;
  namespace: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  parent: any;
  selector?: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  filter?: (item: any) => boolean;
}

const List: React.FunctionComponent<IListProps> = ({
  name,
  section,
  type,
  namespace,
  parent,
  selector,
  filter,
}: IListProps) => {
  const context = useContext<IContext>(AppContext);

  const page = resources[section].pages[type];
  const Component = page.listItemComponent;

  const { data } = useQuery(
    ['List', name, namespace, type, section, selector ? selector : '', parent],
    async () =>
      await kubernetesRequest(
        'GET',
        `${page.listURL(namespace)}?limit=100${selector ? '&' + selector : ''}`,
        '',
        context.settings,
        await context.kubernetesAuthWrapper(''),
      ),
    context.settings.queryConfig,
  );

  if (data && data.items && data.items.filter(filter ? filter : () => true).length > 0) {
    return (
      <IonCol>
        <IonCard>
          <IonCardHeader>
            <IonCardTitle>{name}</IonCardTitle>
          </IonCardHeader>
          <IonCardContent>
            <IonList>
              {data.items.filter(filter ? filter : () => true).map((item, index) => {
                return <Component key={index} item={item} section={section} type={type} />;
              })}
            </IonList>
          </IonCardContent>
        </IonCard>
      </IonCol>
    );
  } else {
    return <React.Fragment />;
  }
};

export default List;
