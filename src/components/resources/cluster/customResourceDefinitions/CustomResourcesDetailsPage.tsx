import { RefresherEventDetail } from '@ionic/core';
import {
  IonBackButton,
  IonButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonContent,
  IonHeader,
  IonIcon,
  IonGrid,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonRow,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import { refresh } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { memo, useContext, useEffect } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import useAsyncFn from '../../../../utils/useAsyncFn';
import Editor from '../../../misc/Editor';
import LoadingErrorCard from '../../../misc/LoadingErrorCard';
import List from '../../misc/List';
import DeleteItem from '../../misc/modify/DeleteItem';
import EditItem from '../../misc/modify/EditItem';
import Conditions from '../../misc/template/Conditions';
import Metadata from '../../misc/template/Metadata';

interface IMatchParams {
  group: string;
  version: string;
  name: string;
  crnamespace: string;
  crname: string;
}

type ICustomResourcesDetailsPageProps = RouteComponentProps<IMatchParams>;

const getURL = (namespace: string, group: string, version: string, name: string, crname: string): string => {
  return namespace && namespace !== 'undefined'
    ? `/apis/${group}/${version}/namespaces/${namespace}/${name}/${crname}`
    : `/apis/${group}/${version}/${name}/${crname}`;
};

const CustomResourcesDetailsPage: React.FunctionComponent<ICustomResourcesDetailsPageProps> = ({
  match,
}: ICustomResourcesDetailsPageProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  // useAsyncFn is a custom React hook which wrapps our API call.
  const [state, fetch, fetchInit] = useAsyncFn(
    async () =>
      await context.request(
        'GET',
        getURL(
          match.params.crnamespace,
          match.params.group,
          match.params.version,
          match.params.name,
          match.params.crname,
        ),
        '',
      ),
    [],
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
            <IonBackButton
              defaultHref={`/customresources/${match.params.group}/${match.params.group}/${match.params.name}`}
            />
          </IonButtons>
          <IonTitle>{match.params.crname}</IonTitle>
          {!isPlatform('hybrid') ? (
            <IonButtons slot="primary">
              <IonButton onClick={() => fetch()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
              {state.value ? (
                <EditItem
                  activator="button"
                  item={state.value}
                  url={getURL(
                    match.params.crnamespace,
                    match.params.group,
                    match.params.version,
                    match.params.name,
                    match.params.crname,
                  )}
                />
              ) : null}
              {state.value ? (
                <DeleteItem
                  activator="button"
                  item={state.value}
                  url={getURL(
                    match.params.crnamespace,
                    match.params.group,
                    match.params.version,
                    match.params.name,
                    match.params.crname,
                  )}
                />
              ) : null}
            </IonButtons>
          ) : null}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {state.loading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!state.error && cluster && state.value ? (
          <IonGrid>
            {state.value.metadata ? <Metadata metadata={state.value.metadata} type="customresource" /> : null}

            {state.value.status && state.value.status.conditions ? (
              <IonRow>
                <Conditions conditions={state.value.status.conditions} forceFullWidth={true} />
              </IonRow>
            ) : null}

            {state.value.metadata && state.value.metadata.name && state.value.metadata.namespace ? (
              <IonRow>
                <List
                  name="Events"
                  section="cluster"
                  type="events"
                  namespace={state.value.metadata.namespace}
                  selector={`fieldSelector=involvedObject.name=${state.value.metadata.name}`}
                />
              </IonRow>
            ) : null}

            <IonRow>
              <IonCol>
                <IonCard>
                  <IonCardHeader>
                    <IonCardTitle>YAML</IonCardTitle>
                  </IonCardHeader>
                  <IonCardContent>
                    <Editor readOnly={true} value={yaml.safeDump(state.value)} />
                  </IonCardContent>
                </IonCard>
              </IonCol>
            </IonRow>
          </IonGrid>
        ) : state.loading ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={state.error}
            icon="/assets/icons/kubernetes/crd.png"
            text={`Could not get Custom Resource "${match.params.crname}"`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(CustomResourcesDetailsPage, (prevProps, nextProps): boolean => {
  if (prevProps.match.url !== nextProps.match.url) {
    return false;
  }

  return true;
});
