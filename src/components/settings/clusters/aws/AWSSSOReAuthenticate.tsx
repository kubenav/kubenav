import { IonButton, IonCardContent } from '@ionic/react';
import React, { useContext, useState } from 'react';
import { RouteComponentProps, withRouter } from 'react-router-dom';

import { IAWSSSO, IContext } from '../../../../declarations';
import { getAWSSSOConfig, getAWSSSOCredentailsWithConfig } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { openURL } from '../../../../utils/helpers';

type IAWSSSOReAuthenticateProps = RouteComponentProps;

const AWSSSOReAuthenticate: React.FunctionComponent<IAWSSSOReAuthenticateProps> = ({
  history,
}: IAWSSSOReAuthenticateProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const [config, setConfig] = useState<IAWSSSO | undefined>(undefined);
  const [error, setError] = useState<string>('Your access token is expired.');

  const startSSOFlow = async () => {
    try {
      if (cluster && cluster.authProviderAWSSSO) {
        const ssoConfig = await getAWSSSOConfig(cluster.authProviderAWSSSO.startURL, cluster.authProviderAWSSSO.region);
        setConfig(ssoConfig);
      }
    } catch (err) {
      setError(err.message);
    }
  };

  const finish = async (ssoConfig: IAWSSSO) => {
    try {
      if (cluster && cluster.authProviderAWSSSO) {
        const credentials = await getAWSSSOCredentailsWithConfig(
          ssoConfig,
          cluster.authProviderAWSSSO.startURL,
          cluster.authProviderAWSSSO.ssoRegion,
          cluster.authProviderAWSSSO.accountID,
          cluster.authProviderAWSSSO.roleName,
          cluster.authProviderAWSSSO.region,
        );

        const tmpCluster = cluster;
        tmpCluster.authProviderAWSSSO = credentials;

        context.editCluster(tmpCluster);
        history.go(0);
      }
    } catch (err) {
      setError(err.message);
    }
  };

  return (
    <IonCardContent>
      {error ? <p className="paragraph-margin-bottom">{error}</p> : null}

      {config ? (
        <React.Fragment>
          <p className="paragraph-margin-bottom">
            To finish the sign in process you have to click the <b>Verify</b> button and after you finished the
            verification process the <b>Finish Sign In Process</b> button.
          </p>
          <IonButton expand="block" onClick={() => openURL(config.device.VerificationUriComplete)}>
            Verify
          </IonButton>
          <IonButton expand="block" onClick={() => finish(config)}>
            Finish Sign In Process
          </IonButton>
        </React.Fragment>
      ) : (
        <IonButton expand="block" onClick={() => startSSOFlow()}>
          Sign In
        </IonButton>
      )}
    </IonCardContent>
  );
};

export default withRouter(AWSSSOReAuthenticate);
