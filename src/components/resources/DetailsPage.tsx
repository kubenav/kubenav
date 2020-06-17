import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import { refresh } from 'ionicons/icons';
import React, { memo, useContext, useEffect } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import { resources } from '../../utils/resources';
import useAsyncFn from '../../utils/useAsyncFn';
import DetailsPopover from './misc/DetailsPopover';
import LoadingErrorCard from '../misc/LoadingErrorCard';

interface IMatchParams {
  section: string;
  type: string;
  namespace: string;
  name: string;
}

type IDetailsPageProps = RouteComponentProps<IMatchParams>;

const DetailsPage: React.FunctionComponent<IDetailsPageProps> = ({ match }: IDetailsPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const page = resources[match.params.section].pages[match.params.type];
  const Component = page.detailsComponent;

  // useAsyncFn is a custom React hook which wrapps our API call.
  const [state, fetch, fetchInit] = useAsyncFn(
    async () => await context.request('GET', page.detailsURL(match.params.namespace, match.params.name), ''),
    [page, match.params.namespace, match.params.name],
    { loading: true, error: undefined, value: undefined },
  );

  // When the component is rendered the first time and on every route change or a modification to the context
  // object we are loading all items for the corresponding resource.
  useEffect(() => {
    fetchInit();
  }, [fetchInit]);

  // The doRefresh method is used for a manual reload of the items for the corresponding resource. The
  // event.detail.complete() call is required to finish the animation of the IonRefresher component.
  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    fetch();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonBackButton defaultHref={`/resources/${match.params.section}/${match.params.type}`} />
          </IonButtons>
          <IonTitle>{state.value && state.value.metadata ? state.value.metadata.name : ''}</IonTitle>
          <IonButtons slot="primary">
            {!isPlatform('hybrid') ? (
              <IonButton onClick={() => fetch()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
            ) : null}
            {state.value ? (
              <DetailsPopover
                type={match.params.type}
                item={state.value}
                url={page.detailsURL(
                  state.value.metadata ? state.value.metadata.namespace : '',
                  state.value.metadata ? state.value.metadata.name : '',
                )}
              />
            ) : null}
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {state.loading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!state.error && cluster && state.value ? (
          <Component item={state.value} section={match.params.section} type={match.params.type} />
        ) : state.loading ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={state.error}
            icon={page.icon}
            text={`Could not get ${page.singleText}`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(DetailsPage, (prevProps, nextProps): boolean => {
  if (prevProps.match.url !== nextProps.match.url) {
    return false;
  }

  return true;
});
