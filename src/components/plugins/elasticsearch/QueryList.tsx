import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardTitle,
  IonCol,
  IonItem,
  IonLabel,
  IonList,
  IonRow,
} from '@ionic/react';
import React from 'react';

import { getProperty } from '../../../utils/helpers';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const parseQuery = (item: any, query: string): string => {
  const parts = query.split(' ');

  for (let index = 0; index < parts.length; index++) {
    if (parts[index].length > 2 && parts[index].startsWith('$.')) {
      parts[index] = getProperty(item, parts[index].substring(2));
    }
  }

  return parts.join(' ');
};

interface IQuery {
  title: string;
  query: string;
  from: string;
  to: string;
  selectedFields: string;
}

interface IQueryListProps {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: any;
}

const QueryList: React.FunctionComponent<IQueryListProps> = ({ item }: IQueryListProps) => {
  const queries: IQuery[] = [];
  let error = '';

  try {
    if (
      item &&
      item.metadata &&
      item.metadata.annotations &&
      item.metadata.annotations['kubenav.io/elasticsearch-queries']
    ) {
      const parsedQueries: IQuery[] = JSON.parse(item.metadata.annotations['kubenav.io/elasticsearch-queries']);

      for (const query of parsedQueries) {
        if (query.title && query.query) {
          const q = parseQuery(item, query.query);

          queries.push({
            title: query.title,
            query: q,
            from: query.from ? query.from : 'now-15m',
            to: query.to ? query.to : 'now',
            selectedFields: query.selectedFields ? query.selectedFields : '',
          });
        }
      }
    }
  } catch (err) {
    error = err.message;
  }

  if (queries.length > 0 || error) {
    return (
      <IonRow>
        <IonCol sizeXs="12" sizeSm="12" sizeMd="12" sizeLg="12" sizeXl="12">
          <IonCard>
            <IonCardHeader>
              <IonCardTitle>Elasticsearch Queries</IonCardTitle>
            </IonCardHeader>
            <IonCardContent>
              {error ? (
                `Could not load queries: ${error}`
              ) : (
                <IonList>
                  {queries.map((query: IQuery, index) => {
                    return (
                      <IonItem
                        key={index}
                        routerLink={`/plugins/elasticsearch?query=${query.query}&from=${query.from}&to=${query.to}&selectedFields=${query.selectedFields}`}
                        routerDirection="forward"
                      >
                        <IonLabel class="ion-text-wrap">
                          <h2>{query.title}</h2>
                          <p>
                            <b>Query:</b> {query.query} <b>From:</b> {query.from} <b>To:</b> {query.to}
                            {query.selectedFields ? (
                              <span>
                                {' '}
                                <b>Fields:</b> {query.selectedFields}
                              </span>
                            ) : null}
                          </p>
                        </IonLabel>
                      </IonItem>
                    );
                  })}
                </IonList>
              )}
            </IonCardContent>
          </IonCard>
        </IonCol>
      </IonRow>
    );
  } else {
    return null;
  }
};

export default QueryList;
