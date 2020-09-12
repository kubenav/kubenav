import { IonItem, IonLabel, IonListHeader, IonSelect, IonSelectOption, IonMenuToggle, isPlatform } from '@ionic/react';
import React, { memo, useContext } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import useWindowWidth from '../../utils/useWindowWidth';

const Clusters: React.FunctionComponent<RouteComponentProps> = ({ history, location }: RouteComponentProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();
  const width = useWindowWidth();

  // The change cluster function is used to change the current cluster. The function doesn't work for the
  // /settings/clusters page, because the function is also triggered when the cluster is changed on this page. Therefore
  // the user is redirect from the /settings/clusters to another page and the context.changeCluster function is called
  // twice.
  // This is also the reason why the select box is disabled for the /settings/clusters page.
  const changeCluster = async (id: string) => {
    const path = location.pathname;

    // If the user is viewing a details page, when changing the cluster, he is redirected to the corresponding list
    // view. For every other case the user isn't redirected.
    if (!path.startsWith('/settings/clusters')) {
      await context.changeCluster(id);

      if (path.startsWith('/resources')) {
        const parts = path.split('/');
        if (parts.length > 4) {
          history.push(parts.slice(0, 4).join('/'));
        }
      } else if (path.startsWith('/customresources')) {
        const parts = path.split('/');
        if (parts.length > 5) {
          history.push(parts.slice(0, 5).join('/'));
        }
      }
    }
  };

  if (cluster) {
    return (
      <React.Fragment>
        <IonListHeader mode="md">
          <IonLabel>Clusters</IonLabel>
        </IonListHeader>
        <IonMenuToggle autoHide={false}>
          <IonItem>
            <IonSelect
              disabled={location.pathname.startsWith('/settings/clusters')}
              value={cluster.id}
              onIonChange={(e) => changeCluster(e.detail.value)}
              interface={isPlatform('hybrid') || width < 992 ? 'action-sheet' : 'popover'}
              interfaceOptions={
                isPlatform('hybrid') || width < 992
                  ? {
                      header: 'Select Cluster',
                    }
                  : {
                      cssClass: 'menu-cluster-select',
                    }
              }
              className="menu-cluster-select"
            >
              {context.clusters
                ? Object.keys(context.clusters).map((key) => {
                    return context.clusters ? (
                      <IonSelectOption key={key} value={context.clusters[key].id}>
                        {context.clusters[key].name}
                      </IonSelectOption>
                    ) : null;
                  })
                : null}
            </IonSelect>
          </IonItem>
        </IonMenuToggle>
      </React.Fragment>
    );
  } else {
    return null;
  }
};

export default withRouter(
  memo(Clusters, (prevProps, nextProps): boolean => {
    if (prevProps.location.pathname !== nextProps.location.pathname) {
      return false;
    }

    return true;
  }),
);
