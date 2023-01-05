import 'package:flutter/material.dart';

import 'package:kubenav/widgets/resources/details/clusterrole_details_item.dart';
import 'package:kubenav/widgets/resources/details/clusterrolebinding_details_item.dart';
import 'package:kubenav/widgets/resources/details/configmap_details_item.dart';
import 'package:kubenav/widgets/resources/details/cronjob_details_item.dart';
import 'package:kubenav/widgets/resources/details/daemonset_details_item.dart';
import 'package:kubenav/widgets/resources/details/deployment_details_item.dart';
import 'package:kubenav/widgets/resources/details/endpoint_details_item.dart';
import 'package:kubenav/widgets/resources/details/event_details_item.dart';
import 'package:kubenav/widgets/resources/details/horizontalpodautoscaler_details_item.dart';
import 'package:kubenav/widgets/resources/details/ingress_details_item.dart';
import 'package:kubenav/widgets/resources/details/job_details_item.dart';
import 'package:kubenav/widgets/resources/details/namespace_details_item.dart';
import 'package:kubenav/widgets/resources/details/networkpolicy_details_item.dart';
import 'package:kubenav/widgets/resources/details/node_details_item.dart';
import 'package:kubenav/widgets/resources/details/persistentvolume_details_item.dart';
import 'package:kubenav/widgets/resources/details/persistentvolumeclaim_details_item.dart';
import 'package:kubenav/widgets/resources/details/pod_details_item.dart';
import 'package:kubenav/widgets/resources/details/poddisruptionbudget_details_item.dart';
import 'package:kubenav/widgets/resources/details/replicaset_details_item.dart';
import 'package:kubenav/widgets/resources/details/role_details_item.dart';
import 'package:kubenav/widgets/resources/details/rolebinding_details_item.dart';
import 'package:kubenav/widgets/resources/details/secret_details_item.dart';
import 'package:kubenav/widgets/resources/details/service_details_item.dart';
import 'package:kubenav/widgets/resources/details/serviceaccount_details_item.dart';
import 'package:kubenav/widgets/resources/details/statefulset_details_item.dart';
import 'package:kubenav/widgets/resources/details/storageclass_details_item.dart';
import 'package:kubenav/widgets/resources/list/clusterrolebinding_list_item.dart';
import 'package:kubenav/widgets/resources/list/configmap_list_item.dart';
import 'package:kubenav/widgets/resources/list/cronjob_list_item.dart';
import 'package:kubenav/widgets/resources/list/daemonset_list_item.dart';
import 'package:kubenav/widgets/resources/list/deployment_list_item.dart';
import 'package:kubenav/widgets/resources/list/endpoint_list_item.dart';
import 'package:kubenav/widgets/resources/list/event_list_item.dart';
import 'package:kubenav/widgets/resources/list/horizontalpodautoscaler_list_item.dart';
import 'package:kubenav/widgets/resources/list/ingress_list_item.dart';
import 'package:kubenav/widgets/resources/list/job_list_item.dart';
import 'package:kubenav/widgets/resources/list/namespace_list_item.dart';
import 'package:kubenav/widgets/resources/list/networkpolicy_list_item.dart';
import 'package:kubenav/widgets/resources/list/node_list_item.dart';
import 'package:kubenav/widgets/resources/list/persistentvolume_list_item.dart';
import 'package:kubenav/widgets/resources/list/persistentvolumeclaim_list_item.dart';
import 'package:kubenav/widgets/resources/list/pod_list_item.dart';
import 'package:kubenav/widgets/resources/list/poddisruptionbudget_list_item.dart';
import 'package:kubenav/widgets/resources/list/replicaset_list_item.dart';
import 'package:kubenav/widgets/resources/list/rolebinding_list_item.dart';
import 'package:kubenav/widgets/resources/list/secret_list_item.dart';
import 'package:kubenav/widgets/resources/list/service_list_item.dart';
import 'package:kubenav/widgets/resources/list/serviceaccount_list_item.dart';
import 'package:kubenav/widgets/resources/list/statefulset_list_item.dart';
import 'package:kubenav/widgets/resources/list/storageclass_list_item.dart';

/// [ResourceType] is a `enum`, which can be used to categorize all the
/// Kubernetes resources within a cluster. Besides the categorization of
/// resources, no functions of kubenav should depend on it. This means in the
/// current state of kubenav we are only using it in the resources page to
/// create multiple lists of resources by the the [ResourceType].
enum ResourceType {
  workload,
  discoveryandloadbalancing,
  configandstorage,
  rbac,
  cluster,
}

