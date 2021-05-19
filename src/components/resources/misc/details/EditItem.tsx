import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonItemOption,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import * as jsonpatch from 'fast-json-patch';
import { close, create } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useContext, useEffect, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import Editor from '../../../misc/Editor';

interface IEditItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const EditItemActivator: React.FunctionComponent<IEditItemActivatorProps> = ({
  activator,
  onClick,
}: IEditItemActivatorProps) => {
  if (activator === 'item-option') {
    return (
      <IonItemOption color="primary" onClick={onClick}>
        <IonIcon slot="start" icon={create} />
        Edit
      </IonItemOption>
    );
  } else if (activator === 'button') {
    return (
      <IonButton onClick={onClick}>
        <IonIcon slot="icon-only" icon={create} />
      </IonButton>
    );
  } else {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={create} />
        <IonLabel>Edit</IonLabel>
      </IonItem>
    );
  }
};

interface IEditItemProps {
  show: boolean;
  hide: () => void;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
  url: string;
}

const EditItem: React.FunctionComponent<IEditItemProps> = ({ show, hide, item, url }: IEditItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [value, setValue] = useState<string>('');

  useEffect(() => {
    if (context.settings.editorFormat === 'json') {
      setValue(JSON.stringify(item, null, 2));
    } else {
      setValue(yaml.dump(item));
    }
  }, [item, context.settings.editorFormat]);

  const handleSave = async () => {
    try {
      let parsedObj = null;
      if (context.settings.editorFormat === 'json') {
        parsedObj = JSON.parse(value);
      } else {
        parsedObj = yaml.load(value);
      }

      if (parsedObj) {
        const diff = jsonpatch.compare(item, parsedObj);
        await kubernetesRequest(
          'PATCH',
          url,
          JSON.stringify(diff),
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );
        hide();
      }
    } catch (err) {
      setError(err);
    }
  };

  return (
    <React.Fragment>
      {error !== '' ? (
        <IonAlert
          isOpen={error !== ''}
          onDidDismiss={() => setError('')}
          header={`Could not save ${item.metadata ? item.metadata.name : ''}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonModal isOpen={show} onDidDismiss={hide}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={hide}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>{item.metadata ? item.metadata.name : ''}</IonTitle>
            <IonButtons slot="primary">
              <IonButton onClick={() => handleSave()}>Save</IonButton>
            </IonButtons>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Editor
            readOnly={false}
            mode={context.settings.editorFormat === 'json' ? 'json' : 'yaml'}
            value={value}
            onChange={(newValue) => setValue(newValue)}
            fullHeight={true}
          />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default EditItem;
