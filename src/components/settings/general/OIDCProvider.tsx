import { IonIcon, IonItem, IonItemOption, IonItemOptions, IonItemSliding, IonLabel } from '@ionic/react';
import { trash } from 'ionicons/icons';
import React, { useContext } from 'react';

import { IContext } from '../../../declarations';
import { AppContext } from '../../../utils/context';

interface IOIDCProviderProps {
  provider: string;
}

const OIDCProvider: React.FunctionComponent<IOIDCProviderProps> = ({ provider }) => {
  const context = useContext<IContext>(AppContext);

  return (
    <IonItemSliding>
      <IonItem>
        <IonLabel>
          <h2>{provider}</h2>
        </IonLabel>
      </IonItem>

      <IonItemOptions side="end">
        <IonItemOption color="danger" onClick={() => context.deleteOIDCProvider(provider)}>
          <IonIcon slot="start" icon={trash} />
          Delete
        </IonItemOption>
      </IonItemOptions>
    </IonItemSliding>
  );
};

export default OIDCProvider;