/// [ResourceScope] is a `enum` for the scope of the Kubernetes resource. A
/// Kubernetes resource can be `namespaced` (e.g. Pods, Deployments, etc.) or
/// `cluster` (e.g. Custom Resource Definitions, Nodes, etc.).
///
/// To get the string representation of the scope the `.name` property can be
/// used (e.g. `resource.scope.name`).
enum ResourceScope {
  namespaced,
  cluster,
}

extension ResourceScopeExtension on ResourceScope {
  /// [toShortString] returns a short string of the resource scope, so that we
  /// can use the type within the json encode and decode functions.
  String toShortString() {
    return toString().split('.').last;
  }
}

/// [getResourceScopeFromString] is a helper function to get the `ResourceScope`
/// from it's string representation. If the provided scope string is
/// `namespaced` it will be [ResourceScope.namespaced], for all other cases it
/// will return [ResourceScope.cluster].
ResourceScope getResourceScopeFromString(String? scope) {
  if (scope?.toLowerCase() == 'namespaced') {
    return ResourceScope.namespaced;
  }

  return ResourceScope.cluster;
}

/// [AdditionalPrinterColumns] adds additional columns from a manifest file to
/// a resource, which should be rendered within the list / details view for a
/// resource. This is similar to the [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition]
/// type and mainly used to render some custom fields for CRDs.
class AdditionalPrinterColumns {
  String description;
  String jsonPath;
  String name;
  String type;

  AdditionalPrinterColumns({
    required this.description,
    required this.jsonPath,
    required this.name,
    required this.type,
  });

  factory AdditionalPrinterColumns.fromJson(Map<String, dynamic> data) {
    return AdditionalPrinterColumns(
      description: data['description'],
      jsonPath: data['jsonPath'],
      name: data['name'],
      type: data['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'jsonPath': jsonPath,
      'name': name,
      'type': type,
    };
  }
}

/// A [Resource] represents a single Kubernetes resource. Each resource must
/// contain a [resourceType], a human readable [title], a [description] and the
/// [resource], [path] and [scope] so the corresponding Kubernetes manifests can
/// be retrieved from the Kubernetes API. A resource can also contain a
/// [buildListItem] and [buildDetailsItem] function, to customize the look of
/// the items in the resources list and details page.
///
/// NOTE: If a resource is passed through different pages via query parameters,
/// like it is done in the resource page -> resource list page -> resource
/// details page flow, we should always pass the [resource], [path] and [scope]
/// property, so that we can also work with resources which are not defined in
/// the [Resources] map.
class Resource {
  ResourceType resourceType;
  String title;
  String description;
  String resource;
  String path;
  ResourceScope scope;
  List<AdditionalPrinterColumns> additionalPrinterColumns;
  String template;
  Widget Function(
    String title,
    String resource,
    String path,
    ResourceScope scope,
    List<AdditionalPrinterColumns> additionalPrinterColumns,
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
    required this.additionalPrinterColumns,
    this.buildListItem,
    this.buildDetailsItem,
  });
}

