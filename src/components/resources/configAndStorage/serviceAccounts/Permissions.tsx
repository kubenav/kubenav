import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardSubtitle,
  IonCardTitle,
  IonCol,
  IonIcon,
  IonProgressBar,
  IonRouterLink,
} from '@ionic/react';
import { checkmark, close } from 'ionicons/icons';
import {
  V1ClusterRole,
  V1ClusterRoleBindingList,
  V1PolicyRule,
  V1Role,
  V1RoleBindingList,
  V1Subject,
} from '@kubernetes/client-node';
import React, { useContext, useEffect } from 'react';

import { IContext } from '../../../../declarations';
import { AppContext } from '../../../../utils/context';
import { resources } from '../../../../utils/resources';
import useAsyncFn from '../../../../utils/useAsyncFn';

interface IPermissionsProps {
  namespace: string;
  serviceAccountName: string;
}

const subjectsContainServiceAccount = (saNamespace: string, saName: string, subjects: V1Subject[]): boolean => {
  for (const subject of subjects) {
    if (subject.namespace && subject.namespace === saNamespace && subject.name === saName) {
      return true;
    }
  }

  return false;
};

const renderRules = (rules: V1PolicyRule[] | undefined) => {
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

const Permissions: React.FunctionComponent<IPermissionsProps> = ({
  namespace,
  serviceAccountName,
}: IPermissionsProps) => {
  const context = useContext<IContext>(AppContext);

  const [state, , fetchInit] = useAsyncFn(
    async () => {
      try {
        const roles: V1ClusterRole[] = [];
        const clusterRoles: V1Role[] = [];

        const clusterRoleBindings: V1ClusterRoleBindingList = await context.request(
          'GET',
          resources['rbac'].pages['clusterrolebindings'].listURL(''),
          '',
        );

        const roleBindings: V1RoleBindingList = await context.request(
          'GET',
          resources['rbac'].pages['rolebindings'].listURL(namespace),
          '',
        );

        if (clusterRoleBindings && clusterRoleBindings.items) {
          for (const item of clusterRoleBindings.items) {
            if (
              item.roleRef.kind.toLowerCase() === 'clusterrole' &&
              item.subjects &&
              subjectsContainServiceAccount(namespace, serviceAccountName, item.subjects)
            ) {
              const clusterRole: V1ClusterRole = await context.request(
                'GET',
                resources['rbac'].pages['clusterroles'].detailsURL(namespace, item.roleRef.name),
                '',
              );

              clusterRoles.push(clusterRole);
            } else if (
              item.roleRef.kind.toLowerCase() === 'role' &&
              item.subjects &&
              subjectsContainServiceAccount(namespace, serviceAccountName, item.subjects)
            ) {
              const role: V1Role = await context.request(
                'GET',
                resources['rbac'].pages['roles'].detailsURL(namespace, item.roleRef.name),
                '',
              );

              roles.push(role);
            }
          }
        }

        if (roleBindings && roleBindings.items) {
          for (const item of roleBindings.items) {
            if (
              item.roleRef.kind.toLowerCase() === 'clusterrole' &&
              item.subjects &&
              subjectsContainServiceAccount(namespace, serviceAccountName, item.subjects)
            ) {
              const clusterRole: V1ClusterRole = await context.request(
                'GET',
                resources['rbac'].pages['clusterroles'].detailsURL(namespace, item.roleRef.name),
                '',
              );

              clusterRoles.push(clusterRole);
            } else if (
              item.roleRef.kind.toLowerCase() === 'role' &&
              item.subjects &&
              subjectsContainServiceAccount(namespace, serviceAccountName, item.subjects)
            ) {
              const role: V1Role = await context.request(
                'GET',
                resources['rbac'].pages['roles'].detailsURL(namespace, item.roleRef.name),
                '',
              );

              roles.push(role);
            }
          }
        }

        return {
          clusterRoles: clusterRoles,
          roles: roles,
        };
      } catch (err) {
        throw err;
      }
    },
    [namespace, serviceAccountName],
    { loading: true, error: undefined, value: undefined },
  );

  useEffect(() => {
    fetchInit();
  }, [fetchInit]);

  return (
    <IonCol>
      <IonCard>
        <IonCardHeader>
          <IonCardTitle>Permissions</IonCardTitle>
        </IonCardHeader>
        {state.loading ? (
          <IonCardContent>
            <IonProgressBar slot="fixed" type="indeterminate" color="primary" />
          </IonCardContent>
        ) : null}
        {!state.error && state.value ? (
          <React.Fragment>
            {state.value && state.value.clusterRoles
              ? state.value.clusterRoles.map((clusterRole, index) => {
                  return (
                    <React.Fragment key={index}>
                      <IonCardHeader>
                        <IonCardSubtitle>
                          ClusterRole:{' '}
                          <IonRouterLink
                            routerLink={`/resources/rbac/clusterroles/undefined/${
                              clusterRole.metadata ? clusterRole.metadata.name : ''
                            }`}
                            routerDirection="forward"
                          >
                            {clusterRole.metadata ? clusterRole.metadata.name : ''}
                          </IonRouterLink>
                        </IonCardSubtitle>
                      </IonCardHeader>
                      <IonCardContent>{renderRules(clusterRole.rules)}</IonCardContent>
                    </React.Fragment>
                  );
                })
              : null}
            {state.value && state.value.roles
              ? state.value.roles.map((role, index) => {
                  return (
                    <React.Fragment key={index}>
                      <IonCardHeader>
                        <IonCardSubtitle>
                          Role:{' '}
                          <IonRouterLink
                            routerLink={`/resources/rbac/roles/${role.metadata ? role.metadata.namespace : ''}/${
                              role.metadata ? role.metadata.name : ''
                            }`}
                            routerDirection="forward"
                          >
                            {role.metadata ? role.metadata.name : ''}
                          </IonRouterLink>
                        </IonCardSubtitle>
                      </IonCardHeader>
                      <IonCardContent>{renderRules(role.rules)}</IonCardContent>
                    </React.Fragment>
                  );
                })
              : null}
          </React.Fragment>
        ) : null}
      </IonCard>
    </IonCol>
  );
};

export default Permissions;
