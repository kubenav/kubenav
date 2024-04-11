//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service_port.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_session_affinity_config.dart';

class IoK8sApiCoreV1ServiceSpec {
  /// Returns a new [IoK8sApiCoreV1ServiceSpec] instance.
  IoK8sApiCoreV1ServiceSpec({
    this.allocateLoadBalancerNodePorts,
    this.clusterIP,
    this.clusterIPs = const [],
    this.externalIPs = const [],
    this.externalName,
    this.externalTrafficPolicy,
    this.healthCheckNodePort,
    this.internalTrafficPolicy,
    this.ipFamilies = const [],
    this.ipFamilyPolicy,
    this.loadBalancerClass,
    this.loadBalancerIP,
    this.loadBalancerSourceRanges = const [],
    this.ports = const [],
    this.publishNotReadyAddresses,
    this.selector = const {},
    this.sessionAffinity,
    this.sessionAffinityConfig,
    this.type,
  });

  /// allocateLoadBalancerNodePorts defines if NodePorts will be automatically allocated for services with type LoadBalancer.  Default is \"true\". It may be set to \"false\" if the cluster load-balancer does not rely on NodePorts.  If the caller requests specific NodePorts (by specifying a value), those requests will be respected, regardless of this field. This field may only be set for services with type LoadBalancer and will be cleared if the type is changed to any other type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allocateLoadBalancerNodePorts;

  /// clusterIP is the IP address of the service and is usually assigned randomly. If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be blank) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are \"None\", empty string (\"\"), or a valid IP address. Setting this to \"None\" makes a \"headless service\" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? clusterIP;

  /// ClusterIPs is a list of IP addresses assigned to this service, and are usually assigned randomly.  If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be empty) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are \"None\", empty string (\"\"), or a valid IP address.  Setting this to \"None\" makes a \"headless service\" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName.  If this field is not specified, it will be initialized from the clusterIP field.  If this field is specified, clients must ensure that clusterIPs[0] and clusterIP have the same value.  This field may hold a maximum of two entries (dual-stack IPs, in either order). These IPs must correspond to the values of the ipFamilies field. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  List<String> clusterIPs;

  /// externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.
  List<String> externalIPs;

  /// externalName is the external reference that discovery mechanisms will return as an alias for this service (e.g. a DNS CNAME record). No proxying will be involved.  Must be a lowercase RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires `type` to be \"ExternalName\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalName;

  /// externalTrafficPolicy describes how nodes distribute service traffic they receive on one of the Service's \"externally-facing\" addresses (NodePorts, ExternalIPs, and LoadBalancer IPs). If set to \"Local\", the proxy will configure the service in a way that assumes that external load balancers will take care of balancing the service traffic between nodes, and so each node will deliver traffic only to the node-local endpoints of the service, without masquerading the client source IP. (Traffic mistakenly sent to a node with no endpoints will be dropped.) The default value, \"Cluster\", uses the standard behavior of routing to all endpoints evenly (possibly modified by topology and other features). Note that traffic sent to an External IP or LoadBalancer IP from within the cluster will always get \"Cluster\" semantics, but clients sending to a NodePort from within the cluster may need to take traffic policy into account when picking a node.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalTrafficPolicy;

  /// healthCheckNodePort specifies the healthcheck nodePort for the service. This only applies when type is set to LoadBalancer and externalTrafficPolicy is set to Local. If a value is specified, is in-range, and is not in use, it will be used.  If not specified, a value will be automatically allocated.  External systems (e.g. load-balancers) can use this port to determine if a given node holds endpoints for this service or not.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type). This field cannot be updated once set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? healthCheckNodePort;

  /// InternalTrafficPolicy describes how nodes distribute service traffic they receive on the ClusterIP. If set to \"Local\", the proxy will assume that pods only want to talk to endpoints of the service on the same node as the pod, dropping the traffic if there are no local endpoints. The default value, \"Cluster\", uses the standard behavior of routing to all endpoints evenly (possibly modified by topology and other features).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? internalTrafficPolicy;

