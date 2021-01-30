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
import React, { useContext, useEffect, useState } from 'react';

import { IAppPage, IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { isNamespaced } from '../../../../utils/helpers';
import Editor from '../../../misc/Editor';

interface IValues {
  name: string;
  namespace: string;
  replicas: number;
  image: string;
}

const initialValues: IValues = {
  name: '',
  namespace: '',
  replicas: 1,
  image: '',
};

const createYAML = (type: string, apiVersion: string, kind: string, values: IValues): string => {
  if (type === 'deployments' || type === 'statefulsets') {
    return `apiVersion: ${apiVersion}
kind: ${kind}
metadata:
  labels:
    app: ${values.name}
  name: ${values.name}
  namespace: ${values.namespace}
spec:
  replicas: ${values.replicas}
  selector:
    matchLabels:
      app: ${values.name}
  template:
    metadata:
      labels:
        app: ${values.name}
    spec:
      containers:
        - name: ${values.name}
          image: ${values.image}`;
  } else if (type === 'daemonsets' || type === 'jobs') {
    return `apiVersion: ${apiVersion}
kind: ${kind}
metadata:
  labels:
    app: ${values.name}
  name: ${values.name}
  namespace: ${values.namespace}
spec:
  selector:
    matchLabels:
      app: ${values.name}
  template:
    metadata:
      labels:
        app: ${values.name}
    spec:
      containers:
        - name: ${values.name}
          image: ${values.image}`;
  } else if (type === 'pods') {
    return `apiVersion: ${apiVersion}
kind: ${kind}
metadata:
  labels:
    app: ${values.name}
  name: ${values.name}
  namespace: ${values.namespace}
spec:
  containers:
    - name: ${values.name}
      image: ${values.image}`;
  } else if (type === 'cronjobs') {
    return `apiVersion: ${apiVersion}
kind: ${kind}
metadata:
  labels:
    app: ${values.name}
  name: ${values.name}
  namespace: ${values.namespace}
spec:
  jobTemplate:
    spec:
      template:
        metadata:
          labels:
            app: ${values.name}
        spec:
          containers:
            - name: ${values.name}
              image: ${values.image}`;
  } else if (isNamespaced(type)) {
    return `apiVersion: ${apiVersion}
kind: ${kind}
metadata:
  name: ${values.name}
  namespace: ${values.namespace}`;
  } else {
    return `apiVersion: ${apiVersion}
kind: ${kind}
metadata:
  name: ${values.name}`;
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
  refresh: () => void;
  show: boolean;
  hide: () => void;
}

const CreateItem: React.FunctionComponent<ICreateItemProps> = ({
  type,
  page,
  refresh,
  show,
  hide,
}: ICreateItemProps) => {
  const context = useContext<IContext>(AppContext);
  const cluster = context.currentCluster();

  const [error, setError] = useState<string>('');
  const [view, setView] = useState<number>(0);
  const [value, setValue] = useState<string>('');
  const [values, setValues] = useState<IValues>(
    cluster ? { ...initialValues, namespace: cluster.namespace } : initialValues,
  );

  const handleNextView = () => {
    setValue(createYAML(type, page.apiVersion, page.kind, values));
    setView(1);
  };

  const handleValues = (event) => {
    setValues({ ...values, [event.target.name]: event.target.value });
  };

  const handleCreate = async () => {
    try {
      const yamlObj = yaml.load(value);
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
      hide();
      refresh();
    } catch (err) {
      setError(err);
    }
  };

  useEffect(() => {
    setView(0);
    setValues(cluster ? { ...initialValues, namespace: cluster.namespace } : initialValues);
  }, [cluster, show]);

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

      <IonModal isOpen={show} onDidDismiss={hide}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={hide}>
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
                <IonInput type="text" required={true} name="name" value={values.name} onInput={handleValues} />
              </IonItem>
              {isNamespaced(type) ? (
                <IonItem>
                  <IonLabel position="stacked">Namespace</IonLabel>
                  <IonInput
                    type="text"
                    required={true}
                    name="namespace"
                    value={values.namespace}
                    onInput={handleValues}
                  />
                </IonItem>
              ) : null}
              {type === 'deployments' || type === 'statefulsets' ? (
                <IonItem>
                  <IonLabel position="stacked">Replicas</IonLabel>
                  <IonInput
                    type="number"
                    required={true}
                    name="replicas"
                    value={values.replicas}
                    onInput={handleValues}
                  />
                </IonItem>
              ) : null}
              {type === 'cronjobs' ||
              type === 'daemonsets' ||
              type === 'deployments' ||
              type === 'jobs' ||
              type === 'pods' ||
              type === 'statefulsets' ? (
                <IonItem>
                  <IonLabel position="stacked">Image</IonLabel>
                  <IonInput type="text" required={true} name="image" value={values.image} onInput={handleValues} />
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
