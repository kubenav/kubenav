import { IonCard, IonCardContent, IonCardHeader, IonCardTitle, IonCol, IonList } from '@ionic/react';
import React, { useContext, useEffect } from 'react';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import { resources } from '../../../utils/resources';
import useAsyncFn from '../../../utils/useAsyncFn';

interface IListProps {
  name: string;
  section: string;
  type: string;
  namespace: string;
  selector?: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  filter?: (item: any) => boolean;
}

const List: React.FunctionComponent<IListProps> = ({
  name,
  section,
  type,
  namespace,
  selector,
  filter,
}: IListProps) => {
  const context = useContext<IContext>(AppContext);

  const page = resources[section].pages[type];
  const Component = page.listItemComponent;

  const [state, , fetchInit] = useAsyncFn(
    async () =>
      await kubernetesRequest(
        'GET',
        `${page.listURL(namespace)}${selector ? '?' + selector : ''}`,
        '',
        context.settings.timeout,
        await context.kubernetesAuthWrapper(''),
      ),
    [section, type, namespace, selector, filter],
    { loading: true, error: undefined, value: undefined },
  );

  useEffect(() => {
    fetchInit();
  }, [fetchInit]);

  if (state.value && state.value.items && state.value.items.filter(filter ? filter : () => true).length > 0) {
    return (
      <IonCol>
        <IonCard>
          <IonCardHeader>
            <IonCardTitle>{name}</IonCardTitle>
          </IonCardHeader>
          <IonCardContent>
            <IonList>
              {state.value.items.filter(filter ? filter : () => true).map((item, index) => {
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
