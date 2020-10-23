import CronJobDetails from '../components/resources/workloads/cronJobs/CronJobDetails';
import DaemonSetDetails from '../components/resources/workloads/daemonSets/DaemonSetDetails';
import DeploymentDetails from '../components/resources/workloads/deployments/DeploymentDetails';
import JobDetails from '../components/resources/workloads/jobs/JobDetails';
import PodDetails from '../components/resources/workloads/pods/PodDetails';
import ReplicaSetDetails from '../components/resources/workloads/replicaSets/ReplicaSetDetails';
import ReplicationControllerDetails from '../components/resources/workloads/replicationControllers/ReplicationControllerDetails';
import StatefulSetDetails from '../components/resources/workloads/statefulSets/StatefulSetDetails';

import EndpointDetails from '../components/resources/discoveryAndLoadbalancing/endpoints/EndpointDetails';
import HorizontalPodAutoscalerDetails from '../components/resources/discoveryAndLoadbalancing/horizontalpodautoscalers/HorizontalPodAutoscalerDetails';
import IngressDetails from '../components/resources/discoveryAndLoadbalancing/ingresses/IngressDetails';
import NetworkPolicyDetails from '../components/resources/discoveryAndLoadbalancing/networkpolicies/NetworkPolicyDetails';
import ServiceDetails from '../components/resources/discoveryAndLoadbalancing/services/ServiceDetails';

import ConfigMapDetails from '../components/resources/configAndStorage/configMaps/ConfigMapDetails';
import PersistentVolumeClaimDetails from '../components/resources/configAndStorage/persistentVolumeClaims/PersistentVolumeClaimDetails';
import PersistentVolumeDetails from '../components/resources/configAndStorage/persistentVolumes/PersistentVolumeDetails';
import PodDisruptionBudgetDetails from '../components/resources/configAndStorage/podDisruptionBudgets/PodDisruptionBudgetDetails';
import SecretDetails from '../components/resources/configAndStorage/secrets/SecretDetails';
import ServiceAccountDetails from '../components/resources/configAndStorage/serviceAccounts/ServiceAccountDetails';
import StorageClassDetails from '../components/resources/configAndStorage/storageclasses/StorageClassDetails';

import ClusterRoleBindingDetails from '../components/resources/rbac/clusterRoleBindings/ClusterRoleBindingDetails';
import ClusterRoleDetails from '../components/resources/rbac/clusterRoles/ClusterRoleDetails';
import RoleBindingDetails from '../components/resources/rbac/roleBindings/RoleBindingDetails';
import RoleDetails from '../components/resources/rbac/roles/RoleDetails';

import ComponentStatusDetails from '../components/resources/cluster/componentstatuses/ComponentStatusDetails';
import EventDetails from '../components/resources/cluster/events/EventDetails';
import NamespaceDetails from '../components/resources/cluster/namespaces/NamespaceDetails';
import NodeDetails from '../components/resources/cluster/nodes/NodeDetails';
import PodSecurityPolicyDetails from '../components/resources/cluster/podsecuritypolicies/PodSecurityPolicyDetails';

import CronJobItem from '../components/resources/workloads/cronJobs/CronJobItem';
import DaemonSetItem from '../components/resources/workloads/daemonSets/DaemonSetItem';
import DeploymentItem from '../components/resources/workloads/deployments/DeploymentItem';
import JobItem from '../components/resources/workloads/jobs/JobItem';
import PodItem from '../components/resources/workloads/pods/PodItem';
import ReplicaSetItem from '../components/resources/workloads/replicaSets/ReplicaSetItem';
import ReplicationControllerItem from '../components/resources/workloads/replicationControllers/ReplicationControllerItem';
import StatefulSetItem from '../components/resources/workloads/statefulSets/StatefulSetItem';

import EndpointItem from '../components/resources/discoveryAndLoadbalancing/endpoints/EndpointItem';
import HorizontalPodAutoscalerItem from '../components/resources/discoveryAndLoadbalancing/horizontalpodautoscalers/HorizontalPodAutoscalerItem';
import IngressItem from '../components/resources/discoveryAndLoadbalancing/ingresses/IngressItem';
import NetworkPolicyItem from '../components/resources/discoveryAndLoadbalancing/networkpolicies/NetworkPolicyItem';
import ServiceItem from '../components/resources/discoveryAndLoadbalancing/services/ServiceItem';

