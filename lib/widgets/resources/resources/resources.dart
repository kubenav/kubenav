import 'package:flutter/material.dart';

import 'package:kubenav/widgets/resources/resources/resources_certificatesigningrequests.dart';
import 'package:kubenav/widgets/resources/resources/resources_clusterrolebindings.dart';
import 'package:kubenav/widgets/resources/resources/resources_clusterroles.dart';
import 'package:kubenav/widgets/resources/resources/resources_configmaps.dart';
import 'package:kubenav/widgets/resources/resources/resources_cronjobs.dart';
import 'package:kubenav/widgets/resources/resources/resources_customresourcedefinitions.dart';
import 'package:kubenav/widgets/resources/resources/resources_daemonsets.dart';
import 'package:kubenav/widgets/resources/resources/resources_deployments.dart';
import 'package:kubenav/widgets/resources/resources/resources_endpoints.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_horizontalpodautoscalers.dart';
import 'package:kubenav/widgets/resources/resources/resources_ingressclasses.dart';
import 'package:kubenav/widgets/resources/resources/resources_ingresses.dart';
import 'package:kubenav/widgets/resources/resources/resources_jobs.dart';
import 'package:kubenav/widgets/resources/resources/resources_limitranges.dart';
import 'package:kubenav/widgets/resources/resources/resources_namespaces.dart';
import 'package:kubenav/widgets/resources/resources/resources_networkpolicies.dart';
import 'package:kubenav/widgets/resources/resources/resources_nodes.dart';
import 'package:kubenav/widgets/resources/resources/resources_persistentvolumeclaims.dart';
import 'package:kubenav/widgets/resources/resources/resources_persistentvolumes.dart';
import 'package:kubenav/widgets/resources/resources/resources_poddisruptionbudgets.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources/resources_replicasets.dart';
import 'package:kubenav/widgets/resources/resources/resources_resourcequotas.dart';
import 'package:kubenav/widgets/resources/resources/resources_rolebindings.dart';
import 'package:kubenav/widgets/resources/resources/resources_roles.dart';
import 'package:kubenav/widgets/resources/resources/resources_secrets.dart';
import 'package:kubenav/widgets/resources/resources/resources_serviceaccounts.dart';
import 'package:kubenav/widgets/resources/resources/resources_services.dart';
import 'package:kubenav/widgets/resources/resources/resources_statefulsets.dart';
import 'package:kubenav/widgets/resources/resources/resources_storageclasses.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

/// [ResourceCategories] defines the different categories of Kubernetes
/// resources. The categories are used to group the resources within the UI.
class ResourceCategories {
  static const workload = 'Workloads';
  static const discoveryandloadbalancing = 'Discovery and Load Balancing';
  static const configAndStorage = 'Config and Storage';
  static const rbac = 'RBAC';
  static const cluster = 'Cluster';
}

final List<String> resourceCategories = [
  ResourceCategories.workload,
  ResourceCategories.discoveryandloadbalancing,
  ResourceCategories.configAndStorage,
  ResourceCategories.rbac,
  ResourceCategories.cluster,
];

/// [ResourceScope] is a `enum` for the scope of the Kubernetes resource. A
/// Kubernetes resource can be `namespaced` (e.g. Pods, Deployments, etc.) or
/// `cluster` (e.g. Custom Resource Definitions, Nodes, etc.).
enum ResourceScope { namespaced, cluster }

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

/// The [Resource] model represents a single Kubernetes resource, with all the
/// information we need to get and display the resource.
class Resource {
  String category;
  String plural;
  String singular;
  String description;
  String path;
  String resource;
  ResourceScope scope;
  List<AdditionalPrinterColumns> additionalPrinterColumns;
  String icon;
  String template;
  List<ResourceItem> Function(ResourcesListData data) decodeListData;
  List<dynamic> Function(String data) decodeList;
  String Function(dynamic item) getName;
  String? Function(dynamic item) getNamespace;
  dynamic Function(String data) decodeItem;
  String Function(dynamic item) encodeItem;
  Map<String, dynamic> Function(dynamic item) toJson;
  Widget Function(BuildContext context, Resource resource, ResourceItem item)
  listItemBuilder;
  List<String> Function(dynamic item) previewItemBuilder;
  Widget Function(BuildContext context, Resource resource, dynamic item)
  detailsItemBuilder;

  Resource({
    required this.category,
    required this.plural,
    required this.singular,
    required this.description,
    required this.path,
    required this.resource,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.icon,
    required this.template,
    required this.decodeListData,
    required this.decodeList,
    required this.getName,
    required this.getNamespace,
    required this.decodeItem,
    required this.encodeItem,
    required this.toJson,
    required this.listItemBuilder,
    required this.detailsItemBuilder,
    required this.previewItemBuilder,
  });

