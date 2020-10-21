import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonInput,
  IonItem,
  IonItemOption,
  IonLabel,
  IonList,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close, create } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useContext, useState } from 'react';

import { IAppPage, IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { isNamespaced } from '../../../../utils/helpers';
import Editor from '../../../misc/Editor';

const createYAML = (
  type: string,
  apiVersion: string,
  kind: string,
  name: string,
  namespace: string,
  replicas: number,
  image: string,
): string => {
  if (type === 'deployments' || type === 'statefulsets') {
    return `apiVersion: ${apiVersion}
    kind: ${kind}
    metadata:
      labels:
        app: ${name}
      name: ${name}
      namespace: ${namespace}
    spec:
      replicas: ${replicas}
      selector:
        matchLabels:
          app: ${name}
      template:
        metadata:
          labels:
            app: ${name}
        spec:
          containers:
            - name: ${name}
              image: ${image}`;
  } else if (type === 'daemonsets' || type === 'jobs') {
    return `apiVersion: ${apiVersion}
    kind: ${kind}
    metadata:
      labels:
        app: ${name}
      name: ${name}
      namespace: ${namespace}
    spec:
      selector:
        matchLabels:
          app: ${name}
      template:
        metadata:
          labels:
            app: ${name}
        spec:
          containers:
            - name: ${name}
              image: ${image}`;
  } else if (isNamespaced(type)) {
    return `apiVersion: ${apiVersion}
    kind: ${kind}
    metadata:
      name: ${name}
      namespace: ${namespace}`;
  } else {
    return `apiVersion: ${apiVersion}
    kind: ${kind}
    metadata:
      name: ${name}`;
  }
};

interface ICreateItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const CreateItemActivator: React.FunctionComponent<ICreateItemActivatorProps> = ({
  activator,
  onClick,
}: ICreateItemActivatorProps) => {
  if (activator === 'item-option') {
    return (
      <IonItemOption color="primary" onClick={onClick}>
        <IonIcon slot="start" icon={create} />
        Create
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
        <IonLabel>Create</IonLabel>
      </IonItem>
    );
  }
};

interface ICreateItemProps {
  page: IAppPage;
  type: string;
  show: boolean;
  hide: () => void;
}

const CreateItem: React.FunctionComponent<ICreateItemProps> = ({ type, page, show, hide }: ICreateItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');
  const [view, setView] = useState<number>(0);
  const [valueName, setValueName] = useState<string>('');
  const [valueNamespace, setValueNamespace] = useState<string>('');
  const [valueReplicas, setValueReplicas] = useState<number>(1);
  const [valueImage, setValueImage] = useState<string>('');
  const [value, setValue] = useState<string>('');

  const handleNextView = () => {
    setValue(createYAML(type, page.apiVersion, page.kind, valueName, valueNamespace, valueReplicas, valueImage));
    setView(1);
  };

  const handleName = (event) => {
    setValueName(event.target.value);
  };

  const handleNamespace = (event) => {
    setValueNamespace(event.target.value);
  };

  const handleReplicas = (event) => {
    setValueReplicas(event.target.value);
  };

  const handleImage = (event) => {
    setValueImage(event.target.value);
  };

  const handleHide = () => {
    setView(0);
    hide();
  };

  const handleCreate = async () => {
    try {
      const yamlObj = yaml.safeLoad(value);
      if (yamlObj && typeof yamlObj === 'object') {
        await kubernetesRequest(
          'POST',
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          page.listURL(isNamespaced(type) ? (yamlObj as any).metadata.namespace : ''),
          JSON.stringify(yamlObj),
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );
      }
      handleHide();
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
          header={`Could not create ${page.singleText}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonModal isOpen={show} onDidDismiss={handleHide}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={handleHide}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>Create {page.singleText}</IonTitle>
            <IonButtons slot="primary">
              {view === 0 ? (
                <IonButton onClick={() => handleNextView()}>Next</IonButton>
              ) : (
                <IonButton onClick={() => handleCreate()}>Create</IonButton>
              )}
            </IonButtons>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          {view === 0 ? (
            <IonList lines="full">
              <IonItem>
                <IonLabel position="stacked">Name</IonLabel>
                <IonInput type="text" required={true} value={valueName} onInput={handleName} />
              </IonItem>
              {isNamespaced(type) ? (
                <IonItem>
                  <IonLabel position="stacked">Namespace</IonLabel>
                  <IonInput type="text" required={true} value={valueNamespace} onInput={handleNamespace} />
                </IonItem>
              ) : null}
              {type === 'deployments' || type === 'statefulsets' ? (
                <IonItem>
                  <IonLabel position="stacked">Replicas</IonLabel>
                  <IonInput type="number" required={true} value={valueReplicas} onInput={handleReplicas} />
                </IonItem>
              ) : null}
              {type === 'daemonsets' || type === 'deployments' || type === 'statefulsets' || type === 'jobs' ? (
                <IonItem>
                  <IonLabel position="stacked">Image</IonLabel>
                  <IonInput type="text" required={true} value={valueImage} onInput={handleImage} />
                </IonItem>
              ) : null}
            </IonList>
          ) : (
            <Editor readOnly={false} value={value} onChange={(newValue) => setValue(newValue)} fullHeight={true} />
          )}
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default CreateItem;
