import { IonIcon } from '@ionic/react';
import { checkmark, close } from 'ionicons/icons';
import { V1PolicyRule } from '@kubernetes/client-node';
import React from 'react';

interface IRulesProps {
  rules: V1PolicyRule[] | undefined;
}

const Rules: React.FunctionComponent<IRulesProps> = ({ rules }: IRulesProps) => {
  return (
    <div className="table">
      <table>
        <thead>
          <tr>
            <th>Resource</th>
            <th>Get</th>
            <th>List</th>
            <th>Create</th>
            <th>Update</th>
            <th>Patch</th>
            <th>Delete</th>
            <th>Watch</th>
          </tr>
        </thead>
        <tbody>
          {rules
            ? rules.map((rule, indexRule) => {
                return rule.resources
                  ? rule.resources.map((resource, indexResource) => {
                      return (
                        <tr key={`rule-${indexRule}-resource-${indexResource}`}>
                          <td>
                            Resource: {resource}
                            {rule.apiGroups ? ` | API Groups: ${rule.apiGroups.join(',')}` : ''}
                            {rule.resourceNames ? ` | Resource Name: ${rule.resourceNames.join(',')}` : ''}
                          </td>
                          <td>
                            {rule.verbs.includes('get') ? (
                              <IonIcon icon={checkmark} color="success" />
                            ) : (
                              <IonIcon icon={close} color="danger" />
                            )}
                          </td>
                          <td>
                            {rule.verbs.includes('list') ? (
                              <IonIcon icon={checkmark} color="success" />
                            ) : (
                              <IonIcon icon={close} color="danger" />
                            )}
                          </td>
                          <td>
                            {rule.verbs.includes('create') ? (
                              <IonIcon icon={checkmark} color="success" />
                            ) : (
                              <IonIcon icon={close} color="danger" />
                            )}
                          </td>
                          <td>
                            {rule.verbs.includes('update') ? (
                              <IonIcon icon={checkmark} color="success" />
                            ) : (
                              <IonIcon icon={close} color="danger" />
                            )}
                          </td>
                          <td>
                            {rule.verbs.includes('patch') ? (
                              <IonIcon icon={checkmark} color="success" />
                            ) : (
                              <IonIcon icon={close} color="danger" />
                            )}
                          </td>
                          <td>
                            {rule.verbs.includes('delete') ? (
                              <IonIcon icon={checkmark} color="success" />
                            ) : (
                              <IonIcon icon={close} color="danger" />
                            )}
                          </td>
                          <td>
                            {rule.verbs.includes('watch') ? (
                              <IonIcon icon={checkmark} color="success" />
                            ) : (
                              <IonIcon icon={close} color="danger" />
                            )}
                          </td>
                        </tr>
                      );
                    })
                  : null;
              })
            : null}
        </tbody>
      </table>
    </div>
  );
};

export default Rules;