  /// IPFamilies is a list of IP families (e.g. IPv4, IPv6) assigned to this service. This field is usually assigned automatically based on cluster configuration and the ipFamilyPolicy field. If this field is specified manually, the requested family is available in the cluster, and ipFamilyPolicy allows it, it will be used; otherwise creation of the service will fail. This field is conditionally mutable: it allows for adding or removing a secondary IP family, but it does not allow changing the primary IP family of the Service. Valid values are \"IPv4\" and \"IPv6\".  This field only applies to Services of types ClusterIP, NodePort, and LoadBalancer, and does apply to \"headless\" services. This field will be wiped when updating a Service to type ExternalName.  This field may hold a maximum of two entries (dual-stack families, in either order).  These families must correspond to the values of the clusterIPs field, if specified. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field.
  List<String> ipFamilies;

  /// IPFamilyPolicy represents the dual-stack-ness requested or required by this Service. If there is no value provided, then this field will be set to SingleStack. Services can be \"SingleStack\" (a single IP family), \"PreferDualStack\" (two IP families on dual-stack configured clusters or a single IP family on single-stack clusters), or \"RequireDualStack\" (two IP families on dual-stack configured clusters, otherwise fail). The ipFamilies and clusterIPs fields depend on the value of this field. This field will be wiped when updating a service to type ExternalName.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ipFamilyPolicy;

  /// loadBalancerClass is the class of the load balancer implementation this Service belongs to. If specified, the value of this field must be a label-style identifier, with an optional prefix, e.g. \"internal-vip\" or \"example.com/internal-vip\". Unprefixed names are reserved for end-users. This field can only be set when the Service type is 'LoadBalancer'. If not set, the default load balancer implementation is used, today this is typically done through the cloud provider integration, but should apply for any default implementation. If set, it is assumed that a load balancer implementation is watching for Services with a matching class. Any default load balancer implementation (e.g. cloud providers) should ignore Services that set this field. This field can only be set when creating or updating a Service to type 'LoadBalancer'. Once set, it can not be changed. This field will be wiped when a service is updated to a non 'LoadBalancer' type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? loadBalancerClass;

  /// Only applies to Service Type: LoadBalancer. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature. Deprecated: This field was under-specified and its meaning varies across implementations, and it cannot support dual-stack. As of Kubernetes v1.24, users are encouraged to use implementation-specific annotations when available. This field may be removed in a future API version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? loadBalancerIP;

  /// If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature.\" More info: https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/
  List<String> loadBalancerSourceRanges;

  /// The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  List<IoK8sApiCoreV1ServicePort> ports;

  /// publishNotReadyAddresses indicates that any agent which deals with endpoints for this Service should disregard any indications of ready/not-ready. The primary use case for setting this field is for a StatefulSet's Headless Service to propagate SRV DNS records for its Pods for the purpose of peer discovery. The Kubernetes controllers that generate Endpoints and EndpointSlice resources for Services interpret this to mean that all endpoints are considered \"ready\" even if the Pods themselves are not. Agents which consume only Kubernetes generated endpoints through the Endpoints or EndpointSlice resources can safely assume this behavior.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? publishNotReadyAddresses;

  /// Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/
  Map<String, String> selector;

  /// Supports \"ClientIP\" and \"None\". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sessionAffinity;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SessionAffinityConfig? sessionAffinityConfig;

