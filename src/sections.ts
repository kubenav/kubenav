import CronJob from './components/kubernetes/details/CronJob';
import DaemonSet from './components/kubernetes/details/DaemonSet';
import Deployment from './components/kubernetes/details/Deployment';
import Job from './components/kubernetes/details/Job';
import Pod from './components/kubernetes/details/Pod';
import ReplicaSet from './components/kubernetes/details/ReplicaSet';
import ReplicationController from './components/kubernetes/details/ReplicationController';
import StatefulSet from './components/kubernetes/details/StatefulSet';

import Ingress from './components/kubernetes/details/Ingress';
import Service from './components/kubernetes/details/Service';

import ConfigMap from './components/kubernetes/details/ConfigMap';
import PersistentVolume from './components/kubernetes/details/PersistentVolume';
import PersistentVolumeClaim from './components/kubernetes/details/PersistentVolumeClaim';
import Secret from './components/kubernetes/details/Secret';
import ServiceAccount from './components/kubernetes/details/ServiceAccount';

import ClusterRole from './components/kubernetes/details/ClusterRole';
import ClusterRoleBinding from './components/kubernetes/details/ClusterRoleBinding';
import Role from './components/kubernetes/details/Role';
import RoleBinding from './components/kubernetes/details/RoleBinding';

import Event from './components/kubernetes/details/Event';
import Namespace from './components/kubernetes/details/Namespace';
import Node from './components/kubernetes/details/Node';

import CronJobItem from './components/kubernetes/items/CronJobItem';
import DaemonSetItem from './components/kubernetes/items/DaemonSetItem';
import DeploymentItem from './components/kubernetes/items/DeploymentItem';
import JobItem from './components/kubernetes/items/JobItem';
import PodItem from './components/kubernetes/items/PodItem';
import ReplicaSetItem from './components/kubernetes/items/ReplicaSetItem';
import ReplicationControllerItem from './components/kubernetes/items/ReplicationControllerItem';
import StatefulSetItem from './components/kubernetes/items/StatefulSetItem';

import IngressItem from './components/kubernetes/items/IngressItem';
import ServiceItem from './components/kubernetes/items/ServiceItem';

import ConfigMapItem from './components/kubernetes/items/ConfigMapItem';
import PersistentVolumeItem from './components/kubernetes/items/PersistentVolumeItem';
import PersistentVolumeClaimItem from './components/kubernetes/items/PersistentVolumeClaimItem';
import SecretItem from './components/kubernetes/items/SecretItem';
import ServiceAccountItem from './components/kubernetes/items/ServiceAccountItem';

import ClusterRoleItem from './components/kubernetes/items/ClusterRoleItem';
import ClusterRoleBindingItem from './components/kubernetes/items/ClusterRoleBindingItem';
import RoleItem from './components/kubernetes/items/RoleItem';
import RoleBindingItem from './components/kubernetes/items/RoleBindingItem';

import CustomResourceDefinitionItem from './components/kubernetes/items/CustomResourceDefinitionItem';
import EventItem from './components/kubernetes/items/EventItem';
import NamespaceItem from './components/kubernetes/items/NamespaceItem';
import NodeItem from './components/kubernetes/items/NodeItem';

import { AppSections } from './declarations';