import ConfigMapItem from '../components/resources/configAndStorage/configMaps/ConfigMapItem';
import PersistentVolumeClaimItem from '../components/resources/configAndStorage/persistentVolumeClaims/PersistentVolumeClaimItem';
import PersistentVolumeItem from '../components/resources/configAndStorage/persistentVolumes/PersistentVolumeItem';
import PodDisruptionBudgetItem from '../components/resources/configAndStorage/podDisruptionBudgets/PodDisruptionBudgetItem';
import SecretItem from '../components/resources/configAndStorage/secrets/SecretItem';
import ServiceAccountItem from '../components/resources/configAndStorage/serviceAccounts/ServiceAccountItem';
import StorageClassItem from '../components/resources/configAndStorage/storageclasses/StorageClassItem';

import ClusterRoleBindingItem from '../components/resources/rbac/clusterRoleBindings/ClusterRoleBindingItem';
import ClusterRoleItem from '../components/resources/rbac/clusterRoles/ClusterRoleItem';
import RoleBindingItem from '../components/resources/rbac/roleBindings/RoleBindingItem';
import RoleItem from '../components/resources/rbac/roles/RoleItem';

import ComponentStatusItem from '../components/resources/cluster/componentstatuses/ComponentStatusItem';
import CustomResourceDefinitionItem from '../components/resources/cluster/customResourceDefinitions/CustomResourceDefinitionItem';
import EventItem from '../components/resources/cluster/events/EventItem';
import NamespaceItem from '../components/resources/cluster/namespaces/NamespaceItem';
import NodeItem from '../components/resources/cluster/nodes/NodeItem';
import PodSecurityPolicyItem from '../components/resources/cluster/podsecuritypolicies/PodSecurityPolicyItem';

import { IAppSections } from '../declarations';

