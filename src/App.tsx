import {
  IonApp,
  IonRouterOutlet,
  IonSplitPane
} from '@ionic/react';
import { IonReactRouter } from '@ionic/react-router';
import React from 'react';
import { Route } from 'react-router-dom';

import '@ionic/react/css/normalize.css';

import '@ionic/react/css/core.css';
import '@ionic/react/css/display.css';
import '@ionic/react/css/flex-utils.css';
import '@ionic/react/css/float-elements.css';
import '@ionic/react/css/padding.css';
import '@ionic/react/css/structure.css';
import '@ionic/react/css/text-alignment.css';
import '@ionic/react/css/text-transformation.css';
import '@ionic/react/css/typography.css';

import Menu from './components/misc/Menu';
import { AppContextProvider } from './context';
import ClustersPage from './pages/Clusters';
import ClustersAWSPage from './pages/ClustersAWS';
import ClustersGooglePage from './pages/ClustersGoogle';
import ClustersKubeconfigPage from './pages/ClustersKubeconfig';
import ClustersManualPage from './pages/ClustersManual';
import CustomResourcesListPage from './pages/CustomResourcesList';
import DetailsPage from './pages/Details';
import HomePage from './pages/Home';
import InfoPage from './pages/Info';
import ListPage from './pages/List';
import { sections } from './sections';

import './theme/custom.css';
import './theme/variables.css';

const App: React.FunctionComponent = () => (
  <IonApp>
    <AppContextProvider>
      <IonReactRouter>
        <IonSplitPane contentId="main">
          <Menu sections={sections}/>
          <IonRouterOutlet id="main">
            <Route path="/" component={HomePage} exact={true} />
            <Route path="/kubernetes/:section/:type" component={ListPage} exact={true} />
            <Route path="/kubernetes/:section/:type/:namespace/:name" component={DetailsPage} exact={true} />
            <Route path="/customresources/:group/:version/:name" component={CustomResourcesListPage} exact={true} />
            <Route path="/settings/clusters" component={ClustersPage} exact={true} />
            <Route path="/settings/clusters/aws/:region" component={ClustersAWSPage} exact={true} />
            <Route path="/settings/clusters/google" component={ClustersGooglePage} exact={true} />
            <Route path="/settings/clusters/kubeconfig" component={ClustersKubeconfigPage} exact={true} />
            <Route path="/settings/clusters/manual" component={ClustersManualPage} exact={true} />
            <Route path="/settings/info" component={InfoPage} exact={true} />
          </IonRouterOutlet>
        </IonSplitPane>
      </IonReactRouter>
    </AppContextProvider>
  </IonApp>
);

export default App;
