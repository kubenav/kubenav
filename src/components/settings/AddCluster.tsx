import {
  IonAlert,
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonModal,
  IonSegment,
  IonSegmentButton,
  IonTextarea,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { add, close } from 'ionicons/icons';
import yaml from 'js-yaml';
import React, { useContext, useState } from 'react';

import { AppContext } from '../../context';
import { IContext, IKubeconfig, IKubeconfigCluster, IKubeconfigClusterRef, IKubeconfigUser, IKubeconfigUserRef } from '../../declarations';

const getKubeconfigCluster = (name: string, clusters: IKubeconfigClusterRef[]): IKubeconfigCluster|null => {
  for (let cluster of clusters) {
    if (cluster.name === name) {
      return cluster.cluster
    }
  }

  return null
};

const getKubeconfigUser = (name: string, users: IKubeconfigUserRef[]): IKubeconfigUser|null => {
  for (let user of users) {
    if (user.name === name) {
      return user.user;
    }
  }

  return null
};

const AddCluster: React.FunctionComponent = () => {
  const context = useContext<IContext>(AppContext);

  const [showModal, setShowModal] = useState<boolean>(false);
  const [error, setError] = useState<string>('');
  const [type, setType] = useState<string>('kubeconfig');
  const [name, setName] = useState<string>('');
  const [url, setURL] = useState<string>('');
  const [certificateAuthorityData, setCertificateAuthorityData] = useState<string>('');
  const [clientCertificateData, setClientCertificateData] = useState<string>('');
  const [clientKeyData, setClientKeyData] = useState<string>('');
  const [kubeconfig, setKubeconfig] = useState<string>('');
  const [token, setToken] = useState<string>('');

  const handleType = (event) => {
    setType(event.detail.value);
  };

  const handleName = (event) => {
    setName(event.target.value);
  };

  const handleURL = (event) => {
    setURL(event.target.value);
  };

  const handleCertificateAuthorityData = (event) => {
    setCertificateAuthorityData(event.target.value);
  };

  const handleClientCertificateData = (event) => {
    setClientCertificateData(event.target.value);
  };

  const handleClientKeyData = (event) => {
    setClientKeyData(event.target.value);
  };

  const handleToken = (event) => {
    setToken(event.target.value);
  };

  const handleKubeconfig = (event) => {
    setKubeconfig(event.target.value);
  };

  const addCluster = () => {
    if (type === 'manual' && name === '') {
      setError('Name is required')
    } else if (type === 'manual' && url === '') {
      setError('URL is required')
    } else if (type === 'manual' && !url.startsWith('https://')) {
      setError('Invalid URL')
    } else if (type === 'manual' && kubeconfig === '') {
      setError('Kubeconfig is required')
    } else {
      if (type === 'manual') {
        context.addCluster({
          id: '',
          name: name,
          url: url,
          certificateAuthorityData: certificateAuthorityData,
          clientCertificateData: clientCertificateData,
          clientKeyData: clientKeyData,
          token: token,
          namespace: 'default',
        });
      } else if (type === 'kubeconfig') {
        const config: IKubeconfig = yaml.safeLoad(kubeconfig);

        for (let ctx of config.contexts) {
          const cluster = getKubeconfigCluster(ctx.context.cluster, config.clusters);
          const user = getKubeconfigUser(ctx.context.user, config.users);

          if (ctx.name !== '' && cluster !== null && user !== null) {
            context.addCluster({
              id: '',
              name: ctx.name,
              url: cluster.server,
              certificateAuthorityData: cluster['certificate-authority-data'],
              clientCertificateData: user['client-certificate-data'] ? user['client-certificate-data'] : '',
              clientKeyData: user['client-key-data'] ? user['client-key-data'] : '',
              token: user.token ? user.token : '',
              namespace: 'default',
            });
          }
        }
      }

      setError('');
      setName('');
      setURL('');
      setCertificateAuthorityData('');
      setClientCertificateData('');
      setClientKeyData('');
      setToken('');
      setShowModal(false);
    }
  };

  return (
    <IonButtons slot="primary">
      <IonModal isOpen={showModal} onDidDismiss={() => setShowModal(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start" onClick={() => setShowModal(false)}>
              <IonIcon slot="icon-only" icon={close} />
            </IonButtons>
            <IonTitle>Add Cluster</IonTitle>
            <IonButtons slot="primary">
              <IonButton onClick={() => addCluster()}>
                Save
              </IonButton>
            </IonButtons>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <div className="segment-wrapper">
            <IonSegment onIonChange={handleType}>
              <IonSegmentButton checked={type === 'kubeconfig'} value="kubeconfig">
                <IonLabel>Kubeconfig</IonLabel>
              </IonSegmentButton>
              <IonSegmentButton checked={type === 'manual'} value="manual">
                <IonLabel>Manual</IonLabel>
              </IonSegmentButton>
            </IonSegment>
          </div>

          {type === 'kubeconfig' ? (
            <IonList lines="full">
              <IonItem>
                <IonLabel position="stacked">Kubeconfig</IonLabel>
                <IonTextarea autoGrow={true} value={kubeconfig} onInput={handleKubeconfig} />
              </IonItem>
            </IonList>
          ) : null}

          {type === 'manual' ? (
            <IonList lines="full">
              <IonItem>
                <IonLabel position="stacked">Name</IonLabel>
                <IonInput type="text" required={true} value={name} onInput={handleName} />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">URL</IonLabel>
                <IonInput type="text" inputmode="url" required={true} value={url} onInput={handleURL} />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Certificate Authority Data</IonLabel>
                <IonTextarea autoGrow={true} value={certificateAuthorityData} onInput={handleCertificateAuthorityData} />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Client Certificate Data</IonLabel>
                <IonTextarea autoGrow={true} value={clientCertificateData} onInput={handleClientCertificateData} />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Client Key Data</IonLabel>
                <IonTextarea autoGrow={true} value={clientKeyData} onInput={handleClientKeyData} />
              </IonItem>
              <IonItem>
                <IonLabel position="stacked">Token</IonLabel>
                <IonTextarea autoGrow={true} value={token} onInput={handleToken} />
              </IonItem>
            </IonList>
          ) : null}

          {error !== '' ? <IonAlert isOpen={error !== ''} onDidDismiss={() => setError('')} header="Could not save" message={error} buttons={['OK']} /> : null}
        </IonContent>
      </IonModal>
      <IonButton onClick={() => setShowModal(true)}>
        <IonIcon slot="icon-only" icon={add} />
      </IonButton>
    </IonButtons>
  );
};

export default AddCluster;
