import { IonItem, IonLabel, IonListHeader, IonSelect, IonSelectOption, IonMenuToggle } from '@ionic/react';
import React, { memo, useContext } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';

const Context: React.FunctionComponent<RouteComponentProps> = ({ history, location }: RouteComponentProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

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
          <IonLabel>Context</IonLabel>
        </IonListHeader>
        <IonMenuToggle autoHide={false}>
          <IonItem>
            <IonSelect
              disabled={location.pathname.startsWith('/settings/clusters')}
              value={cluster.name}
              onIonChange={(e) => changeCluster(e.detail.value)}
              interface="action-sheet"
              interfaceOptions={{
                header: 'Select Context',
              }}
              style={{ maxWidth: '100%', width: '100%' }}
            >
              {context.clusters
                ? Object.keys(context.clusters).map((key) => {
                    return context.clusters ? (
                      <IonSelectOption key={key} value={context.clusters[key].name}>
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
  memo(Context, (prevProps, nextProps): boolean => {
    if (prevProps.location.pathname !== nextProps.location.pathname) {
      return false;
    }

    return true;
  }),
);
