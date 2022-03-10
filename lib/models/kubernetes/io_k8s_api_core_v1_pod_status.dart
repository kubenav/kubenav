//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container_status.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_condition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_ip.dart';

class IoK8sApiCoreV1PodStatus {
  /// Returns a new [IoK8sApiCoreV1PodStatus] instance.
  IoK8sApiCoreV1PodStatus({
    this.conditions = const [],
    this.containerStatuses = const [],
    this.ephemeralContainerStatuses = const [],
    this.hostIP,
    this.initContainerStatuses = const [],
    this.message,
    this.nominatedNodeName,
    this.phase,
    this.podIP,
    this.podIPs = const [],
    this.qosClass,
    this.reason,
    this.startTime,
  });

  /// Current service state of pod. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
  List<IoK8sApiCoreV1PodCondition> conditions;

  /// The list has one entry per container in the manifest. Each entry is currently the output of `docker inspect`. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
  List<IoK8sApiCoreV1ContainerStatus> containerStatuses;

  /// Status for any ephemeral containers that have run in this pod. This field is beta-level and available on clusters that haven't disabled the EphemeralContainers feature gate.
  List<IoK8sApiCoreV1ContainerStatus> ephemeralContainerStatuses;

  /// IP address of the host to which the pod is assigned. Empty if not yet scheduled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostIP;

  /// The list has one entry per init container in the manifest. The most recent successful init container will have ready = true, the most recently started container will have startTime set. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
  List<IoK8sApiCoreV1ContainerStatus> initContainerStatuses;

  /// A human readable message indicating details about why the pod is in this condition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// nominatedNodeName is set only when this pod preempts other pods on the node, but it cannot be scheduled right away as preemption victims receive their graceful termination periods. This field does not guarantee that the pod will be scheduled on this node. Scheduler may decide to place the pod elsewhere if other nodes become available sooner. Scheduler may also decide to give the resources on this node to a higher priority pod that is created after preemption. As a result, this field may be different than PodSpec.nodeName when the pod is scheduled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nominatedNodeName;

  /// The phase of a Pod is a simple, high-level summary of where the Pod is in its lifecycle. The conditions array, the reason and message fields, and the individual container status arrays contain more detail about the pod's status. There are five possible phase values:  Pending: The pod has been accepted by the Kubernetes system, but one or more of the container images has not been created. This includes time before being scheduled as well as time spent downloading images over the network, which could take a while. Running: The pod has been bound to a node, and all of the containers have been created. At least one container is still running, or is in the process of starting or restarting. Succeeded: All containers in the pod have terminated in success, and will not be restarted. Failed: All containers in the pod have terminated, and at least one container has terminated in failure. The container either exited with non-zero status or was terminated by the system. Unknown: For some reason the state of the pod could not be obtained, typically due to an error in communicating with the host of the pod.  More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-phase  Possible enum values:  - `\"Failed\"` means that all containers in the pod have terminated, and at least one container has terminated in a failure (exited with a non-zero exit code or was stopped by the system).  - `\"Pending\"` means the pod has been accepted by the system, but one or more of the containers has not been started. This includes time before being bound to a node, as well as time spent pulling images onto the host.  - `\"Running\"` means the pod has been bound to a node and all of the containers have been started. At least one container is still running or is in the process of being restarted.  - `\"Succeeded\"` means that all containers in the pod have voluntarily terminated with a container exit code of 0, and the system is not going to restart any of these containers.  - `\"Unknown\"` means that for some reason the state of the pod could not be obtained, typically due to an error in communicating with the host of the pod. Deprecated: It isn't being set since 2015 (74da3b14b0c0f658b3bb8d2def5094686d0e9095)
  IoK8sApiCoreV1PodStatusPhaseEnum? phase;

  /// IP address allocated to the pod. Routable at least within the cluster. Empty if not yet allocated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? podIP;

  /// podIPs holds the IP addresses allocated to the pod. If this field is specified, the 0th entry must match the podIP field. Pods may be allocated at most 1 value for each of IPv4 and IPv6. This list is empty if no IPs have been allocated yet.
  List<IoK8sApiCoreV1PodIP> podIPs;

  /// The Quality of Service (QOS) classification assigned to the pod based on resource requirements See PodQOSClass type for available QOS classes More info: https://git.k8s.io/community/contributors/design-proposals/node/resource-qos.md  Possible enum values:  - `\"BestEffort\"` is the BestEffort qos class.  - `\"Burstable\"` is the Burstable qos class.  - `\"Guaranteed\"` is the Guaranteed qos class.
  IoK8sApiCoreV1PodStatusQosClassEnum? qosClass;

