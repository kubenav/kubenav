import {
  IonIcon,
} from '@ionic/react';
import { radioButtonOn } from 'ionicons/icons';
import React from 'react';

interface IItemStatusProps {
  status: string;
}

const ItemStatus: React.FunctionComponent<IItemStatusProps> = ({ status }) => {
  let color = '';

  switch (status) {
    case 'success':
      color = 'success';
      break;
    case 'warning':
      color = 'warning';
      break;
    case 'danger':
      color = 'danger';
      break;
  }

  if (color === '') {
    return (
      <React.Fragment />
    )
  } else {
    return (
      <IonIcon slot="end" color={color} icon={radioButtonOn} />
    );
  }
};

export default ItemStatus;
