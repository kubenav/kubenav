import { IonItem, IonLabel, IonListHeader, IonSelect, IonSelectOption, IonMenuToggle } from '@ionic/react';
import React, { memo, useContext } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';

const Context: React.FunctionComponent<RouteComponentProps> = ({ history }: RouteComponentProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const changeCluster = (ctx: string) => {
    context.changeCluster(ctx);
    history.push('/');
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
  memo(Context, (): boolean => {
    return true;
  }),
);