  /// A brief CamelCase message indicating details about why the pod is in this state. e.g. 'Evicted'
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? startTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodStatus &&
          other.conditions == conditions &&
          other.containerStatuses == containerStatuses &&
          other.ephemeralContainerStatuses == ephemeralContainerStatuses &&
          other.hostIP == hostIP &&
          other.initContainerStatuses == initContainerStatuses &&
          other.message == message &&
          other.nominatedNodeName == nominatedNodeName &&
          other.phase == phase &&
          other.podIP == podIP &&
          other.podIPs == podIPs &&
          other.qosClass == qosClass &&
          other.reason == reason &&
          other.startTime == startTime;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (containerStatuses.hashCode) +
      (ephemeralContainerStatuses.hashCode) +
      (hostIP == null ? 0 : hostIP!.hashCode) +
      (initContainerStatuses.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (nominatedNodeName == null ? 0 : nominatedNodeName!.hashCode) +
      (phase == null ? 0 : phase!.hashCode) +
      (podIP == null ? 0 : podIP!.hashCode) +
      (podIPs.hashCode) +
      (qosClass == null ? 0 : qosClass!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (startTime == null ? 0 : startTime!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodStatus[conditions=$conditions, containerStatuses=$containerStatuses, ephemeralContainerStatuses=$ephemeralContainerStatuses, hostIP=$hostIP, initContainerStatuses=$initContainerStatuses, message=$message, nominatedNodeName=$nominatedNodeName, phase=$phase, podIP=$podIP, podIPs=$podIPs, qosClass=$qosClass, reason=$reason, startTime=$startTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = conditions;
    json[r'containerStatuses'] = containerStatuses;
    json[r'ephemeralContainerStatuses'] = ephemeralContainerStatuses;
    if (hostIP != null) {
      json[r'hostIP'] = hostIP;
    }
    json[r'initContainerStatuses'] = initContainerStatuses;
    if (message != null) {
      json[r'message'] = message;
    }
    if (nominatedNodeName != null) {
      json[r'nominatedNodeName'] = nominatedNodeName;
    }
    if (phase != null) {
      json[r'phase'] = phase;
    }
    if (podIP != null) {
      json[r'podIP'] = podIP;
    }
    json[r'podIPs'] = podIPs;
    if (qosClass != null) {
      json[r'qosClass'] = qosClass;
    }
    if (reason != null) {
      json[r'reason'] = reason;
    }
    if (startTime != null) {
      json[r'startTime'] = startTime!.toUtc().toIso8601String();
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodStatus(
        conditions:
            IoK8sApiCoreV1PodCondition.listFromJson(json[r'conditions']) ??
                const [],
        containerStatuses: IoK8sApiCoreV1ContainerStatus.listFromJson(
                json[r'containerStatuses']) ??
            const [],
        ephemeralContainerStatuses: IoK8sApiCoreV1ContainerStatus.listFromJson(
                json[r'ephemeralContainerStatuses']) ??
            const [],
        hostIP: mapValueOfType<String>(json, r'hostIP'),
        initContainerStatuses: IoK8sApiCoreV1ContainerStatus.listFromJson(
                json[r'initContainerStatuses']) ??
            const [],
        message: mapValueOfType<String>(json, r'message'),
        nominatedNodeName: mapValueOfType<String>(json, r'nominatedNodeName'),
        phase: IoK8sApiCoreV1PodStatusPhaseEnum.fromJson(json[r'phase']),
        podIP: mapValueOfType<String>(json, r'podIP'),
        podIPs: IoK8sApiCoreV1PodIP.listFromJson(json[r'podIPs']) ?? const [],
        qosClass:
            IoK8sApiCoreV1PodStatusQosClassEnum.fromJson(json[r'qosClass']),
        reason: mapValueOfType<String>(json, r'reason'),
        startTime: mapDateTime(json, r'startTime', ''),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PodStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodStatus.listFromJson(
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

/// The phase of a Pod is a simple, high-level summary of where the Pod is in its lifecycle. The conditions array, the reason and message fields, and the individual container status arrays contain more detail about the pod's status. There are five possible phase values:  Pending: The pod has been accepted by the Kubernetes system, but one or more of the container images has not been created. This includes time before being scheduled as well as time spent downloading images over the network, which could take a while. Running: The pod has been bound to a node, and all of the containers have been created. At least one container is still running, or is in the process of starting or restarting. Succeeded: All containers in the pod have terminated in success, and will not be restarted. Failed: All containers in the pod have terminated, and at least one container has terminated in failure. The container either exited with non-zero status or was terminated by the system. Unknown: For some reason the state of the pod could not be obtained, typically due to an error in communicating with the host of the pod.  More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-phase  Possible enum values:  - `\"Failed\"` means that all containers in the pod have terminated, and at least one container has terminated in a failure (exited with a non-zero exit code or was stopped by the system).  - `\"Pending\"` means the pod has been accepted by the system, but one or more of the containers has not been started. This includes time before being bound to a node, as well as time spent pulling images onto the host.  - `\"Running\"` means the pod has been bound to a node and all of the containers have been started. At least one container is still running or is in the process of being restarted.  - `\"Succeeded\"` means that all containers in the pod have voluntarily terminated with a container exit code of 0, and the system is not going to restart any of these containers.  - `\"Unknown\"` means that for some reason the state of the pod could not be obtained, typically due to an error in communicating with the host of the pod. Deprecated: It isn't being set since 2015 (74da3b14b0c0f658b3bb8d2def5094686d0e9095)
class IoK8sApiCoreV1PodStatusPhaseEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PodStatusPhaseEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const failed = IoK8sApiCoreV1PodStatusPhaseEnum._(r'Failed');
  static const pending = IoK8sApiCoreV1PodStatusPhaseEnum._(r'Pending');
  static const running = IoK8sApiCoreV1PodStatusPhaseEnum._(r'Running');
  static const succeeded = IoK8sApiCoreV1PodStatusPhaseEnum._(r'Succeeded');
  static const unknown = IoK8sApiCoreV1PodStatusPhaseEnum._(r'Unknown');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PodStatusPhaseEnum].
  static const values = <IoK8sApiCoreV1PodStatusPhaseEnum>[
    failed,
    pending,
    running,
    succeeded,
    unknown,
  ];

  static IoK8sApiCoreV1PodStatusPhaseEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1PodStatusPhaseEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1PodStatusPhaseEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodStatusPhaseEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodStatusPhaseEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PodStatusPhaseEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PodStatusPhaseEnum].
class IoK8sApiCoreV1PodStatusPhaseEnumTypeTransformer {
  factory IoK8sApiCoreV1PodStatusPhaseEnumTypeTransformer() =>
      _instance ??= const IoK8sApiCoreV1PodStatusPhaseEnumTypeTransformer._();

  const IoK8sApiCoreV1PodStatusPhaseEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PodStatusPhaseEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PodStatusPhaseEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PodStatusPhaseEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Failed':
          return IoK8sApiCoreV1PodStatusPhaseEnum.failed;
        case r'Pending':
          return IoK8sApiCoreV1PodStatusPhaseEnum.pending;
        case r'Running':
          return IoK8sApiCoreV1PodStatusPhaseEnum.running;
        case r'Succeeded':
          return IoK8sApiCoreV1PodStatusPhaseEnum.succeeded;
        case r'Unknown':
          return IoK8sApiCoreV1PodStatusPhaseEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PodStatusPhaseEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PodStatusPhaseEnumTypeTransformer? _instance;
}

/// The Quality of Service (QOS) classification assigned to the pod based on resource requirements See PodQOSClass type for available QOS classes More info: https://git.k8s.io/community/contributors/design-proposals/node/resource-qos.md  Possible enum values:  - `\"BestEffort\"` is the BestEffort qos class.  - `\"Burstable\"` is the Burstable qos class.  - `\"Guaranteed\"` is the Guaranteed qos class.
class IoK8sApiCoreV1PodStatusQosClassEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PodStatusQosClassEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const bestEffort =
      IoK8sApiCoreV1PodStatusQosClassEnum._(r'BestEffort');
  static const burstable = IoK8sApiCoreV1PodStatusQosClassEnum._(r'Burstable');
  static const guaranteed =
      IoK8sApiCoreV1PodStatusQosClassEnum._(r'Guaranteed');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PodStatusQosClassEnum].
  static const values = <IoK8sApiCoreV1PodStatusQosClassEnum>[
    bestEffort,
    burstable,
    guaranteed,
  ];

  static IoK8sApiCoreV1PodStatusQosClassEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1PodStatusQosClassEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1PodStatusQosClassEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodStatusQosClassEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodStatusQosClassEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PodStatusQosClassEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PodStatusQosClassEnum].
class IoK8sApiCoreV1PodStatusQosClassEnumTypeTransformer {
  factory IoK8sApiCoreV1PodStatusQosClassEnumTypeTransformer() => _instance ??=
      const IoK8sApiCoreV1PodStatusQosClassEnumTypeTransformer._();

  const IoK8sApiCoreV1PodStatusQosClassEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PodStatusQosClassEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PodStatusQosClassEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PodStatusQosClassEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'BestEffort':
          return IoK8sApiCoreV1PodStatusQosClassEnum.bestEffort;
        case r'Burstable':
          return IoK8sApiCoreV1PodStatusQosClassEnum.burstable;
        case r'Guaranteed':
          return IoK8sApiCoreV1PodStatusQosClassEnum.guaranteed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PodStatusQosClassEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PodStatusQosClassEnumTypeTransformer? _instance;
}
