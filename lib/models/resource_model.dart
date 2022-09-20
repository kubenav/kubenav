import 'package:flutter/material.dart';

import 'package:kubenav/pages/resources_details/widgets/clusterrole_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/clusterrolebinding_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/configmap_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/cronjob_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/daemonset_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/deployment_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/endpoint_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/event_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/horizontalpodautoscaler_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/ingress_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/job_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/namespace_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/networkpolicy_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/node_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/persistentvolume_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/persistentvolumeclaim_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/pod_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/poddisruptionbudget_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/podsecuritypolicy_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/replicaset_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/role_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/rolebinding_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/secret_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/service_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/serviceaccount_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/statefulset_details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/storageclass_details_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/clusterrolebinding_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/configmap_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/cronjob_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/daemonset_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/deployment_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/endpoint_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/event_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/horizontalpodautoscaler_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/ingress_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/job_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/namespace_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/networkpolicy_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/node_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/persistentvolume_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/persistentvolumeclaim_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/pod_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/poddisruptionbudget_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/podsecuritypolicy_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/replicaset_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/rolebinding_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/secret_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/service_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/serviceaccount_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/statefulset_list_item_widget.dart';
import 'package:kubenav/pages/resources_list/widgets/storageclass_list_item_widget.dart';

/// [ResourceType] is a `enum`, which can be used to categorize all the Kubernetes resources within a cluster. Besides
/// the categorization of resources, no functions of kubenav should depend on it. This means in the current state of
/// kubenav we are only using it in the resources page to create multiple lists of resources by the the [ResourceType].
enum ResourceType {
  workload,
  discoveryandloadbalancing,
  configandstorage,
  rbac,
  cluster,
}

/// [ResourceScope] is a `enum` for the scope of the Kubernetes resource. A Kubernetes resource can be `namespaced`
/// (e.g. Pods, Deployments, etc.) or `cluster` (e.g. Custom Resource Definitions, Nodes, etc.).
///
/// To get the string representation of the scope the `.name` property can be used (e.g. `resource.scope.name`).
enum ResourceScope {
  namespaced,
  cluster,
}

/// [resourceScopeFromString] is a helper function to get the `ResourceScope` from it's string representation. If the
/// provided scope string is `namespaced` it will be `ResourceScope.namespaced`, if it is `cluster` it will be
/// `ResourceScope.cluster`. If the provided scope string doesn't match one of these values we return `null`.
ResourceScope? resourceScopeFromString(String? scope) {
  if (scope == null) {
    return null;
  }

  if (scope.toLowerCase() == 'namespaced') {
    return ResourceScope.namespaced;
  }

  if (scope.toLowerCase() == 'cluster') {
    return ResourceScope.cluster;
  }

  return null;
}

/// A [Resource] represents a single Kubernetes resource. Each resource must contain a [resourceType], a human readable
/// [title], a [description] and the [resource], [path] and [scope] so the corresponding Kubernetes manifests can be
/// retrieved from the Kubernetes API. A resource can also contain a [buildListItem] and [buildDetailsItem] function, to
/// customize the look of the items in the resources list and details page.
///
/// NOTE: If a resource is passed through different pages via query parameters, like it is done in the resource page ->
/// resource list page -> resource details page flow, we should always pass the [resource], [path] and [scope] property,
/// so that we can also work with resources which are not defined in the [Resources] map.
class Resource {
  ResourceType resourceType;
  String title;
  String description;
  String resource;
  String path;
  ResourceScope scope;
  String template;
  Widget Function(
    String? title,
    String? resource,
    String? path,
    ResourceScope? scope,
    dynamic item,
    dynamic metrics,
  )? buildListItem;
  Widget Function(dynamic item)? buildDetailsItem;

  Resource({
    required this.resourceType,
    required this.title,
    required this.description,
    required this.resource,
    required this.path,
    required this.scope,
    required this.template,
    this.buildListItem,
    this.buildDetailsItem,
  });
}

