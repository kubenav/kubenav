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
import React, { useContext, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
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

  const [error, setError] = useState<string>('');
  const [showLoading, setShowLoading] = useState<boolean>(false);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [item, setItem] = useState<any>();
  const [url, setUrl] = useState<string>('');

  useEffect(() => {
    const fetchData = async () => {
      setItem(undefined);
      setUrl(match.url);
      await load();
    };

    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [match, context.clusters, context.cluster]);

  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    await load();
  };

  const load = async () => {
    setShowLoading(true);

    try {
      if (!context.clusters || !context.cluster) {
        throw new Error('Select an active cluster');
      }

      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const data: any = await context.request(
        'GET',
        getURL(
          match.params.crnamespace,
          match.params.group,
          match.params.version,
          match.params.name,
          match.params.crname,
        ),
        '',
      );
      setError('');
      setItem(data);
    } catch (err) {
      setError(err.message);
    }

    setShowLoading(false);
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
              <IonButton onClick={() => load()}>
                <IonIcon slot="icon-only" icon={refresh} />
              </IonButton>
              {item ? (
                <EditItem
                  activator="button"
                  item={item}
                  url={getURL(
                    match.params.crnamespace,
                    match.params.group,
                    match.params.version,
                    match.params.name,
                    match.params.crname,
                  )}
                />
              ) : null}
              {item ? (
                <DeleteItem
                  activator="button"
                  item={item}
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
        {showLoading ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {error === '' &&
        context.clusters &&
        context.cluster &&
        context.clusters.hasOwnProperty(context.cluster) &&
        match.url === url &&
        item ? (
          <IonGrid>
            {item.metadata ? <Metadata metadata={item.metadata} type="customresource" /> : null}

            {item.status && item.status.conditions ? (
              <IonRow>
                <Conditions conditions={item.status.conditions} forceFullWidth={true} />
              </IonRow>
            ) : null}

            {item.metadata && item.metadata.name && item.metadata.namespace ? (
              <IonRow>
                <List
                  name="Events"
                  section="cluster"
                  type="events"
                  namespace={item.metadata.namespace}
                  selector={`fieldSelector=involvedObject.name=${item.metadata.name}`}
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
                    <Editor readOnly={true} value={yaml.safeDump(item)} />
                  </IonCardContent>
                </IonCard>
              </IonCol>
            </IonRow>
          </IonGrid>
        ) : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error}
            icon="/assets/icons/kubernetes/crd.png"
            text={`Could not get Custom Resource "${match.params.crname}"`}
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default CustomResourcesDetailsPage;
