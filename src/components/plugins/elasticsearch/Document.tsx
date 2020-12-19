import {
  IonButton,
  IonButtons,
  IonContent,
  IonHeader,
  IonIcon,
  IonItem,
  IonLabel,
  IonModal,
  IonTitle,
  IonToolbar,
} from '@ionic/react';
import { close } from 'ionicons/icons';
import React, { useState } from 'react';

import { getProperty } from '../../../utils/helpers';
import Editor from '../../misc/Editor';

export interface IElasticsearchDocumentSource {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [key: string]: any;
}

export interface IElasticsearchDocument {
  // eslint-disable-next-line @typescript-eslint/naming-convention
  _source: IElasticsearchDocumentSource;
}

interface IResultProps {
  layout: string;
  document: IElasticsearchDocument;
  fields: string[];
}

const Document: React.FunctionComponent<IResultProps> = ({ layout, document, fields }: IResultProps) => {
  const [show, setShow] = useState<boolean>(false);

  return (
    <React.Fragment>
      {layout === 'item' ? (
        <IonItem button={true} detail={false} onClick={() => setShow(true)}>
          <IonLabel class="ion-text-wrap">
            <h2>{document['_source'] && document['_source']['@timestamp'] ? document['_source']['@timestamp'] : ''}</h2>
            {fields.length === 0 ? (
              <p>
                {JSON.stringify(document['_source']).substring(
                  0,
                  JSON.stringify(document['_source']).length < 1000 ? JSON.stringify(document['_source']).length : 1000,
                )}
              </p>
            ) : (
              <p>
                {fields.map((field) => (
                  <span key={field}>
                    <b>{field}:</b> {getProperty(document['_source'], field)}
                    <br />
                  </span>
                ))}
              </p>
            )}
          </IonLabel>
        </IonItem>
      ) : null}

      {layout === 'table' ? (
        <tr>
          <td className="nowrap link" onClick={() => setShow(true)}>
            <b>{document['_source'] && document['_source']['@timestamp'] ? document['_source']['@timestamp'] : ''}</b>
          </td>
          {fields.length === 0 ? (
            <td>
              {JSON.stringify(document['_source']).substring(
                0,
                JSON.stringify(document['_source']).length < 1000 ? JSON.stringify(document['_source']).length : 1000,
              )}
            </td>
          ) : (
            fields.map((field) => <td key={field}>{getProperty(document['_source'], field)}</td>)
          )}
        </tr>
      ) : null}

      <IonModal isOpen={show} onDidDismiss={() => setShow(false)}>
        <IonHeader>
          <IonToolbar>
            <IonButtons slot="start">
              <IonButton onClick={() => setShow(false)}>
                <IonIcon slot="icon-only" icon={close} />
              </IonButton>
            </IonButtons>
            <IonTitle>
              {document['_source'] && document['_source']['@timestamp'] ? document['_source']['@timestamp'] : ''}
            </IonTitle>
          </IonToolbar>
        </IonHeader>
        <IonContent>
          <Editor readOnly={true} mode="json" value={JSON.stringify(document['_source'], null, 2)} fullHeight={true} />
        </IonContent>
      </IonModal>
    </React.Fragment>
  );
};

export default Document;