  /// type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. \"ClusterIP\" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object or EndpointSlice objects. If clusterIP is \"None\", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a virtual IP. \"NodePort\" builds on ClusterIP and allocates a port on every node which routes to the same endpoints as the clusterIP. \"LoadBalancer\" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the same endpoints as the clusterIP. \"ExternalName\" aliases this service to the specified externalName. Several other fields do not apply to ExternalName services. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ServiceSpec &&
          other.allocateLoadBalancerNodePorts ==
              allocateLoadBalancerNodePorts &&
          other.clusterIP == clusterIP &&
          other.clusterIPs == clusterIPs &&
          other.externalIPs == externalIPs &&
          other.externalName == externalName &&
          other.externalTrafficPolicy == externalTrafficPolicy &&
          other.healthCheckNodePort == healthCheckNodePort &&
          other.internalTrafficPolicy == internalTrafficPolicy &&
          other.ipFamilies == ipFamilies &&
          other.ipFamilyPolicy == ipFamilyPolicy &&
          other.loadBalancerClass == loadBalancerClass &&
          other.loadBalancerIP == loadBalancerIP &&
          other.loadBalancerSourceRanges == loadBalancerSourceRanges &&
          other.ports == ports &&
          other.publishNotReadyAddresses == publishNotReadyAddresses &&
          other.selector == selector &&
          other.sessionAffinity == sessionAffinity &&
          other.sessionAffinityConfig == sessionAffinityConfig &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allocateLoadBalancerNodePorts == null
          ? 0
          : allocateLoadBalancerNodePorts!.hashCode) +
      (clusterIP == null ? 0 : clusterIP!.hashCode) +
      (clusterIPs.hashCode) +
      (externalIPs.hashCode) +
      (externalName == null ? 0 : externalName!.hashCode) +
      (externalTrafficPolicy == null ? 0 : externalTrafficPolicy!.hashCode) +
      (healthCheckNodePort == null ? 0 : healthCheckNodePort!.hashCode) +
      (internalTrafficPolicy == null ? 0 : internalTrafficPolicy!.hashCode) +
      (ipFamilies.hashCode) +
      (ipFamilyPolicy == null ? 0 : ipFamilyPolicy!.hashCode) +
      (loadBalancerClass == null ? 0 : loadBalancerClass!.hashCode) +
      (loadBalancerIP == null ? 0 : loadBalancerIP!.hashCode) +
      (loadBalancerSourceRanges.hashCode) +
      (ports.hashCode) +
      (publishNotReadyAddresses == null
          ? 0
          : publishNotReadyAddresses!.hashCode) +
      (selector.hashCode) +
      (sessionAffinity == null ? 0 : sessionAffinity!.hashCode) +
      (sessionAffinityConfig == null ? 0 : sessionAffinityConfig!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ServiceSpec[allocateLoadBalancerNodePorts=$allocateLoadBalancerNodePorts, clusterIP=$clusterIP, clusterIPs=$clusterIPs, externalIPs=$externalIPs, externalName=$externalName, externalTrafficPolicy=$externalTrafficPolicy, healthCheckNodePort=$healthCheckNodePort, internalTrafficPolicy=$internalTrafficPolicy, ipFamilies=$ipFamilies, ipFamilyPolicy=$ipFamilyPolicy, loadBalancerClass=$loadBalancerClass, loadBalancerIP=$loadBalancerIP, loadBalancerSourceRanges=$loadBalancerSourceRanges, ports=$ports, publishNotReadyAddresses=$publishNotReadyAddresses, selector=$selector, sessionAffinity=$sessionAffinity, sessionAffinityConfig=$sessionAffinityConfig, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allocateLoadBalancerNodePorts != null) {
      json[r'allocateLoadBalancerNodePorts'] =
          this.allocateLoadBalancerNodePorts;
    } else {
      json[r'allocateLoadBalancerNodePorts'] = null;
    }
    if (this.clusterIP != null) {
      json[r'clusterIP'] = this.clusterIP;
    } else {
      json[r'clusterIP'] = null;
    }
    json[r'clusterIPs'] = this.clusterIPs;
    json[r'externalIPs'] = this.externalIPs;
    if (this.externalName != null) {
      json[r'externalName'] = this.externalName;
    } else {
      json[r'externalName'] = null;
    }
    if (this.externalTrafficPolicy != null) {
      json[r'externalTrafficPolicy'] = this.externalTrafficPolicy;
    } else {
      json[r'externalTrafficPolicy'] = null;
    }
    if (this.healthCheckNodePort != null) {
      json[r'healthCheckNodePort'] = this.healthCheckNodePort;
    } else {
      json[r'healthCheckNodePort'] = null;
    }
    if (this.internalTrafficPolicy != null) {
      json[r'internalTrafficPolicy'] = this.internalTrafficPolicy;
    } else {
      json[r'internalTrafficPolicy'] = null;
    }
    json[r'ipFamilies'] = this.ipFamilies;
    if (this.ipFamilyPolicy != null) {
      json[r'ipFamilyPolicy'] = this.ipFamilyPolicy;
    } else {
      json[r'ipFamilyPolicy'] = null;
    }
    if (this.loadBalancerClass != null) {
      json[r'loadBalancerClass'] = this.loadBalancerClass;
    } else {
      json[r'loadBalancerClass'] = null;
    }
    if (this.loadBalancerIP != null) {
      json[r'loadBalancerIP'] = this.loadBalancerIP;
    } else {
      json[r'loadBalancerIP'] = null;
    }
    json[r'loadBalancerSourceRanges'] = this.loadBalancerSourceRanges;
    json[r'ports'] = this.ports;
    if (this.publishNotReadyAddresses != null) {
      json[r'publishNotReadyAddresses'] = this.publishNotReadyAddresses;
    } else {
      json[r'publishNotReadyAddresses'] = null;
    }
    json[r'selector'] = this.selector;
    if (this.sessionAffinity != null) {
      json[r'sessionAffinity'] = this.sessionAffinity;
    } else {
      json[r'sessionAffinity'] = null;
    }
    if (this.sessionAffinityConfig != null) {
      json[r'sessionAffinityConfig'] = this.sessionAffinityConfig;
    } else {
      json[r'sessionAffinityConfig'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ServiceSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ServiceSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ServiceSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ServiceSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ServiceSpec(
        allocateLoadBalancerNodePorts:
            mapValueOfType<bool>(json, r'allocateLoadBalancerNodePorts'),
        clusterIP: mapValueOfType<String>(json, r'clusterIP'),
        clusterIPs: json[r'clusterIPs'] is List
            ? (json[r'clusterIPs'] as List).cast<String>()
            : const [],
        externalIPs: json[r'externalIPs'] is List
            ? (json[r'externalIPs'] as List).cast<String>()
            : const [],
        externalName: mapValueOfType<String>(json, r'externalName'),
        externalTrafficPolicy:
            mapValueOfType<String>(json, r'externalTrafficPolicy'),
        healthCheckNodePort: mapValueOfType<int>(json, r'healthCheckNodePort'),
        internalTrafficPolicy:
            mapValueOfType<String>(json, r'internalTrafficPolicy'),
        ipFamilies: json[r'ipFamilies'] is List
            ? (json[r'ipFamilies'] as List).cast<String>()
            : const [],
        ipFamilyPolicy: mapValueOfType<String>(json, r'ipFamilyPolicy'),
        loadBalancerClass: mapValueOfType<String>(json, r'loadBalancerClass'),
        loadBalancerIP: mapValueOfType<String>(json, r'loadBalancerIP'),
        loadBalancerSourceRanges: json[r'loadBalancerSourceRanges'] is List
            ? (json[r'loadBalancerSourceRanges'] as List).cast<String>()
            : const [],
        ports:
            IoK8sApiCoreV1ServicePort.listFromJson(json[r'ports']) ?? const [],
        publishNotReadyAddresses:
            mapValueOfType<bool>(json, r'publishNotReadyAddresses'),
        selector: mapCastOfType<String, String>(json, r'selector') ?? const {},
        sessionAffinity: mapValueOfType<String>(json, r'sessionAffinity'),
        sessionAffinityConfig: IoK8sApiCoreV1SessionAffinityConfig.fromJson(
            json[r'sessionAffinityConfig']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ServiceSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ServiceSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ServiceSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ServiceSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ServiceSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ServiceSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ServiceSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ServiceSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ServiceSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ServiceSpec.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
