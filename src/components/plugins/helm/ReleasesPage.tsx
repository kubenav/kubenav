import { RefresherEventDetail } from '@ionic/core';
import {
  IonButtons,
  IonContent,
  IonHeader,
  IonItem,
  IonItemDivider,
  IonItemGroup,
  IonLabel,
  IonList,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonRefresher,
  IonSearchbar,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { V1SecretList } from '@kubernetes/client-node';
import React, { memo, useContext, useState } from 'react';
import { useQuery } from 'react-query';

import { IContext } from '../../../declarations';
import { kubernetesRequest } from '../../../utils/api';
import { AppContext } from '../../../utils/context';
import LoadingErrorCard from '../../misc/LoadingErrorCard';
import Namespaces from '../../resources/misc/list/Namespaces';
import Details from './Details';
import { IHelmReleases } from './helpers';

// ReleasesPage shows a list of the selected resource. The list can be filtered by namespace and each item contains a status
// indicator, to get an overview of problems in the cluster.
const ReleasesPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  // namespace and showNamespace is used to group all items by namespace and to only show the namespace once via the
  // IonItemDivider component.
  let namespace = '';
  let showNamespace = false;

  // searchText is used to search and filter the list of items.
  const [searchText, setSearchText] = useState<string>('');

  const { isError, isFetching, data, error, refetch } = useQuery<IHelmReleases, Error>(
    ['HelmReleasesPage', cluster ? cluster.id : '', cluster ? cluster.namespace : ''],
    async () => {
      try {
        const secrets: V1SecretList = await kubernetesRequest(
          'GET',
          `${
            cluster && cluster.namespace ? `/api/v1/namespaces/${cluster.namespace}/secrets` : `/api/v1/secrets`
          }?limit=100&labelSelector=owner=helm`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        const helmReleases: IHelmReleases = {};
        for (const secret of secrets.items) {
          if (
            secret.metadata &&
            secret.metadata.name &&
            secret.metadata.namespace &&
            secret.metadata.labels &&
            secret.data
          ) {
            const d = new Date(parseInt(secret.metadata.labels.modifiedAt) * 1000);
            const helmRelease = {
              name: secret.metadata.labels.name,
              namespace: secret.metadata.namespace,
              revision: parseInt(secret.metadata.labels.version),
              updated: `${d.getFullYear()}-${('0' + (d.getMonth() + 1)).slice(-2)}-${('0' + d.getDate()).slice(-2)} ${(
                '0' + d.getHours()
              ).slice(-2)}:${('0' + d.getMinutes()).slice(-2)}:${('0' + d.getSeconds()).slice(-2)}`,
              status: secret.metadata.labels.status,
              secretName: secret.metadata.name,
            };

            if (
              !helmReleases.hasOwnProperty(`${helmRelease.name}-${helmRelease.namespace}`) ||
              helmRelease.revision > helmReleases[`${helmRelease.name}-${helmRelease.namespace}`].revision
            ) {
              helmReleases[`${helmRelease.name}-${helmRelease.namespace}`] = helmRelease;
            }
          }
        }

        return helmReleases;
      } catch (err) {
        throw err;
      }
    },
    {
      ...context.settings.queryConfig,
      refetchInterval: context.settings.queryRefetchInterval,
    },
  );

  // The doRefresh method is used for a manual reload of the items for the corresponding resource. The
  // event.detail.complete() call is required to finish the animation of the IonRefresher component.
  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    refetch();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Helm Releases</IonTitle>
          <IonButtons slot="primary">
            <Namespaces />
            <Details refresh={refetch} />
          </IonButtons>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}
        <IonRefresher slot="fixed" onIonRefresh={doRefresh} />

        {!isError && cluster ? (
          <React.Fragment>
            <IonSearchbar
              inputmode="search"
              value={searchText}
              onIonChange={(e) => setSearchText(e.detail.value ? e.detail.value : '')}
            />

            <IonList>
              {data
                ? Object.keys(data)
                    .filter((key) => {
                      const regex = new RegExp(searchText, 'gi');
                      return data[key].name.match(regex);
                    })
                    .map((key, j) => {
                      if (data[key].namespace !== namespace) {
                        namespace = data[key].namespace;
                        showNamespace = true;
                      } else {
                        showNamespace = false;
                      }

                      return (
                        <IonItemGroup key={j}>
                          {showNamespace ? (
                            <IonItemDivider>
                              <IonLabel>{namespace}</IonLabel>
                            </IonItemDivider>
                          ) : null}
                          {}
                          <IonItem
                            routerLink={`/plugins/helm/${data[key].namespace}/${data[key].secretName}`}
                            routerDirection="forward"
                          >
                            <IonLabel>
                              <h2>{data[key].name}</h2>
                              <p>
                                Revision: {data[key].revision} | Updated: {data[key].updated} | Status:{' '}
                                {data[key].status}{' '}
                              </p>
                            </IonLabel>
                          </IonItem>
                        </IonItemGroup>
                      );
                    })
                : null}
            </IonList>
          </React.Fragment>
        ) : isFetching ? null : (
          <LoadingErrorCard
            cluster={context.cluster}
            clusters={context.clusters}
            error={error}
            icon="/assets/icons/kubernetes/secret.png"
            text="Could not get Helm Releases"
          />
        )}
      </IonContent>
    </IonPage>
  );
};

export default memo(ReleasesPage, (): boolean => {
  return true;
});
