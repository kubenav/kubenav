import {
  IonButton,
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonSelect,
  IonSelectOption,
} from '@ionic/react';
import React, { useState } from 'react';

import { IAWSTokens } from '../../../../declarations';
import { readAWSTokens, saveAWSTokens } from '../../../../utils/storage';

const AWS: React.FunctionComponent = () => {
  const [accessKeyID, setAccessKeyID] = useState<string>('');
  const [region, setRegion] = useState<string>('');
  const [secretKey, setSecretKey] = useState<string>('');

  const handleAccessKeyID = (event) => {
    setAccessKeyID(event.target.value);
  };

  const handleSecretKey = (event) => {
    setSecretKey(event.target.value);
  };

  const onChange = (event) => {
    setRegion(event.target.value);
  };

  const importClusters = () => {
    let tokens: IAWSTokens = readAWSTokens();

    tokens[region] = {
      accessKeyID: accessKeyID,
      secretKey: secretKey,
    };

    saveAWSTokens(tokens);

    window.location.replace(`/settings/clusters/aws/${region}`);
  };

  return (
    <IonCard>
      <img alt="GCP" src="/assets/card-header-aws.png" />
      <IonCardHeader>
        <IonCardTitle>Import from Amazon Web Services</IonCardTitle>
      </IonCardHeader>

      <IonCardContent>
        <p className="paragraph-margin-bottom">
          Choose this option to import your EKS clusters from the Amazon Web Services. You have to provide an access key
          id, a secret key and a region. The credentials are used to retrieve your EKS clusters from AWS and to generate
          a token for the Kubernetes API requests.
        </p>

        <IonList className="paragraph-margin-bottom" lines="full">
          <IonItem>
            <IonLabel position="stacked">Access Key ID</IonLabel>
            <IonInput type="text" required={true} value={accessKeyID} onInput={handleAccessKeyID} />
          </IonItem>
          <IonItem>
            <IonLabel position="stacked">Secret Key</IonLabel>
            <IonInput type="text" required={true} value={secretKey} onInput={handleSecretKey} />
          </IonItem>
          <IonItem>
            <IonLabel>Region</IonLabel>
            <IonSelect value={region} onIonChange={onChange}>
              <IonSelectOption value="us-east-2">USA Ost (Ohio)</IonSelectOption>
              <IonSelectOption value="us-east-1">USA Ost (Nord-Virginia)</IonSelectOption>
              <IonSelectOption value="us-west-1">USA West (Nordkalifornien)</IonSelectOption>
              <IonSelectOption value="us-west-2">USA West (Oregon)</IonSelectOption>
              <IonSelectOption value="ap-east-1">Asien-Pazifik (Hongkong)</IonSelectOption>
              <IonSelectOption value="ap-south-1">Asien-Pazifik (Mumbai)</IonSelectOption>
              <IonSelectOption value="ap-northeast-3">Asien-Pazifik (Osaka-Lokal)</IonSelectOption>
              <IonSelectOption value="ap-northeast-2">Asien-Pazifik (Seoul)</IonSelectOption>
              <IonSelectOption value="ap-southeast-1">Asien-Pazifik (Singapur)</IonSelectOption>
              <IonSelectOption value="ap-southeast-2">Asien-Pazifik (Sydney)</IonSelectOption>
              <IonSelectOption value="ap-northeast-1">Asien-Pazifik (Tokio)</IonSelectOption>
              <IonSelectOption value="ca-central-1">Kanada (Zentral)</IonSelectOption>
              <IonSelectOption value="cn-north-1">China (Peking)</IonSelectOption>
              <IonSelectOption value="cn-northwest-1">China (Ningxia)</IonSelectOption>
              <IonSelectOption value="eu-central-1">EU (Frankfurt)</IonSelectOption>
              <IonSelectOption value="eu-west-1">EU (Irland)</IonSelectOption>
              <IonSelectOption value="eu-west-2">EU (London)</IonSelectOption>
              <IonSelectOption value="eu-west-3">EU (Paris)</IonSelectOption>
              <IonSelectOption value="eu-north-1">EU (Stockholm)</IonSelectOption>
              <IonSelectOption value="me-south-1">Naher Osten (Bahrain)</IonSelectOption>
              <IonSelectOption value="sa-east-1">Südamerika (São Paulo)</IonSelectOption>
              <IonSelectOption value="us-gov-east-1">AWS GovCloud (USA Ost)</IonSelectOption>
              <IonSelectOption value="us-gov-west-1">AWS GovCloud (USA)</IonSelectOption>
            </IonSelect>
          </IonItem>
        </IonList>

        <IonButton expand="block" onClick={() => importClusters()}>Import from AWS</IonButton>
      </IonCardContent>
    </IonCard>
  );
};

export default AWS;
