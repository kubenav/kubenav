import {
  IonCol,
  IonRow,
} from '@ionic/react';
import React from 'react';

import { getProperty } from '../../utils';

interface RowProps {
  objKey: string;
  obj: any;
  title: string;
  value?: (value: any) => any;
  defaultValue?: string;
}

const Row: React.FunctionComponent<RowProps> = ({ objKey, obj, title, value, defaultValue }) => {
  const val = getProperty(obj, objKey);

  if (val || typeof val === 'number') {
    return (
      <IonRow>
        <IonCol size="auto"><b>{title}:</b></IonCol>
        <IonCol>{value ? value(val) : val}</IonCol>
      </IonRow>
    )
  } else if (defaultValue) {
    return (
      <IonRow>
        <IonCol size="auto"><b>{title}:</b></IonCol>
        <IonCol>{defaultValue}</IonCol>
      </IonRow>
    )
  } else {
    return (
      <React.Fragment />
    )
  }
};

export default Row;