export const resources: IAppSections = {
  workloads: {
    title: 'Workloads',
    pages: {
      cronjobs: {
        singleText: 'Cron Job',
        pluralText: 'Cron Jobs',
        icon: '/assets/icons/kubernetes/cronjob.png',
        kind: 'CronJob',
        apiVersion: 'batch/v1beta1',
        listURL: (namespace: string): string => {
          return namespace ? `/apis/batch/v1beta1/namespaces/${namespace}/cronjobs` : `/apis/batch/v1beta1/cronjobs`;
        },
        listItemComponent: CronJobItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/batch/v1beta1/namespaces/${namespace}/cronjobs/${name}`;
        },
        detailsComponent: CronJobDetails,
      },
      daemonsets: {
        singleText: 'Daemon Set',
        pluralText: 'Daemon Sets',
        icon: '/assets/icons/kubernetes/ds.png',
        kind: 'DaemonSet',
        apiVersion: 'apps/v1',
        listURL: (namespace: string): string => {
          return namespace ? `/apis/apps/v1/namespaces/${namespace}/daemonsets` : `/apis/apps/v1/daemonsets`;
        },
        listItemComponent: DaemonSetItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/apps/v1/namespaces/${namespace}/daemonsets/${name}`;
        },
        detailsComponent: DaemonSetDetails,
      },
      deployments: {
        singleText: 'Deployment',
        pluralText: 'Deployments',
        icon: '/assets/icons/kubernetes/deploy.png',
        kind: 'Deployment',
        apiVersion: 'apps/v1',
        listURL: (namespace: string): string => {
          return namespace ? `/apis/apps/v1/namespaces/${namespace}/deployments` : `/apis/apps/v1/deployments`;
        },
        listItemComponent: DeploymentItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/apps/v1/namespaces/${namespace}/deployments/${name}`;
        },
        detailsComponent: DeploymentDetails,
      },
      jobs: {
        singleText: 'Job',
        pluralText: 'Jobs',
        icon: '/assets/icons/kubernetes/job.png',
        kind: 'Job',
        apiVersion: 'batch/v1',
        listURL: (namespace: string): string => {
          return namespace ? `/apis/batch/v1/namespaces/${namespace}/jobs` : `/apis/batch/v1/jobs`;
        },
        listItemComponent: JobItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/batch/v1/namespaces/${namespace}/jobs/${name}`;
        },
        detailsComponent: JobDetails,
      },
      pods: {
        singleText: 'Pod',
        pluralText: 'Pods',
        icon: '/assets/icons/kubernetes/pod.png',
        kind: 'Pod',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace ? `/api/v1/namespaces/${namespace}/pods` : `/api/v1/pods`;
        },
        listItemComponent: PodItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/pods/${name}`;
        },
        detailsComponent: PodDetails,
      },
      replicasets: {
        singleText: 'Replica Set',
        pluralText: 'Replica Sets',
        icon: '/assets/icons/kubernetes/rs.png',
        kind: 'ReplicaSet',
        apiVersion: 'apps/v1',
        listURL: (namespace: string): string => {
          return namespace ? `/apis/apps/v1/namespaces/${namespace}/replicasets` : `/apis/apps/v1/replicasets`;
        },
        listItemComponent: ReplicaSetItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/apps/v1/namespaces/${namespace}/replicasets/${name}`;
        },
        detailsComponent: ReplicaSetDetails,
      },
      replicationcontrollers: {
        singleText: 'Replication Controller',
        pluralText: 'Replication Controllers',
        icon: '/assets/icons/kubernetes/deploy.png',
        kind: 'ReplicationController',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/api/v1/namespaces/${namespace}/replicationcontrollers`
            : `/api/v1/replicationcontrollers`;
        },
        listItemComponent: ReplicationControllerItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/replicationcontrollers/${name}`;
        },
        detailsComponent: ReplicationControllerDetails,
      },
      statefulsets: {
        singleText: 'Stateful Set',
        pluralText: 'Stateful Sets',
        icon: '/assets/icons/kubernetes/sts.png',
        kind: 'StatefulSet',
        apiVersion: 'apps/v1',
        listURL: (namespace: string): string => {
          return namespace ? `/apis/apps/v1/namespaces/${namespace}/statefulsets` : `/apis/apps/v1/statefulsets`;
        },
        listItemComponent: StatefulSetItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/apps/v1/namespaces/${namespace}/statefulsets/${name}`;
        },
        detailsComponent: StatefulSetDetails,
      },
    },
  },
  'discovery-and-loadbalancing': {
    title: 'Discovery and Load Balancing',
    pages: {
      endpoints: {
        singleText: 'Endpoint',
        pluralText: 'Endpoints',
        icon: '/assets/icons/kubernetes/ep.png',
        kind: 'Endpoints',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace ? `/api/v1/namespaces/${namespace}/endpoints` : `/api/v1/endpoints`;
        },
        listItemComponent: EndpointItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/endpoints/${name}`;
        },
        detailsComponent: EndpointDetails,
      },
      horizontalpodautoscalers: {
        singleText: 'Horizontal Pod Autoscaler',
        pluralText: 'Horizontal Pod Autoscalers',
        icon: '/assets/icons/kubernetes/hpa.png',
        kind: 'HorizontalPodAutoscaler',
        apiVersion: 'autoscaling/v2beta1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/apis/autoscaling/v2beta1/namespaces/${namespace}/horizontalpodautoscalers`
            : `/apis/autoscaling/v2beta1/horizontalpodautoscalers`;
        },
        listItemComponent: HorizontalPodAutoscalerItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/autoscaling/v2beta1/namespaces/${namespace}/horizontalpodautoscalers/${name}`;
        },
        detailsComponent: HorizontalPodAutoscalerDetails,
      },
      ingresses: {
        singleText: 'Ingresse',
        pluralText: 'Ingresses',
        icon: '/assets/icons/kubernetes/ing.png',
        kind: 'Ingresse',
        apiVersion: 'networking.k8s.io/v1beta1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/apis/networking.k8s.io/v1beta1/namespaces/${namespace}/ingresses`
            : `/apis/networking.k8s.io/v1beta1/ingresses`;
        },
        listItemComponent: IngressItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/networking.k8s.io/v1beta1/namespaces/${namespace}/ingresses/${name}`;
        },
        detailsComponent: IngressDetails,
      },
      networkpolicies: {
        singleText: 'Network Policy',
        pluralText: 'Network Policies',
        icon: '/assets/icons/kubernetes/netpol.png',
        kind: 'NetworkPolicy',
        apiVersion: 'networking.k8s.io/v1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/apis/networking.k8s.io/v1/namespaces/${namespace}/networkpolicies`
            : `/apis/networking.k8s.io/v1/networkpolicies`;
        },
        listItemComponent: NetworkPolicyItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/networking.k8s.io/v1/namespaces/${namespace}/networkpolicies/${name}`;
        },
        detailsComponent: NetworkPolicyDetails,
      },
      services: {
        singleText: 'Service',
        pluralText: 'Services',
        icon: '/assets/icons/kubernetes/svc.png',
        kind: 'Service',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace ? `/api/v1/namespaces/${namespace}/services` : `/api/v1/services`;
        },
        listItemComponent: ServiceItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/services/${name}`;
        },
        detailsComponent: ServiceDetails,
      },
    },
  },
  'config-and-storage': {
    title: 'Config and Storage',
    pages: {
      configmaps: {
        singleText: 'Config Map',
        pluralText: 'Config Maps',
        icon: '/assets/icons/kubernetes/cm.png',
        kind: 'ConfigMap',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace ? `/api/v1/namespaces/${namespace}/configmaps` : `/api/v1/configmaps`;
        },
        listItemComponent: ConfigMapItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/configmaps/${name}`;
        },
        detailsComponent: ConfigMapDetails,
      },
      persistentvolumes: {
        singleText: 'Persistent Volume',
        pluralText: 'Persistent Volumes',
        icon: '/assets/icons/kubernetes/pv.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'PersistentVolume',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return `/api/v1/persistentvolumes`;
        },
        listItemComponent: PersistentVolumeItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/persistentvolumes/${name}`;
        },
        detailsComponent: PersistentVolumeDetails,
      },
      persistentvolumeclaims: {
        singleText: 'Persistent Volume Claim',
        pluralText: 'Persistent Volume Claims',
        icon: '/assets/icons/kubernetes/pvc.png',
        kind: 'PersistentVolumeClaim',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/api/v1/namespaces/${namespace}/persistentvolumeclaims`
            : `/api/v1/persistentvolumeclaims`;
        },
        listItemComponent: PersistentVolumeClaimItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/persistentvolumeclaims/${name}`;
        },
        detailsComponent: PersistentVolumeClaimDetails,
      },
      poddisruptionbudgets: {
        singleText: 'Pod Disruption Budget',
        pluralText: 'Pod Disruption Budgets',
        icon: '/assets/icons/kubernetes/pdb.png',
        kind: 'PodDisruptionBudget',
        apiVersion: 'policy/v1beta1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/apis/policy/v1beta1/namespaces/${namespace}/poddisruptionbudgets`
            : `/apis/policy/v1beta1/poddisruptionbudgets`;
        },
        listItemComponent: PodDisruptionBudgetItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/policy/v1beta1/namespaces/${namespace}/poddisruptionbudgets/${name}`;
        },
        detailsComponent: PodDisruptionBudgetDetails,
      },
      secrets: {
        singleText: 'Secret',
        pluralText: 'Secrets',
        icon: '/assets/icons/kubernetes/secret.png',
        kind: 'Secret',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace ? `/api/v1/namespaces/${namespace}/secrets` : `/api/v1/secrets`;
        },
        listItemComponent: SecretItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/secrets/${name}`;
        },
        detailsComponent: SecretDetails,
      },
      serviceaccounts: {
        singleText: 'Service Account',
        pluralText: 'Service Accounts',
        icon: '/assets/icons/kubernetes/sa.png',
        kind: 'ServiceAccount',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace ? `/api/v1/namespaces/${namespace}/serviceaccounts` : `/api/v1/serviceaccounts`;
        },
        listItemComponent: ServiceAccountItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/serviceaccounts/${name}`;
        },
        detailsComponent: ServiceAccountDetails,
      },
      storageclasses: {
        singleText: 'Storage Class',
        pluralText: 'Storage Classes',
        icon: '/assets/icons/kubernetes/sc.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'StorageClass',
        apiVersion: 'storage.k8s.io/v1',
        listURL: (namespace: string): string => {
          return `/apis/storage.k8s.io/v1/storageclasses`;
        },
        listItemComponent: StorageClassItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/storage.k8s.io/v1/storageclasses/${name}`;
        },
        detailsComponent: StorageClassDetails,
      },
    },
  },
  rbac: {
    title: 'RBAC',
    pages: {
      clusterroles: {
        singleText: 'Cluster Role',
        pluralText: 'Cluster Roles',
        icon: '/assets/icons/kubernetes/c-role.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'ClusterRole',
        apiVersion: 'rbac.authorization.k8s.io/v1',
        listURL: (namespace: string): string => {
          return `/apis/rbac.authorization.k8s.io/v1/clusterroles`;
        },
        listItemComponent: ClusterRoleItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/rbac.authorization.k8s.io/v1/clusterroles/${name}`;
        },
        detailsComponent: ClusterRoleDetails,
      },
      clusterrolebindings: {
        singleText: 'Cluster Role Binding',
        pluralText: 'Cluster Role Bindings',
        icon: '/assets/icons/kubernetes/c-rb.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'ClusterRoleBinding',
        apiVersion: 'rbac.authorization.k8s.io/v1',
        listURL: (namespace: string): string => {
          return `/apis/rbac.authorization.k8s.io/v1/clusterrolebindings`;
        },
        listItemComponent: ClusterRoleBindingItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/rbac.authorization.k8s.io/v1/clusterrolebindings/${name}`;
        },
        detailsComponent: ClusterRoleBindingDetails,
      },
      roles: {
        singleText: 'Role',
        pluralText: 'Roles',
        icon: '/assets/icons/kubernetes/role.png',
        kind: 'Role',
        apiVersion: 'rbac.authorization.k8s.io/v1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/roles`
            : `/apis/rbac.authorization.k8s.io/v1/roles`;
        },
        listItemComponent: RoleItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/roles/${name}`;
        },
        detailsComponent: RoleDetails,
      },
      rolebindings: {
        singleText: 'Role Binding',
        pluralText: 'Role Bindings',
        icon: '/assets/icons/kubernetes/rb.png',
        kind: 'RoleBinding',
        apiVersion: 'rbac.authorization.k8s.io/v1',
        listURL: (namespace: string): string => {
          return namespace
            ? `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/rolebindings`
            : `/apis/rbac.authorization.k8s.io/v1/rolebindings`;
        },
        listItemComponent: RoleBindingItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/rbac.authorization.k8s.io/v1/namespaces/${namespace}/rolebindings/${name}`;
        },
        detailsComponent: RoleBindingDetails,
      },
    },
  },
  cluster: {
    title: 'Cluster',
    pages: {
      componentstatuses: {
        singleText: 'Component Status',
        pluralText: 'Component Statuses',
        icon: '/assets/icons/kubernetes/master.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'ComponentStatus',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return `/api/v1/componentstatuses`;
        },
        listItemComponent: ComponentStatusItem,
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/componentstatuses/${name}`;
        },
        detailsComponent: ComponentStatusDetails,
      },
      customresourcedefinitions: {
        singleText: 'Custom Resource Definition',
        pluralText: 'Custom Resource Definitions',
        icon: '/assets/icons/kubernetes/crd.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: '',
        apiVersion: '',
        listURL: (namespace: string): string => {
          return `/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions`;
        },
        listItemComponent: CustomResourceDefinitionItem,
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/apiextensions.k8s.io/v1beta1/customresourcedefinitions`;
        },
        detailsComponent: CustomResourceDefinitionItem,
      },
      events: {
        singleText: 'Event',
        pluralText: 'Events',
        icon: '/assets/icons/kubernetes/events.png',
        kind: 'Event',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return namespace ? `/api/v1/namespaces/${namespace}/events` : `/api/v1/events`;
        },
        listItemComponent: EventItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${namespace}/events/${name}`;
        },
        detailsComponent: EventDetails,
      },
      namespaces: {
        singleText: 'Namespace',
        pluralText: 'Namespaces',
        icon: '/assets/icons/kubernetes/ns.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'Namespace',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return `/api/v1/namespaces`;
        },
        listItemComponent: NamespaceItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/namespaces/${name}`;
        },
        detailsComponent: NamespaceDetails,
      },
      nodes: {
        singleText: 'Node',
        pluralText: 'Nodes',
        icon: '/assets/icons/kubernetes/node.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'Node',
        apiVersion: 'v1',
        listURL: (namespace: string): string => {
          return `/api/v1/nodes`;
        },
        listItemComponent: NodeItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/api/v1/nodes/${name}`;
        },
        detailsComponent: NodeDetails,
      },
      podsecuritypolicies: {
        singleText: 'Pod Security Policy',
        pluralText: 'Pod Security Policies',
        icon: '/assets/icons/kubernetes/psp.png',
        // eslint-disable-next-line @typescript-eslint/no-unused-vars
        kind: 'PodSecurityPolicy',
        apiVersion: 'policy/v1beta1',
        listURL: (namespace: string): string => {
          return `/apis/policy/v1beta1/podsecuritypolicies`;
        },
        listItemComponent: PodSecurityPolicyItem,
        detailsURL: (namespace: string, name: string): string => {
          return `/apis/policy/v1beta1/podsecuritypolicies/${name}`;
        },
        detailsComponent: PodSecurityPolicyDetails,
      },
    },
  },
};
