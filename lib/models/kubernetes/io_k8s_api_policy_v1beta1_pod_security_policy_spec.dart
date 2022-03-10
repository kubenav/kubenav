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
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_allowed_csi_driver.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_allowed_flex_volume.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_allowed_host_path.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_fs_group_strategy_options.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_host_port_range.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_run_as_group_strategy_options.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_run_as_user_strategy_options.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_runtime_class_strategy_options.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_se_linux_strategy_options.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_supplemental_groups_strategy_options.dart';

class IoK8sApiPolicyV1beta1PodSecurityPolicySpec {
  /// Returns a new [IoK8sApiPolicyV1beta1PodSecurityPolicySpec] instance.
  IoK8sApiPolicyV1beta1PodSecurityPolicySpec({
    this.allowPrivilegeEscalation,
    this.allowedCSIDrivers = const [],
    this.allowedCapabilities = const [],
    this.allowedFlexVolumes = const [],
    this.allowedHostPaths = const [],
    this.allowedProcMountTypes = const [],
    this.allowedUnsafeSysctls = const [],
    this.defaultAddCapabilities = const [],
    this.defaultAllowPrivilegeEscalation,
    this.forbiddenSysctls = const [],
    required this.fsGroup,
    this.hostIPC,
    this.hostNetwork,
    this.hostPID,
    this.hostPorts = const [],
    this.privileged,
    this.readOnlyRootFilesystem,
    this.requiredDropCapabilities = const [],
    this.runAsGroup,
    required this.runAsUser,
    this.runtimeClass,
    required this.seLinux,
    required this.supplementalGroups,
    this.volumes = const [],
  });

  /// allowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allowPrivilegeEscalation;

  /// AllowedCSIDrivers is an allowlist of inline CSI drivers that must be explicitly set to be embedded within a pod spec. An empty value indicates that any CSI driver can be used for inline ephemeral volumes. This is a beta field, and is only honored if the API server enables the CSIInlineVolume feature gate.
  List<IoK8sApiPolicyV1beta1AllowedCSIDriver> allowedCSIDrivers;

  /// allowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both allowedCapabilities and requiredDropCapabilities.
  List<String> allowedCapabilities;

  /// allowedFlexVolumes is an allowlist of Flexvolumes.  Empty or nil indicates that all Flexvolumes may be used.  This parameter is effective only when the usage of the Flexvolumes is allowed in the \"volumes\" field.
  List<IoK8sApiPolicyV1beta1AllowedFlexVolume> allowedFlexVolumes;

  /// allowedHostPaths is an allowlist of host paths. Empty indicates that all host paths may be used.
  List<IoK8sApiPolicyV1beta1AllowedHostPath> allowedHostPaths;

  /// AllowedProcMountTypes is an allowlist of allowed ProcMountTypes. Empty or nil indicates that only the DefaultProcMountType may be used. This requires the ProcMountType feature flag to be enabled.
  List<String> allowedProcMountTypes;

  /// allowedUnsafeSysctls is a list of explicitly allowed unsafe sysctls, defaults to none. Each entry is either a plain sysctl name or ends in \"*\" in which case it is considered as a prefix of allowed sysctls. Single * means all unsafe sysctls are allowed. Kubelet has to allowlist all allowed unsafe sysctls explicitly to avoid rejection.  Examples: e.g. \"foo/_*\" allows \"foo/bar\", \"foo/baz\", etc. e.g. \"foo.*\" allows \"foo.bar\", \"foo.baz\", etc.
  List<String> allowedUnsafeSysctls;

  /// defaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.  You may not list a capability in both defaultAddCapabilities and requiredDropCapabilities. Capabilities added here are implicitly allowed, and need not be included in the allowedCapabilities list.
  List<String> defaultAddCapabilities;

  /// defaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? defaultAllowPrivilegeEscalation;