/// [Resources] contains a [map] of all first party Kubernetes resources, like
/// Pods, Deployments, Nodes, etc. The map should be used carefully. As
/// mentioned in the [Resource] note the app also have to work with unknown
/// resources like Custom Resources.
abstract class Resources {
  static Map<String, Resource> map = {
    'cronjobs': Resource(
      resourceType: ResourceType.workload,
      title: 'CronJobs',
      description: 'A CronJob creates Jobs on a repeating schedule.',
      resource: 'cronjobs',
      path: '/apis/batch/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template:
          '{"apiVersion":"batch/v1","kind":"CronJob","metadata":{"name":"","namespace":""},"spec":{"schedule":"5 4 * * *","suspend":false,"successfulJobsHistoryLimit":1,"failedJobsHistoryLimit":1,"jobTemplate":{"spec":{"backoffLimit":0,"template":{"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}}}',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          CronJobListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => CronJobDetailsItem(item: item),
    ),
    'daemonsets': Resource(
      resourceType: ResourceType.workload,
      title: 'DaemonSets',
      description:
          'A DaemonSet ensures that all (or some) Nodes run a copy of a Pod.',
      resource: 'daemonsets',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template:
          '{"apiVersion":"apps/v1","kind":"DaemonSet","metadata":{"name":"","namespace":""},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          DaemonSetListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => DaemonSetDetailsItem(item: item),
    ),
    'deployments': Resource(
      resourceType: ResourceType.workload,
      title: 'Deployments',
      description:
          'A Deployment provides declarative updates for Pods and ReplicaSets.',
      resource: 'deployments',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template:
          '{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"","namespace":""},"spec":{"replicas":1,"selector":{"matchLabels":{"app":"nginx"}},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          DeploymentListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => DeploymentDetailsItem(item: item),
    ),
    'jobs': Resource(
      resourceType: ResourceType.workload,
      title: 'Jobs',
      description:
          'A Job creates one or more Pods and will continue to retry execution of the Pods until a specified number of them successfully terminate.',
      resource: 'jobs',
      path: '/apis/batch/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template:
          '{"apiVersion":"batch/v1","kind":"Job","metadata":{"name":"","namespace":""},"spec":{"backoffLimit":0,"completions":1,"parallelism":1,"template":{"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          JobListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => JobDetailsItem(item: item),
    ),
    'pods': Resource(
      resourceType: ResourceType.workload,
      title: 'Pods',
      description:
          'Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.',
      resource: 'pods',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template:
          '{"apiVersion":"v1","kind":"Pod","metadata":{"name":"","namespace":""},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          PodListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
        metrics: metrics,
      ),
      buildDetailsItem: (dynamic item) => PodDetailsItem(item: item),
    ),
    'replicasets': Resource(
      resourceType: ResourceType.workload,
      title: 'ReplicaSets',
      description:
          'A ReplicaSet\'s purpose is to maintain a stable set of replica Pods running at any given time.',
      resource: 'replicasets',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          ReplicaSetListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => ReplicaSetDetailsItem(item: item),
    ),
    'statefulsets': Resource(
      resourceType: ResourceType.workload,
      title: 'StatefulSets',
      description:
          'StatefulSet is the workload API object used to manage stateful applications.',
      resource: 'statefulsets',
      path: '/apis/apps/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template:
          '{"apiVersion":"apps/v1","kind":"StatefulSet","metadata":{"name":"","namespace":""},"spec":{"replicas":1,"selector":{"matchLabels":{"app":"nginx"}},"serviceName":"nginx","template":{"metadata":{"labels":{"app":"nginx"},"name":"nginx"},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          StatefulSetListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => StatefulSetDetailsItem(item: item),
    ),
    'endpoints': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'Endpoints',
      description:
          'An Endpoint is an resource that gets IP addresses of one or more pods dynamically assigned to it, along with a port.',
      resource: 'endpoints',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          EndpointListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => EndpointDetailsItem(item: item),
    ),
    'horizontalpodautoscalers': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'HorizontalPodAutoscalers',
      description:
          'A HorizontalPodAutoscaler automatically updates a workload resource, with the aim of automatically scaling the workload to match demand.',
      resource: 'horizontalpodautoscalers',
      path: '/apis/autoscaling/v2',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          HorizontalPodAutoscalerListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          HorizontalPodAutoscalerDetailsItem(item: item),
    ),
    'ingresses': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'Ingresses',
      description:
          'An API object that manages external access to the services in a cluster, typically HTTP.',
      resource: 'ingresses',
      path: '/apis/networking.k8s.io/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          IngressListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => IngressDetailsItem(item: item),
    ),
    'networkpolicies': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'NetworkPolicies',
      description:
          'NetworkPolicies are an application-centric construct which allow you to specify how a pod is allowed to communicate with various network "entities" over the network.',
      resource: 'networkpolicies',
      path: '/apis/networking.k8s.io/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          NetworkPolicyListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => NetworkPolicyDetailsItem(item: item),
    ),
    'services': Resource(
      resourceType: ResourceType.discoveryandloadbalancing,
      title: 'Services',
      description:
          'An abstract way to expose an application running on a set of Pods as a network service.',
      resource: 'services',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          ServiceListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => ServiceDetailsItem(item: item),
    ),
    'configmaps': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'ConfigMaps',
      description:
          'A ConfigMap is an API object used to store non-confidential data in key-value pairs.',
      resource: 'configmaps',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          ConfigMapListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => ConfigMapDetailsItem(item: item),
    ),
    'persistentvolumes': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'PersistentVolumes',
      description:
          'A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.',
      resource: 'persistentvolumes',
      path: '/api/v1',
      scope: ResourceScope.cluster,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          PersistentVolumeListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          PersistentVolumeDetailsItem(item: item),
    ),
    'persistentvolumeclaims': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'PersistentVolumeClaims',
      description:
          'A PersistentVolumeClaim (PVC) is a request for storage by a user.',
      resource: 'persistentvolumeclaims',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          PersistentVolumeClaimListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          PersistentVolumeClaimDetailsItem(item: item),
    ),
    'poddisruptionbudgets': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'PodDisruptionBudgets',
      description:
          'PDBs provide a way to limit the number of concurrent disruptions that your application experiences.',
      resource: 'poddisruptionbudgets',
      path: '/apis/policy/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          PodDisruptionBudgetListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          PodDisruptionBudgetDetailsItem(item: item),
    ),
    'secrets': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'Secrets',
      description:
          'A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key.',
      resource: 'secrets',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          SecretListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => SecretDetailsItem(item: item),
    ),
    'serviceaccounts': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'ServiceAccounts',
      description:
          'A ServiceAccount provides an identity for processes that run in a Pod.',
      resource: 'serviceaccounts',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          ServiceAccountListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => ServiceAccountDetailsItem(item: item),
    ),
    'storageclasses': Resource(
      resourceType: ResourceType.configandstorage,
      title: 'StorageClasses',
      description:
          'A StorageClass provides a way for administrators to describe the "classes" of storage they offer.',
      resource: 'storageclasses',
      path: '/apis/storage.k8s.io/v1',
      scope: ResourceScope.cluster,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          StorageClassListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => StorageClassDetailsItem(item: item),
    ),
    'clusterroles': Resource(
      resourceType: ResourceType.rbac,
      title: 'ClusterRoles',
      description:
          'An RBAC ClusterRole contains rules that represent a set of permissions.',
      resource: 'clusterroles',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.cluster,
      additionalPrinterColumns: [],
      template: '',
      buildDetailsItem: (dynamic item) => ClusterRoleDetailsItem(item: item),
    ),
    'clusterrolebindings': Resource(
      resourceType: ResourceType.rbac,
      title: 'ClusterRoleBindings',
      description:
          'A role binding grants the permissions defined in a role to a user or set of users.',
      resource: 'clusterrolebindings',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.cluster,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          ClusterRoleBindingListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) =>
          ClusterRoleBindingDetailsItem(item: item),
    ),
    'roles': Resource(
      resourceType: ResourceType.rbac,
      title: 'Roles',
      description:
          'An RBAC Role contains rules that represent a set of permissions.',
      resource: 'roles',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildDetailsItem: (dynamic item) => RoleDetailsItem(item: item),
    ),
    'rolebindings': Resource(
      resourceType: ResourceType.rbac,
      title: 'RoleBindings',
      description:
          'A role binding grants the permissions defined in a role to a user or set of users.',
      resource: 'rolebindings',
      path: '/apis/rbac.authorization.k8s.io/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          RoleBindingListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => RoleBindingDetailsItem(item: item),
    ),
    'events': Resource(
      resourceType: ResourceType.cluster,
      title: 'Events',
      description:
          'Events are automatically created when other resources have state changes, errors, or other messages that should be broadcast to the system.',
      resource: 'events',
      path: '/api/v1',
      scope: ResourceScope.namespaced,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          EventListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => EventDetailsItem(item: item),
    ),
    'customresourcedefinitions': Resource(
      resourceType: ResourceType.cluster,
      title: 'CustomResourceDefinitions',
      description: 'Custom resources are extensions of the Kubernetes API.',
      resource: 'customresourcedefinitions',
      path: '/apis/apiextensions.k8s.io/v1',
      scope: ResourceScope.cluster,
      additionalPrinterColumns: [],
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
      additionalPrinterColumns: [],
      template:
          '{"apiVersion":"v1","kind":"Namespace","metadata":{"name":"nginx"}}',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          NamespaceListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
      ),
      buildDetailsItem: (dynamic item) => NamespaceDetailsItem(item: item),
    ),
    'nodes': Resource(
      resourceType: ResourceType.cluster,
      title: 'Nodes',
      description:
          'A node may be a virtual or physical machine, depending on the cluster.',
      resource: 'nodes',
      path: '/api/v1',
      scope: ResourceScope.cluster,
      additionalPrinterColumns: [],
      template: '',
      buildListItem: (
        String title,
        String resource,
        String path,
        ResourceScope scope,
        List<AdditionalPrinterColumns> additionalPrinterColumns,
        dynamic item,
        dynamic metrics,
      ) =>
          NodeListItem(
        title: title,
        resource: resource,
        path: path,
        scope: scope,
        additionalPrinterColumns: additionalPrinterColumns,
        item: item,
        metrics: metrics,
      ),
      buildDetailsItem: (dynamic item) => NodeDetailsItem(item: item),
    ),
  };
}
