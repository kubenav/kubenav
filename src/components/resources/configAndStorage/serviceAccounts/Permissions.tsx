import {
  IonCard,
  IonCardContent,
  IonCardHeader,
  IonCardSubtitle,
  IonCardTitle,
  IonCol,
  IonProgressBar,
  IonRouterLink,
  IonRow,
} from '@ionic/react';
import { V1ClusterRole, V1ClusterRoleBindingList, V1Role, V1RoleBindingList, V1Subject } from '@kubernetes/client-node';
import React, { useContext, useEffect } from 'react';

import { IContext } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { resources } from '../../../../utils/resources';
import useAsyncFn from '../../../../utils/useAsyncFn';
import Rules from '../../rbac/misc/Rules';

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

        const clusterRoleBindings: V1ClusterRoleBindingList = await kubernetesRequest(
          'GET',
          resources['rbac'].pages['clusterrolebindings'].listURL(''),
          '',
          context.settings.timeout,
          await context.kubernetesAuthWrapper(''),
        );

        const roleBindings: V1RoleBindingList = await kubernetesRequest(
          'GET',
          resources['rbac'].pages['rolebindings'].listURL(namespace),
          '',
          context.settings.timeout,
          await context.kubernetesAuthWrapper(''),
        );

        if (clusterRoleBindings && clusterRoleBindings.items) {
          for (const item of clusterRoleBindings.items) {
            if (
              item.roleRef.kind.toLowerCase() === 'clusterrole' &&
              item.subjects &&
              subjectsContainServiceAccount(namespace, serviceAccountName, item.subjects)
            ) {
              const clusterRole: V1ClusterRole = await kubernetesRequest(
                'GET',
                resources['rbac'].pages['clusterroles'].detailsURL(namespace, item.roleRef.name),
                '',
                context.settings.timeout,
                await context.kubernetesAuthWrapper(''),
              );

              clusterRoles.push(clusterRole);
            } else if (
              item.roleRef.kind.toLowerCase() === 'role' &&
              item.subjects &&
              subjectsContainServiceAccount(namespace, serviceAccountName, item.subjects)
            ) {
              const role: V1Role = await kubernetesRequest(
                'GET',
                resources['rbac'].pages['roles'].detailsURL(namespace, item.roleRef.name),
                '',
                context.settings.timeout,
                await context.kubernetesAuthWrapper(''),
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
              const clusterRole: V1ClusterRole = await kubernetesRequest(
                'GET',
                resources['rbac'].pages['clusterroles'].detailsURL(namespace, item.roleRef.name),
                '',
                context.settings.timeout,
                await context.kubernetesAuthWrapper(''),
              );

              clusterRoles.push(clusterRole);
            } else if (
              item.roleRef.kind.toLowerCase() === 'role' &&
              item.subjects &&
              subjectsContainServiceAccount(namespace, serviceAccountName, item.subjects)
            ) {
              const role: V1Role = await kubernetesRequest(
                'GET',
                resources['rbac'].pages['roles'].detailsURL(namespace, item.roleRef.name),
                '',
                context.settings.timeout,
                await context.kubernetesAuthWrapper(''),
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

  if (state.value && state.value.clusterRoles.length === 0 && state.value.roles.length === 0) {
    return null;
  } else {
    return (
      <IonRow>
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
                          <IonCardContent>
                            <Rules rules={clusterRole.rules} />
                          </IonCardContent>
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
                                {role.metadata && role.metadata.namespace ? `${role.metadata.namespace}/` : ''}
                                {role.metadata ? role.metadata.name : ''}
                              </IonRouterLink>
                            </IonCardSubtitle>
                          </IonCardHeader>
                          <IonCardContent>
                            <Rules rules={role.rules} />
                          </IonCardContent>
                        </React.Fragment>
                      );
                    })
                  : null}
              </React.Fragment>
            ) : null}
          </IonCard>
        </IonCol>
      </IonRow>
    );
  }
};

export default Permissions;