  /// forbiddenSysctls is a list of explicitly forbidden sysctls, defaults to none. Each entry is either a plain sysctl name or ends in \"*\" in which case it is considered as a prefix of forbidden sysctls. Single * means all sysctls are forbidden.  Examples: e.g. \"foo/_*\" forbids \"foo/bar\", \"foo/baz\", etc. e.g. \"foo.*\" forbids \"foo.bar\", \"foo.baz\", etc.
  List<String> forbiddenSysctls;

  IoK8sApiPolicyV1beta1FSGroupStrategyOptions fsGroup;

  /// hostIPC determines if the policy allows the use of HostIPC in the pod spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostIPC;

  /// hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostNetwork;

  /// hostPID determines if the policy allows the use of HostPID in the pod spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostPID;

  /// hostPorts determines which host port ranges are allowed to be exposed.
  List<IoK8sApiPolicyV1beta1HostPortRange> hostPorts;

  /// privileged determines if a pod can request to be run as privileged.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? privileged;

  /// readOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnlyRootFilesystem;

  /// requiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.
  List<String> requiredDropCapabilities;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiPolicyV1beta1RunAsGroupStrategyOptions? runAsGroup;

  IoK8sApiPolicyV1beta1RunAsUserStrategyOptions runAsUser;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiPolicyV1beta1RuntimeClassStrategyOptions? runtimeClass;

  IoK8sApiPolicyV1beta1SELinuxStrategyOptions seLinux;

  IoK8sApiPolicyV1beta1SupplementalGroupsStrategyOptions supplementalGroups;

