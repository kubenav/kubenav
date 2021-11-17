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
import ItemStatus from '../../resources/misc/template/ItemStatus';
import Details from './Details';
import { IHelmRelease, IHelmReleases } from './helpers';

const ReleasesPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  let namespace = '';
  let showNamespace = false;

  const [searchText, setSearchText] = useState<string>('');

  const { isError, isFetching, data, error, refetch } = useQuery<IHelmReleases, Error>(
    [
      'HelmReleasesPage',
      cluster ? cluster.id : '',
      cluster ? cluster.namespace : '',
      context.settings.helmShowAllVersions,
    ],
    async () => {
      try {
        const secrets: V1SecretList = await kubernetesRequest(
          'GET',
          `${
            cluster && cluster.namespace ? `/api/v1/namespaces/${cluster.namespace}/secrets` : `/api/v1/secrets`
          }?limit=${context.settings.queryLimit}&labelSelector=owner=helm`,
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

            if (context.settings.helmShowAllVersions) {
              helmReleases[`${helmRelease.secretName}-${helmRelease.namespace}`] = helmRelease;
            } else {
              if (
                !helmReleases.hasOwnProperty(`${helmRelease.name}-${helmRelease.namespace}`) ||
                helmRelease.revision > helmReleases[`${helmRelease.name}-${helmRelease.namespace}`].revision
              ) {
                helmReleases[`${helmRelease.name}-${helmRelease.namespace}`] = helmRelease;
              }
            }
          }
        }

        return helmReleases;
      } catch (err) {
        throw err;
      }
    },
    {
      refetchInterval: context.settings.queryRefetchInterval,
    },
  );

  const status = (helmRelease: IHelmRelease): string => {
    if (
      helmRelease.status === 'deployed' ||
      helmRelease.status === 'superseded' ||
      helmRelease.status === 'uninstalled'
    ) {
      return 'success';
    }

    if (helmRelease.status === 'failed') {
      return 'danger';
    }

    return 'warning';
  };

  const doRefresh = async (event: CustomEvent<RefresherEventDetail>) => {
    event.detail.complete();
    refetch();
  };

  const setShowAllVersions = (value: boolean) => {
    context.editSettings({ ...context.settings, helmShowAllVersions: value });
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Helm</IonTitle>
          <IonButtons slot="primary">
            <Namespaces />
            <Details
              refresh={refetch}
              showAllVersions={context.settings.helmShowAllVersions}
              setShowAllVersions={setShowAllVersions}
            />
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
                    .map((key, index) => {
                      if (data[key].namespace !== namespace) {
                        namespace = data[key].namespace;
                        showNamespace = true;
                      } else {
                        showNamespace = false;
                      }

                      return (
                        <IonItemGroup key={index}>
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
                            <ItemStatus status={status(data[key])} />
                            <IonLabel>
                              <h2>{data[key].name}</h2>
                              <p>
                                Revision: {data[key].revision} | Updated: {data[key].updated} | Status:{' '}
                                {data[key].status}
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
            error={error as Error}
            icon="/assets/icons/kubernetes/helm.png"
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
