import {
  IonButton,
  IonButtons,
  IonCard,
  IonCardContent,
  IonCol,
  IonContent,
  IonGrid,
  IonHeader,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonListHeader,
  IonMenuButton,
  IonPage,
  IonProgressBar,
  IonRow,
  IonSegment,
  IonSegmentButton,
  IonTitle,
  IonToolbar,
  isPlatform,
} from '@ionic/react';
import { V1PodList } from '@kubernetes/client-node';
import React, { memo, useContext, useState } from 'react';
import { RouteComponentProps } from 'react-router';

import { IContext } from '../../../declarations';
import { kubernetesRequest, pluginRequest } from '../../../utils/api';
import { IS_INCLUSTER } from '../../../utils/constants';
import { AppContext } from '../../../utils/context';
import useWindowWidth from '../../../utils/useWindowWidth';
import Document from './Document';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const getFieldsRecursively = (prefix: string, document: any): string[] => {
  const fields: string[] = [];
  for (const field in document) {
    if (typeof document[field] === 'object') {
      fields.push(...getFieldsRecursively(prefix ? `${prefix}.${field}` : field, document[field]));
    } else {
      fields.push(prefix ? `${prefix}.${field}` : field);
    }
  }

  return fields;
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const getFields = (documents: any[]): string[] => {
  const fields: string[] = [];
  for (const document of documents) {
    fields.push(...getFieldsRecursively('', document['_source']));
  }

  const uniqueFields: string[] = [];
  for (const field of fields) {
    if (uniqueFields.indexOf(field) === -1) {
      uniqueFields.push(field);
    }
  }

  return uniqueFields;
};

type IQueryPageProps = RouteComponentProps;

const QueryPage: React.FunctionComponent<IQueryPageProps> = ({ location }: IQueryPageProps) => {
  const context = useContext<IContext>(AppContext);
  const width = useWindowWidth();

  const url = new URLSearchParams(location.search);

  const [activeSegment, setActiveSegment] = useState<string>('query');
  const [query, setQuery] = useState<string>(url.get('query') ? (url.get('query') as string) : '');
  const [from, setFrom] = useState<string>(url.get('from') ? (url.get('from') as string) : 'now-15m');
  const [to, setTo] = useState<string>(url.get('to') ? (url.get('to') as string) : 'now');
  const [size, setSize] = useState<string>(url.get('size') ? (url.get('size') as string) : '100');
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [documents, setDocuments] = useState<any>(undefined);
  const [fields, setFields] = useState<string[]>([]);
  const [selectedFields, setSelectedFields] = useState<string[]>(
    url.get('selectedFields') ? (url.get('selectedFields') as string).split(',') : [],
  );
  const [error, setError] = useState<string>('');
  const [isFetching, setIsFetching] = useState<boolean>(false);

  const handleQuery = (event) => {
    setQuery(event.target.value);
  };

  const handleFrom = (event) => {
    setFrom(event.target.value);
  };

  const handleTo = (event) => {
    setTo(event.target.value);
  };

  const handleSize = (event) => {
    setSize(event.target.value);
  };

  const addField = (field: string) => {
    setSelectedFields((fields) => [...fields, field]);
  };

  const removeField = (field: string) => {
    setSelectedFields(selectedFields.filter((item) => item !== field));
  };

  const runQuery = async () => {
    try {
      setError('');
      setIsFetching(true);
      let portforwardingPath = '';

      if (!IS_INCLUSTER) {
        const podList: V1PodList = await kubernetesRequest(
          'GET',
          `/api/v1/namespaces/${context.settings.elasticsearchNamespace}/pods?labelSelector=${context.settings.elasticsearchSelector}`,
          '',
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );

        if (podList.items.length > 0 && podList.items[0].metadata) {
          portforwardingPath = `/api/v1/namespaces/${podList.items[0].metadata.namespace}/pods/${podList.items[0].metadata.name}/portforward`;
        } else {
          throw new Error(
            `Could not find Pod in Namespace "${context.settings.elasticsearchNamespace}" with selector "${context.settings.elasticsearchSelector}".`,
          );
        }
      }

      const docs = await pluginRequest(
        'elasticsearch',
        context.settings.elasticsearchPort,
        context.settings.elasticsearchAddress,
        {
          query: {
            sort: [{ '@timestamp': { order: 'desc' } }],
            query: {
              bool: {
                must: [
                  {
                    range: {
                      '@timestamp': {
                        gte: from,
                        lte: to,
                      },
                    },
                  },
                  {
                    // eslint-disable-next-line @typescript-eslint/naming-convention
                    query_string: {
                      query: query,
                    },
                  },
                ],
              },
            },
          },
          size: '100',
          username: context.settings.elasticsearchUsername,
          password: context.settings.elasticsearchPassword,
        },
        portforwardingPath,
        context.settings,
        await context.kubernetesAuthWrapper(''),
      );

      setFields(getFields(docs.slice(docs.lenght > 10 ? 10 : docs.lenght)));

      setIsFetching(false);
      setDocuments(docs);
    } catch (err) {
      setIsFetching(false);
      setDocuments(undefined);
      setError(err.message);
    }
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>
          <IonTitle>Elasticsearch</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent>
        {isFetching ? <IonProgressBar slot="fixed" type="indeterminate" color="primary" /> : null}

        <IonGrid>
          <IonRow>
            <IonCol>
              <IonCard>
                <IonCardContent>
                  <IonSegment
                    scrollable={true}
                    value={activeSegment}
                    onIonChange={(e) => setActiveSegment(e.detail.value as string)}
                  >
                    <IonSegmentButton value="query">
                      <IonLabel>Query</IonLabel>
                    </IonSegmentButton>
                    <IonSegmentButton value="options">
                      <IonLabel>Options</IonLabel>
                    </IonSegmentButton>
                  </IonSegment>

                  {activeSegment === 'query' ? (
                    <IonGrid>
                      <IonRow>
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="10" sizeXl="10">
                          <IonItem>
                            <IonInput
                              type="text"
                              required={true}
                              placeholder="Query"
                              value={query}
                              onInput={handleQuery}
                            />
                          </IonItem>
                        </IonCol>
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="2" sizeXl="2">
                          <IonButton expand="block" onClick={() => runQuery()}>
                            Search
                          </IonButton>
                        </IonCol>
                      </IonRow>
                    </IonGrid>
                  ) : null}

                  {activeSegment === 'options' ? (
                    <IonGrid>
                      <IonRow>
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
                          <IonItem>
                            <IonLabel position="stacked">From</IonLabel>
                            <IonInput
                              type="text"
                              required={true}
                              placeholder="From"
                              value={from}
                              onInput={handleFrom}
                            />
                          </IonItem>
                        </IonCol>
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
                          <IonItem>
                            <IonLabel position="stacked">To</IonLabel>
                            <IonInput type="text" required={true} placeholder="To" value={to} onInput={handleTo} />
                          </IonItem>
                        </IonCol>
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="4" sizeXl="4">
                          <IonItem>
                            <IonLabel position="stacked">Size</IonLabel>
                            <IonInput
                              type="text"
                              required={true}
                              placeholder="Size"
                              value={size}
                              onInput={handleSize}
                            />
                          </IonItem>
                        </IonCol>
                      </IonRow>
                      <IonRow>
                        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
                          <IonList>
                            <IonListHeader mode="md">
                              <IonLabel>Selected Fields</IonLabel>
                            </IonListHeader>
                            {selectedFields.map((field, index) => (
                              <IonItem key={index} button={true} onClick={() => removeField(field)}>
                                {field}
                              </IonItem>
                            ))}
                            <IonListHeader mode="md">
                              <IonLabel>Fields</IonLabel>
                            </IonListHeader>
                            {fields.map((field, index) => (
                              <IonItem key={index} button={true} onClick={() => addField(field)}>
                                {field}
                              </IonItem>
                            ))}
                          </IonList>
                        </IonCol>
                      </IonRow>
                    </IonGrid>
                  ) : null}
                </IonCardContent>
              </IonCard>
            </IonCol>
          </IonRow>

          {error || documents ? (
            <IonRow>
              <IonCol>
                <IonCard>
                  <IonCardContent>
                    {error ? (
                      error
                    ) : (
                      <React.Fragment>
                        {isPlatform('hybrid') || isPlatform('mobile') || width < 992 ? (
                          <IonList>
                            {documents.map((document, index) => (
                              <Document key={index} layout="item" document={document} fields={selectedFields} />
                            ))}
                          </IonList>
                        ) : (
                          <div className="table-multi-line">
                            <table>
                              <thead>
                                <tr>
                                  <th>@timestamp</th>
                                  {selectedFields.length === 0 ? (
                                    <th>message</th>
                                  ) : (
                                    selectedFields.map((field) => <th key={field}>{field}</th>)
                                  )}
                                </tr>
                              </thead>
                              <tbody>
                                {documents.map((document, index) => (
                                  <Document key={index} layout="table" document={document} fields={selectedFields} />
                                ))}
                              </tbody>
                            </table>
                          </div>
                        )}
                      </React.Fragment>
                    )}
                  </IonCardContent>
                </IonCard>
              </IonCol>
            </IonRow>
          ) : null}
        </IonGrid>
      </IonContent>
    </IonPage>
  );
};

export default memo(QueryPage, (): boolean => {
  return true;
});