  /// volumes is an allowlist of volume plugins. Empty indicates that no volumes may be used. To allow all volumes you may use '*'.
  List<String> volumes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiPolicyV1beta1PodSecurityPolicySpec &&
          other.allowPrivilegeEscalation == allowPrivilegeEscalation &&
          other.allowedCSIDrivers == allowedCSIDrivers &&
          other.allowedCapabilities == allowedCapabilities &&
          other.allowedFlexVolumes == allowedFlexVolumes &&
          other.allowedHostPaths == allowedHostPaths &&
          other.allowedProcMountTypes == allowedProcMountTypes &&
          other.allowedUnsafeSysctls == allowedUnsafeSysctls &&
          other.defaultAddCapabilities == defaultAddCapabilities &&
          other.defaultAllowPrivilegeEscalation ==
              defaultAllowPrivilegeEscalation &&
          other.forbiddenSysctls == forbiddenSysctls &&
          other.fsGroup == fsGroup &&
          other.hostIPC == hostIPC &&
          other.hostNetwork == hostNetwork &&
          other.hostPID == hostPID &&
          other.hostPorts == hostPorts &&
          other.privileged == privileged &&
          other.readOnlyRootFilesystem == readOnlyRootFilesystem &&
          other.requiredDropCapabilities == requiredDropCapabilities &&
          other.runAsGroup == runAsGroup &&
          other.runAsUser == runAsUser &&
          other.runtimeClass == runtimeClass &&
          other.seLinux == seLinux &&
          other.supplementalGroups == supplementalGroups &&
          other.volumes == volumes;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allowPrivilegeEscalation == null
          ? 0
          : allowPrivilegeEscalation!.hashCode) +
      (allowedCSIDrivers.hashCode) +
      (allowedCapabilities.hashCode) +
      (allowedFlexVolumes.hashCode) +
      (allowedHostPaths.hashCode) +
      (allowedProcMountTypes.hashCode) +
      (allowedUnsafeSysctls.hashCode) +
      (defaultAddCapabilities.hashCode) +
      (defaultAllowPrivilegeEscalation == null
          ? 0
          : defaultAllowPrivilegeEscalation!.hashCode) +
      (forbiddenSysctls.hashCode) +
      (fsGroup.hashCode) +
      (hostIPC == null ? 0 : hostIPC!.hashCode) +
      (hostNetwork == null ? 0 : hostNetwork!.hashCode) +
      (hostPID == null ? 0 : hostPID!.hashCode) +
      (hostPorts.hashCode) +
      (privileged == null ? 0 : privileged!.hashCode) +
      (readOnlyRootFilesystem == null ? 0 : readOnlyRootFilesystem!.hashCode) +
      (requiredDropCapabilities.hashCode) +
      (runAsGroup == null ? 0 : runAsGroup!.hashCode) +
      (runAsUser.hashCode) +
      (runtimeClass == null ? 0 : runtimeClass!.hashCode) +
      (seLinux.hashCode) +
      (supplementalGroups.hashCode) +
      (volumes.hashCode);

  @override
  String toString() =>
      'IoK8sApiPolicyV1beta1PodSecurityPolicySpec[allowPrivilegeEscalation=$allowPrivilegeEscalation, allowedCSIDrivers=$allowedCSIDrivers, allowedCapabilities=$allowedCapabilities, allowedFlexVolumes=$allowedFlexVolumes, allowedHostPaths=$allowedHostPaths, allowedProcMountTypes=$allowedProcMountTypes, allowedUnsafeSysctls=$allowedUnsafeSysctls, defaultAddCapabilities=$defaultAddCapabilities, defaultAllowPrivilegeEscalation=$defaultAllowPrivilegeEscalation, forbiddenSysctls=$forbiddenSysctls, fsGroup=$fsGroup, hostIPC=$hostIPC, hostNetwork=$hostNetwork, hostPID=$hostPID, hostPorts=$hostPorts, privileged=$privileged, readOnlyRootFilesystem=$readOnlyRootFilesystem, requiredDropCapabilities=$requiredDropCapabilities, runAsGroup=$runAsGroup, runAsUser=$runAsUser, runtimeClass=$runtimeClass, seLinux=$seLinux, supplementalGroups=$supplementalGroups, volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (allowPrivilegeEscalation != null) {
      json[r'allowPrivilegeEscalation'] = allowPrivilegeEscalation;
    }
    json[r'allowedCSIDrivers'] = allowedCSIDrivers;
    json[r'allowedCapabilities'] = allowedCapabilities;
    json[r'allowedFlexVolumes'] = allowedFlexVolumes;
    json[r'allowedHostPaths'] = allowedHostPaths;
    json[r'allowedProcMountTypes'] = allowedProcMountTypes;
    json[r'allowedUnsafeSysctls'] = allowedUnsafeSysctls;
    json[r'defaultAddCapabilities'] = defaultAddCapabilities;
    if (defaultAllowPrivilegeEscalation != null) {
      json[r'defaultAllowPrivilegeEscalation'] =
          defaultAllowPrivilegeEscalation;
    }
    json[r'forbiddenSysctls'] = forbiddenSysctls;
    json[r'fsGroup'] = fsGroup;
    if (hostIPC != null) {
      json[r'hostIPC'] = hostIPC;
    }
    if (hostNetwork != null) {
      json[r'hostNetwork'] = hostNetwork;
    }
    if (hostPID != null) {
      json[r'hostPID'] = hostPID;
    }
    json[r'hostPorts'] = hostPorts;
    if (privileged != null) {
      json[r'privileged'] = privileged;
    }
    if (readOnlyRootFilesystem != null) {
      json[r'readOnlyRootFilesystem'] = readOnlyRootFilesystem;
    }
    json[r'requiredDropCapabilities'] = requiredDropCapabilities;
    if (runAsGroup != null) {
      json[r'runAsGroup'] = runAsGroup;
    }
    json[r'runAsUser'] = runAsUser;
    if (runtimeClass != null) {
      json[r'runtimeClass'] = runtimeClass;
    }
    json[r'seLinux'] = seLinux;
    json[r'supplementalGroups'] = supplementalGroups;
    json[r'volumes'] = volumes;
    return json;
  }

  /// Returns a new [IoK8sApiPolicyV1beta1PodSecurityPolicySpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiPolicyV1beta1PodSecurityPolicySpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiPolicyV1beta1PodSecurityPolicySpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiPolicyV1beta1PodSecurityPolicySpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiPolicyV1beta1PodSecurityPolicySpec(
        allowPrivilegeEscalation:
            mapValueOfType<bool>(json, r'allowPrivilegeEscalation'),
        allowedCSIDrivers: IoK8sApiPolicyV1beta1AllowedCSIDriver.listFromJson(
                json[r'allowedCSIDrivers']) ??
            const [],
        allowedCapabilities: json[r'allowedCapabilities'] is List
            ? (json[r'allowedCapabilities'] as List).cast<String>()
            : const [],
        allowedFlexVolumes: IoK8sApiPolicyV1beta1AllowedFlexVolume.listFromJson(
                json[r'allowedFlexVolumes']) ??
            const [],
        allowedHostPaths: IoK8sApiPolicyV1beta1AllowedHostPath.listFromJson(
                json[r'allowedHostPaths']) ??
            const [],
        allowedProcMountTypes: json[r'allowedProcMountTypes'] is List
            ? (json[r'allowedProcMountTypes'] as List).cast<String>()
            : const [],
        allowedUnsafeSysctls: json[r'allowedUnsafeSysctls'] is List
            ? (json[r'allowedUnsafeSysctls'] as List).cast<String>()
            : const [],
        defaultAddCapabilities: json[r'defaultAddCapabilities'] is List
            ? (json[r'defaultAddCapabilities'] as List).cast<String>()
            : const [],
        defaultAllowPrivilegeEscalation:
            mapValueOfType<bool>(json, r'defaultAllowPrivilegeEscalation'),
        forbiddenSysctls: json[r'forbiddenSysctls'] is List
            ? (json[r'forbiddenSysctls'] as List).cast<String>()
            : const [],
        fsGroup: IoK8sApiPolicyV1beta1FSGroupStrategyOptions.fromJson(
            json[r'fsGroup'])!,
        hostIPC: mapValueOfType<bool>(json, r'hostIPC'),
        hostNetwork: mapValueOfType<bool>(json, r'hostNetwork'),
        hostPID: mapValueOfType<bool>(json, r'hostPID'),
        hostPorts: IoK8sApiPolicyV1beta1HostPortRange.listFromJson(
                json[r'hostPorts']) ??
            const [],
        privileged: mapValueOfType<bool>(json, r'privileged'),
        readOnlyRootFilesystem:
            mapValueOfType<bool>(json, r'readOnlyRootFilesystem'),
        requiredDropCapabilities: json[r'requiredDropCapabilities'] is List
            ? (json[r'requiredDropCapabilities'] as List).cast<String>()
            : const [],
        runAsGroup: IoK8sApiPolicyV1beta1RunAsGroupStrategyOptions.fromJson(
            json[r'runAsGroup']),
        runAsUser: IoK8sApiPolicyV1beta1RunAsUserStrategyOptions.fromJson(
            json[r'runAsUser'])!,
        runtimeClass: IoK8sApiPolicyV1beta1RuntimeClassStrategyOptions.fromJson(
            json[r'runtimeClass']),
        seLinux: IoK8sApiPolicyV1beta1SELinuxStrategyOptions.fromJson(
            json[r'seLinux'])!,
        supplementalGroups:
            IoK8sApiPolicyV1beta1SupplementalGroupsStrategyOptions.fromJson(
                json[r'supplementalGroups'])!,
        volumes: json[r'volumes'] is List
            ? (json[r'volumes'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiPolicyV1beta1PodSecurityPolicySpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiPolicyV1beta1PodSecurityPolicySpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiPolicyV1beta1PodSecurityPolicySpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiPolicyV1beta1PodSecurityPolicySpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiPolicyV1beta1PodSecurityPolicySpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiPolicyV1beta1PodSecurityPolicySpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiPolicyV1beta1PodSecurityPolicySpec-objects as value to a dart map
  static Map<String, List<IoK8sApiPolicyV1beta1PodSecurityPolicySpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiPolicyV1beta1PodSecurityPolicySpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiPolicyV1beta1PodSecurityPolicySpec.listFromJson(
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
  static const requiredKeys = <String>{
    'fsGroup',
    'runAsUser',
    'seLinux',
    'supplementalGroups',
  };
}
