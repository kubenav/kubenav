import {
  IonButtons,
  IonCard,
  IonCardContent,
  IonContent,
  IonHeader,
  IonMenuButton,
  IonPage,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import React, { memo, useContext } from 'react';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import AddCluster from './clusters/AddCluster';
import ClusterItem from './clusters/ClusterItem';

const ClustersPage: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Clusters</IonTitle>
          {isPlatform('hybrid') ? <AddCluster /> : null}
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {context.clusters ? (
          Object.keys(context.clusters).map((key) => {
            return context.clusters ? <ClusterItem key={key} cluster={context.clusters[key]} /> : null;
          })
        ) : !isPlatform('hybrid') ? (
          <IonCard>
            <IonCardContent>
              <p className="paragraph-margin-bottom">
                It looks like you have not configured a cluster yet. kubenav loads your clusters from{' '}
                <code>~/.kube/.kubeconfig</code>, <code>~/.kube/.config</code> or the <code>KUBECONFIG</code>{' '}
                environment variable. You can also pass a Kubeconfig to kubenav via the <code>-kubeconfig</code> flag.
              </p>
              <p>
                With the <code>-include-kubeconfig</code> and <code>-exlude-kubeconfig</code> flags you can specify a
                list of comma separated globs to load your Kubeconfig files from. The <code>-sync</code> flags wrotes
                your cluster and namespace changes back to the loaded Kubeconfig, so that the context/namespace is also
                changed in your terminal.
              </p>
            </IonCardContent>
          </IonCard>
        ) : null}
      </IonContent>
    </IonPage>
  );
};

export default memo(ClustersPage, (): boolean => {
  return true;
});