export const sections: AppSections = {
  'workloads': {
    title: 'Workloads',
    pages: {
      'cronjobs': {
        singleText: 'Cron Job',
        pluralText: 'Cron Jobs',
        icon: '/assets/icons/kubernetes/cronjob.png',
        listURL: (namespace: string) => { return namespace ? `/apis/batch/v1beta1/namespaces/${namespace}/cronjobs` : `/apis/batch/v1beta1/cronjobs`; },
        listItemComponent: CronJobItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/batch/v1beta1/namespaces/${namespace}/cronjobs/${name}`; },
        detailsComponent: CronJob,
      },
      'daemonsets': {
        singleText: 'Daemon Set',
        pluralText: 'Daemon Sets',
        icon: '/assets/icons/kubernetes/ds.png',
        listURL: (namespace: string) => { return namespace ? `/apis/apps/v1/namespaces/${namespace}/daemonsets` : `/apis/apps/v1/daemonsets`; },
        listItemComponent: DaemonSetItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/apps/v1/namespaces/${namespace}/daemonsets/${name}`; },
        detailsComponent: DaemonSet,
      },
      'deployments': {
        singleText: 'Deployment',
        pluralText: 'Deployments',
        icon: '/assets/icons/kubernetes/deploy.png',
        listURL: (namespace: string) => { return namespace ? `/apis/apps/v1/namespaces/${namespace}/deployments` : `/apis/apps/v1/deployments`; },
        listItemComponent: DeploymentItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/apps/v1/namespaces/${namespace}/deployments/${name}`; },
        detailsComponent: Deployment,
      },
      'jobs': {
        singleText: 'Job',
        pluralText: 'Jobs',
        icon: '/assets/icons/kubernetes/job.png',
        listURL: (namespace: string) => { return namespace ? `/apis/batch/v1/namespaces/${namespace}/jobs` : `/apis/batch/v1/jobs`; },
        listItemComponent: JobItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/batch/v1/namespaces/${namespace}/jobs/${name}`; },
        detailsComponent: Job,
      },
      'pods': {
        singleText: 'Pod',
        pluralText: 'Pods',
        icon: '/assets/icons/kubernetes/pod.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/pods` : `/api/v1/pods`; },
        listItemComponent: PodItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/pods/${name}`; },
        detailsComponent: Pod,
      },
      'replicasets': {
        singleText: 'Replica Set',
        pluralText: 'Replica Sets',
        icon: '/assets/icons/kubernetes/rs.png',
        listURL: (namespace: string) => { return namespace ? `/apis/apps/v1/namespaces/${namespace}/replicasets` : `/apis/apps/v1/replicasets`; },
        listItemComponent: ReplicaSetItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/apps/v1/namespaces/${namespace}/replicasets/${name}`; },
        detailsComponent: ReplicaSet,
      },
      'replicationcontrollers': {
        singleText: 'Replication Controller',
        pluralText: 'Replication Controllers',
        icon: '/assets/icons/kubernetes/deploy.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/replicationcontrollers` : `/api/v1/replicationcontrollers`; },
        listItemComponent: ReplicationControllerItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/replicationcontrollers/${name}`; },
        detailsComponent: ReplicationController,
      },
      'statefulsets': {
        singleText: 'Stateful Set',
        pluralText: 'Stateful Sets',
        icon: '/assets/icons/kubernetes/sts.png',
        listURL: (namespace: string) => { return namespace ? `/apis/apps/v1/namespaces/${namespace}/statefulsets` : `/apis/apps/v1/statefulsets`; },
        listItemComponent: StatefulSetItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/apps/v1/namespaces/${namespace}/statefulsets/${name}`; },
        detailsComponent: StatefulSet,
      },
    },
  },
  'discovery-and-loadbalancing': {
    title: 'Discovery and Load Balancing',
    pages: {
      'ingresses': {
        singleText: 'Ingresse',
        pluralText: 'Ingresses',
        icon: '/assets/icons/kubernetes/ing.png',
        listURL: (namespace: string) => { return namespace ? `/apis/networking.k8s.io/v1beta1/namespaces/${namespace}/ingresses` : `/apis/networking.k8s.io/v1beta1/ingresses`; },
        listItemComponent: IngressItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/networking.k8s.io/v1beta1/namespaces/${namespace}/ingresses/${name}`; },
        detailsComponent: Ingress,
      },
      'services': {
        singleText: 'Service',
        pluralText: 'Services',
        icon: '/assets/icons/kubernetes/svc.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/services` : `/api/v1/services`; },
        listItemComponent: ServiceItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/services/${name}`; },
        detailsComponent: Service,
      },
    }
  },
  'config-and-storage': {
    title: 'Config and Storage',
    pages: {
      'configmaps': {
        singleText: 'Config Map',
        pluralText: 'Config Maps',
        icon: '/assets/icons/kubernetes/cm.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/configmaps` : `/api/v1/configmaps`; },
        listItemComponent: ConfigMapItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/configmaps/${name}`; },
        detailsComponent: ConfigMap,
      },
      'persistentvolumes': {
        singleText: 'Persistent Volume',
        pluralText: 'Persistent Volumes',
        icon: '/assets/icons/kubernetes/pv.png',
        listURL: (namespace: string) => { return `/api/v1/persistentvolumes`; },
        listItemComponent: PersistentVolumeItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/persistentvolumes/${name}`; },
        detailsComponent: PersistentVolume,
      },
      'persistentvolumeclaims': {
        singleText: 'Persistent Volume Claim',
        pluralText: 'Persistent Volume Claims',
        icon: '/assets/icons/kubernetes/pvc.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/persistentvolumeclaims` : `/api/v1/persistentvolumeclaims`; },
        listItemComponent: PersistentVolumeClaimItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/persistentvolumeclaims/${name}`; },
        detailsComponent: PersistentVolumeClaim,
      },
      'secrets': {
        singleText: 'Secret',
        pluralText: 'Secrets',
        icon: '/assets/icons/kubernetes/secret.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/secrets` : `/api/v1/secrets`; },
        listItemComponent: SecretItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/secrets/${name}`; },
        detailsComponent: Secret,
      },
      'serviceaccounts': {
        singleText: 'Service Account',
        pluralText: 'Service Accounts',
        icon: '/assets/icons/kubernetes/sa.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/serviceaccounts` : `/api/v1/serviceaccounts`; },
        listItemComponent: ServiceAccountItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/serviceaccounts/${name}`; },
        detailsComponent: ServiceAccount,
      },
    }
  },
  'rbac': {
    title: 'RBAC',
    pages: {
      'clusterroles': {
        singleText: 'Cluster Role',
        pluralText: 'Cluster Roles',
        icon: '/assets/icons/kubernetes/c-role.png',
        listURL: (namespace: string) => { return `/apis/rbac.authorization.k8s.io/v1/clusterroles`; },
        listItemComponent: ClusterRoleItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/rbac.authorization.k8s.io/v1/clusterroles/${name}`; },
        detailsComponent: ClusterRole,
      },
      'clusterrolebindings': {
        singleText: 'Cluster Role Binding',
        pluralText: 'Cluster Role Bindings',
        icon: '/assets/icons/kubernetes/c-rb.png',
        listURL: (namespace: string) => { return `/apis/rbac.authorization.k8s.io/v1/clusterrolebindings`; },
        listItemComponent: ClusterRoleBindingItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/${name}`; },
        detailsComponent: ClusterRoleBinding,
      },
      'roles': {
        singleText: 'Role',
        pluralText: 'Roles',
        icon: '/assets/icons/kubernetes/role.png',
        listURL: (namespace: string) => { return namespace ? `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/roles` : `/apis/rbac.authorization.k8s.io/v1/roles`; },
        listItemComponent: RoleItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/roles/${name}`; },
        detailsComponent: Role,
      },
      'rolebindings': {
        singleText: 'Role Binding',
        pluralText: 'Role Bindings',
        icon: '/assets/icons/kubernetes/rb.png',
        listURL: (namespace: string) => { return namespace ? `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/rolebindings` : `/apis/rbac.authorization.k8s.io/v1/rolebindings`; },
        listItemComponent: RoleBindingItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/rolebindings/${name}`; },
        detailsComponent: RoleBinding,
      },
    }
  },
  'cluster': {
    title: 'Cluster',
    pages: {
      'customresourcedefinitions': {
        singleText: 'Custom Resource Definition',
        pluralText: 'Custom Resource Definitions',
        icon: '/assets/icons/kubernetes/crd.png',
        listURL: (namespace: string) => { return `/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions`; },
        listItemComponent: CustomResourceDefinitionItem,
        detailsURL: (namespace: string, name: string) => { return `/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions`; },
        detailsComponent: CustomResourceDefinitionItem,
      },
      'events': {
        singleText: 'Event',
        pluralText: 'Events',
        icon: '/assets/icons/kubernetes/events.png',
        listURL: (namespace: string) => { return namespace ? `/api/v1/namespaces/${namespace}/events` : `/api/v1/events`; },
        listItemComponent: EventItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${namespace}/events/${name}`; },
        detailsComponent: Event,
      },
      'namespaces': {
        singleText: 'Namespace',
        pluralText: 'Namespaces',
        icon: '/assets/icons/kubernetes/ns.png',
        listURL: (namespace: string) => { return `/api/v1/namespaces`; },
        listItemComponent: NamespaceItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/namespaces/${name}`; },
        detailsComponent: Namespace,
      },
      'nodes': {
        singleText: 'Node',
        pluralText: 'Nodes',
        icon: '/assets/icons/kubernetes/node.png',
        listURL: (namespace: string) => { return `/api/v1/nodes`; },
        listItemComponent: NodeItem,
        detailsURL: (namespace: string, name: string) => { return `/api/v1/nodes/${name}`; },
        detailsComponent: Node,
      },
    }
  },
};
