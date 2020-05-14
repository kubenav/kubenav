import { IonCol, IonRow } from '@ionic/react';
import React from 'react';

import { getProperty } from '../../../../utils/helpers';

interface IRowProps {
  objKey: string;
  obj: object;
  title: string;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  value?: (value: any) => any;
  defaultValue?: string;
}

const Row: React.FunctionComponent<IRowProps> = ({ objKey, obj, title, value, defaultValue }: IRowProps) => {
  const val = getProperty(obj, objKey);

  if (val || typeof val === 'number') {
    return (
      <IonRow>
        <IonCol size="auto">
          <b>{title}:</b>
        </IonCol>
        <IonCol>{value ? value(val) : val}</IonCol>
      </IonRow>
    );
  } else if (defaultValue) {
    return (
      <IonRow>
        <IonCol size="auto">
          <b>{title}:</b>
        </IonCol>
        <IonCol>{defaultValue}</IonCol>
      </IonRow>
    );
  } else {
    return <React.Fragment />;
  }
};

export default Row;