  Map<String, dynamic> id() {
    return {
      'plural': plural,
      'singular': singular,
      'description': description,
      'path': path,
      'resource': resource,
      'scope': scope.toShortString(),
      'additionalPrinterColumns': additionalPrinterColumns
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

/// [AdditionalPrinterColumns] adds additional columns from a manifest file to
/// a resource, which should be rendered within the list / details view for a
/// resource. This is similar to the
/// [IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceColumnDefinition]
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

/// [ResourceItem] is a single Kubernetes resource item, which contains the
/// actual resource, the metrics (if available) and the status of the resource.
class ResourceItem {
  dynamic item;
  ResourceMetrics? metrics;
  ResourceStatus status;

  ResourceItem({
    required this.item,
    required this.metrics,
    required this.status,
  });
}

/// [ResourceMetrics] is a simple model to store the CPU and memory usage of a
/// Kubernetes resource (Pod or Node).
class ResourceMetrics {
  String cpu;
  String memory;

  ResourceMetrics({required this.cpu, required this.memory});
}

/// [ResourceStatus] is a `enum` for the status of a Kubernetes resource. The
/// status can be `undefined`, `success`, `warning` or `danger`.
enum ResourceStatus { undefined, success, warning, danger }

extension ResourceStatusExtension on ResourceStatus {
  /// [toLocalizedString] returns a string for the status of a resource, which
  /// can be used in the UI.
  String toLocalizedString() {
    switch (this) {
      case ResourceStatus.undefined:
        return 'All';
      case ResourceStatus.success:
        return 'Healthy';
      case ResourceStatus.warning:
        return 'Warning';
      case ResourceStatus.danger:
        return 'Unhealthy';
    }
  }
}

/// [resourceDefaultTemplate] is a template for a Kubernetes resource, which can
/// be used to create a new resource. It is used as Fallback for resources,
/// which don't have a specific template.
const resourceDefaultTemplate =
    '{"apiVersion":"","kind":"","metadata":{"name":"","namespace":""},"spec":{}}';

/// [resources] is a list of all supported Kubernetes resources, which are
/// implementing the [Resource] model.
final List<Resource> resources = [
  resourceCronJob,
  resourceDaemonSet,
  resourceDeployment,
  resourceJob,
  resourcePod,
  resourceReplicaSet,
  resourceStatefulSet,
  resourceEndpoint,
  resourceHorizontalPodAutoscaler,
  resourceIngress,
  resourceIngressClass,
  resourceNetworkPolicy,
  resourceService,
  resourceConfigMap,
  resourceLimitRange,
  resourcePersistentVolume,
  resourcePersistentVolumeClaim,
  resourcePodDisruptionBudget,
  resourceResourceQuota,
  resourceSecret,
  resourceServiceAccount,
  resourceStorageClass,
  resourceClusterRole,
  resourceClusterRoleBinding,
  resourceRole,
  resourceRoleBinding,
  resourceCertificateSigningRequest,
  resourceEvent,
  resourceCustomResourceDefinition,
  resourceNamespace,
  resourceNode,
];

/// [kindToResource] is a map, which maps the kind of a Kubernetes resource to
/// the [Resource] model.
final Map<String, Resource> kindToResource = {
  'CronJob': resourceCronJob,
  'DaemonSet': resourceDaemonSet,
  'Deployment': resourceDeployment,
  'Job': resourceJob,
  'Pod': resourcePod,
  'ReplicaSet': resourceReplicaSet,
  'StatefulSet': resourceStatefulSet,
  'Endpoint': resourceEndpoint,
  'HorizontalPodAutoscaler': resourceHorizontalPodAutoscaler,
  'Ingress': resourceIngress,
  'IngressClass': resourceIngressClass,
  'NetworkPolicy': resourceNetworkPolicy,
  'Service': resourceService,
  'ConfigMap': resourceConfigMap,
  'LimitRange': resourceLimitRange,
  'PersistentVolume': resourcePersistentVolume,
  'PersistentVolumeClaim': resourcePersistentVolumeClaim,
  'PodDisruptionBudget': resourcePodDisruptionBudget,
  'ResourceQuota': resourceResourceQuota,
  'Secret': resourceSecret,
  'ServiceAccount': resourceServiceAccount,
  'StorageClass': resourceStorageClass,
  'ClusterRole': resourceClusterRole,
  'ClusterRoleBinding': resourceClusterRoleBinding,
  'Role': resourceRole,
  'RoleBinding': resourceRoleBinding,
  'CertificateSigningRequest': resourceCertificateSigningRequest,
  'Event': resourceEvent,
  'CustomResourceDefinition': resourceCustomResourceDefinition,
  'Namespace': resourceNamespace,
  'Node': resourceNode,
};