/// [Resources] contains a [map] of all first party Kubernetes resources, like Pods, Deployments, Nodes, etc. The map
/// should be used carefully. As mentioned in the [Resource] note the app also have to work with unknown resources like
/// Custom Resources.
abstract class Resources {
  static Map<String, Resource> map = {
    'cronjobs': Resource(
      resourceType: ResourceType.workload,
      title: 'CronJobs',
      description: 'A CronJob creates Jobs on a repeating schedule.',
      resource: 'cronjobs',
      path: '/apis/batch/v1beta1',
      scope: ResourceScope.namespaced,
      template:
          '{"apiVersion":"batch/v1","kind":"CronJob","metadata":{"name":"","namespace":""},"spec":{"schedule":"5 4 * * *","suspend":false,"successfulJobsHistoryLimit":1,"failedJobsHistoryLimit":1,"jobTemplate":{"spec":{"backoffLimit":0,"template":{"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}}}',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          CronJobListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => CronJobDetailsItemWidget(item: item),
    ),
    'daemonsets': Resource(
      resourceType: ResourceType.workload,
      title: 'DaemonSets',
      description:
          'A DaemonSet ensures that all (or some) Nodes run a copy of a Pod.',
      resource: 'daemonsets',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      template:
          '{"apiVersion":"apps/v1","kind":"DaemonSet","metadata":{"name":"","namespace":""},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          DaemonSetListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          DaemonSetDetailsItemWidget(item: item),
    ),
    'deployments': Resource(
      resourceType: ResourceType.workload,
      title: 'Deployments',
      description:
          'A Deployment provides declarative updates for Pods and ReplicaSets.',
      resource: 'deployments',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      template:
          '{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"","namespace":""},"spec":{"replicas":1,"selector":{"matchLabels":{"app":"nginx"}},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          DeploymentListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          DeploymentDetailsItemWidget(item: item),
    ),
    'jobs': Resource(
      resourceType: ResourceType.workload,
      title: 'Jobs',
      description:
          'A Job creates one or more Pods and will continue to retry execution of the Pods until a specified number of them successfully terminate.',
      resource: 'jobs',
      path: '/apis/batch/v1',
      scope: ResourceScope.namespaced,
      template:
          '{"apiVersion":"batch/v1","kind":"Job","metadata":{"name":"","namespace":""},"spec":{"backoffLimit":0,"completions":1,"parallelism":1,"template":{"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          JobListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => JobDetailsItemWidget(item: item),
    ),
    'pods': Resource(
      resourceType: ResourceType.workload,
      title: 'Pods',
      description:
          'Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.',
      resource: 'pods',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template:
          '{"apiVersion":"v1","kind":"Pod","metadata":{"name":"","namespace":""},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          PodListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
        metrics: metrics,
      ),
      buildDetailsItem: (dynamic item) => PodDetailsItemWidget(item: item),
    ),
    'replicasets': Resource(
      resourceType: ResourceType.workload,
      title: 'ReplicaSets',
      description:
          'A ReplicaSet\'s purpose is to maintain a stable set of replica Pods running at any given time.',
      resource: 'replicasets',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          ReplicaSetListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          ReplicaSetDetailsItemWidget(item: item),
    ),
    'statefulsets': Resource(
      resourceType: ResourceType.workload,
      title: 'StatefulSets',
      description:
          'StatefulSet is the workload API object used to manage stateful applications.',
      resource: 'statefulsets',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      template:
          '{"apiVersion":"apps/v1","kind":"StatefulSet","metadata":{"name":"","namespace":""},"spec":{"replicas":1,"selector":{"matchLabels":{"app":"nginx"}},"serviceName":"nginx","template":{"metadata":{"labels":{"app":"nginx"},"name":"nginx"},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          StatefulSetListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          StatefulSetDetailsItemWidget(item: item),
    ),
    'endpoints': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'Endpoints',
      description:
          'An Endpoint is an resource that gets IP addresses of one or more pods dynamically assigned to it, along with a port.',
      resource: 'endpoints',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          EndpointListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => EndpointDetailsItemWidget(item: item),
    ),
    'horizontalpodautoscalers': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'HorizontalPodAutoscalers',
      description:
          'A HorizontalPodAutoscaler automatically updates a workload resource, with the aim of automatically scaling the workload to match demand.',
      resource: 'horizontalpodautoscalers',
      path: '/apis/autoscaling/v2beta1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          HorizontalPodAutoscalerListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          HorizontalPodAutoscalerDetailsItemWidget(item: item),
    ),
    'ingresses': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'Ingresses',
      description:
          'An API object that manages external access to the services in a cluster, typically HTTP.',
      resource: 'ingresses',
      path: '/apis/networking.k8s.io/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          IngressListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => IngressDetailsItemWidget(item: item),
    ),
    'networkpolicies': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'NetworkPolicies',
      description:
          'NetworkPolicies are an application-centric construct which allow you to specify how a pod is allowed to communicate with various network "entities" over the network.',
      resource: 'networkpolicies',
      path: '/apis/networking.k8s.io/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          NetworkPolicyListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          NetworkPolicyDetailsItemWidget(item: item),
    ),
    'services': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'Services',
      description:
          'An abstract way to expose an application running on a set of Pods as a network service.',
      resource: 'services',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          ServiceListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => ServiceDetailsItemWidget(item: item),
    ),
    'configmaps': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'ConfigMaps',
      description:
          'A ConfigMap is an API object used to store non-confidential data in key-value pairs.',
      resource: 'configmaps',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          ConfigMapListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          ConfigMapDetailsItemWidget(item: item),
    ),
    'persistentvolumes': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'PersistentVolumes',
      description:
          'A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.',
      resource: 'persistentvolumes',
      path: '/api/v1',
      scope: ResourceScope.cluster,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          PersistentVolumeListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          PersistentVolumeDetailsItemWidget(item: item),
    ),
    'persistentvolumeclaims': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'PersistentVolumeClaims',
      description:
          'A PersistentVolumeClaim (PVC) is a request for storage by a user.',
      resource: 'persistentvolumeclaims',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          PersistentVolumeClaimListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          PersistentVolumeClaimDetailsItemWidget(item: item),
    ),
    'poddisruptionbudgets': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'PodDisruptionBudgets',
      description:
          'PDBs provide a way to limit the number of concurrent disruptions that your application experiences.',
      resource: 'poddisruptionbudgets',
      path: '/apis/policy/v1beta1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          PodDisruptionBudgetListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          PodDisruptionBudgetDetailsItemWidget(item: item),
    ),
    'secrets': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'Secrets',
      description:
          'A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key.',
      resource: 'secrets',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          SecretListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => SecretDetailsItemWidget(item: item),
    ),
    'serviceaccounts': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'ServiceAccounts',
      description:
          'A ServiceAccount provides an identity for processes that run in a Pod.',
      resource: 'serviceaccounts',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          ServiceAccountListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          ServiceAccountDetailsItemWidget(item: item),
    ),
    'storageclasses': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'StorageClasses',
      description:
          'A StorageClass provides a way for administrators to describe the "classes" of storage they offer.',
      resource: 'storageclasses',
      path: '/apis/storage.k8s.io/v1',
      scope: ResourceScope.cluster,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          StorageClassListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          StorageClassDetailsItemWidget(item: item),
    ),
    'clusterroles': Resource(
      resourceType: ResourceType.rbac,
      title: 'ClusterRoles',
      description:
          'An RBAC ClusterRole contains rules that represent a set of permissions.',
      resource: 'clusterroles',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.cluster,
      template: '',
      buildDetailsItem: (dynamic item) =>
          ClusterRoleDetailsItemWidget(item: item),
    ),
    'clusterrolebindings': Resource(
      resourceType: ResourceType.rbac,
      title: 'ClusterRoleBindings',
      description:
          'A role binding grants the permissions defined in a role to a user or set of users.',
      resource: 'clusterrolebindings',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.cluster,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          ClusterRoleBindingListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          ClusterRoleBindingDetailsItemWidget(item: item),
    ),
    'roles': Resource(
      resourceType: ResourceType.rbac,
      title: 'Roles',
      description:
          'An RBAC Role contains rules that represent a set of permissions.',
      resource: 'roles',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildDetailsItem: (dynamic item) => RoleDetailsItemWidget(item: item),
    ),
    'rolebindings': Resource(
      resourceType: ResourceType.rbac,
      title: 'RoleBindings',
      description:
          'A role binding grants the permissions defined in a role to a user or set of users.',
      resource: 'rolebindings',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          RoleBindingListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          RoleBindingDetailsItemWidget(item: item),
    ),
    'events': Resource(
      resourceType: ResourceType.cluster,
      title: 'Events',
      description:
          'Events are automatically created when other resources have state changes, errors, or other messages that should be broadcast to the system.',
      resource: 'events',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          EventListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => EventDetailsItemWidget(item: item),
    ),
    'customresourcedefinitions': Resource(
      resourceType: ResourceType.cluster,
      title: 'CustomResourceDefinitions',
      description: 'Custom resources are extensions of the Kubernetes API.',
      resource: 'customresourcedefinitions',
      path: '/apis/apiextensions.k8s.io/v1',
      scope: ResourceScope.cluster,
      template: '',
    ),
    'namespaces': Resource(
      resourceType: ResourceType.cluster,
      title: 'Namespaces',
      description:
          'Namespaces provides a mechanism for isolating groups of resources within a single cluster.',
      resource: 'namespaces',
      path: '/api/v1',
      scope: ResourceScope.cluster,
      template:
          '{"apiVersion":"v1","kind":"Namespace","metadata":{"name":"nginx"}}',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          NamespaceListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          NamespaceDetailsItemWidget(item: item),
    ),
    'nodes': Resource(
      resourceType: ResourceType.cluster,
      title: 'Nodes',
      description:
          'A node may be a virtual or physical machine, depending on the cluster.',
      resource: 'nodes',
      path: '/api/v1',
      scope: ResourceScope.cluster,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          NodeListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
        metrics: metrics,
      ),
      buildDetailsItem: (dynamic item) => NodeDetailsItemWidget(item: item),
    ),
    'podsecuritypolicies': Resource(
      resourceType: ResourceType.cluster,
      title: 'PodSecurityPolicies',
      description:
          'PodSecurityPolicies enable fine-grained authorization of pod creation and updates.',
      resource: 'podsecuritypolicies',
      path: '/apis/policy/v1beta1',
      scope: ResourceScope.cluster,
      template: '',
      buildListItem: (
        String? title,
        String? resource,
        String? path,
        ResourceScope? scope,
        dynamic item,
        dynamic metrics,
      ) =>
          PodSecurityPolicyListItemWidget(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          PodSecurityPolicyDetailsItemWidget(item: item),
    ),
  };
}
