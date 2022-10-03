//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_se_linux_options.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_seccomp_profile.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_sysctl.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_windows_security_context_options.dart';

class IoK8sApiCoreV1PodSecurityContext {
  /// Returns a new [IoK8sApiCoreV1PodSecurityContext] instance.
  IoK8sApiCoreV1PodSecurityContext({
    this.fsGroup,
    this.fsGroupChangePolicy,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seLinuxOptions,
    this.seccompProfile,
    this.supplementalGroups = const [],
    this.sysctls = const [],
    this.windowsOptions,
  });

  /// A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod:  1. The owning GID will be the FSGroup 2. The setgid bit is set (new files created in the volume will be owned by FSGroup) 3. The permission bits are OR'd with rw-rw----  If unset, the Kubelet will not modify the ownership and permissions of any volume. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fsGroup;

  /// fsGroupChangePolicy defines behavior of changing ownership and permission of the volume before being exposed inside Pod. This field will only apply to volume types which support fsGroup based ownership(and permissions). It will have no effect on ephemeral volume types such as: secret, configmaps and emptydir. Valid values are \"OnRootMismatch\" and \"Always\". If not specified, \"Always\" is used. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsGroupChangePolicy;

  /// The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? runAsGroup;

  /// Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? runAsNonRoot;

  /// The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? runAsUser;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SELinuxOptions? seLinuxOptions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SeccompProfile? seccompProfile;

  /// A list of groups applied to the first process run in each container, in addition to the container's primary GID.  If unspecified, no groups will be added to any container. Note that this field cannot be set when spec.os.name is windows.
  List<int> supplementalGroups;

  /// Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported sysctls (by the container runtime) might fail to launch. Note that this field cannot be set when spec.os.name is windows.
  List<IoK8sApiCoreV1Sysctl> sysctls;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1WindowsSecurityContextOptions? windowsOptions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodSecurityContext &&
          other.fsGroup == fsGroup &&
          other.fsGroupChangePolicy == fsGroupChangePolicy &&
          other.runAsGroup == runAsGroup &&
          other.runAsNonRoot == runAsNonRoot &&
          other.runAsUser == runAsUser &&
          other.seLinuxOptions == seLinuxOptions &&
          other.seccompProfile == seccompProfile &&
          other.supplementalGroups == supplementalGroups &&
          other.sysctls == sysctls &&
          other.windowsOptions == windowsOptions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fsGroup == null ? 0 : fsGroup!.hashCode) +
      (fsGroupChangePolicy == null ? 0 : fsGroupChangePolicy!.hashCode) +
      (runAsGroup == null ? 0 : runAsGroup!.hashCode) +
      (runAsNonRoot == null ? 0 : runAsNonRoot!.hashCode) +
      (runAsUser == null ? 0 : runAsUser!.hashCode) +
      (seLinuxOptions == null ? 0 : seLinuxOptions!.hashCode) +
      (seccompProfile == null ? 0 : seccompProfile!.hashCode) +
      (supplementalGroups.hashCode) +
      (sysctls.hashCode) +
      (windowsOptions == null ? 0 : windowsOptions!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodSecurityContext[fsGroup=$fsGroup, fsGroupChangePolicy=$fsGroupChangePolicy, runAsGroup=$runAsGroup, runAsNonRoot=$runAsNonRoot, runAsUser=$runAsUser, seLinuxOptions=$seLinuxOptions, seccompProfile=$seccompProfile, supplementalGroups=$supplementalGroups, sysctls=$sysctls, windowsOptions=$windowsOptions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fsGroup != null) {
      json[r'fsGroup'] = this.fsGroup;
    } else {
      json[r'fsGroup'] = null;
    }
    if (this.fsGroupChangePolicy != null) {
      json[r'fsGroupChangePolicy'] = this.fsGroupChangePolicy;
    } else {
      json[r'fsGroupChangePolicy'] = null;
    }
    if (this.runAsGroup != null) {
      json[r'runAsGroup'] = this.runAsGroup;
    } else {
      json[r'runAsGroup'] = null;
    }
    if (this.runAsNonRoot != null) {
      json[r'runAsNonRoot'] = this.runAsNonRoot;
    } else {
      json[r'runAsNonRoot'] = null;
    }
    if (this.runAsUser != null) {
      json[r'runAsUser'] = this.runAsUser;
    } else {
      json[r'runAsUser'] = null;
    }
    if (this.seLinuxOptions != null) {
      json[r'seLinuxOptions'] = this.seLinuxOptions;
    } else {
      json[r'seLinuxOptions'] = null;
    }
    if (this.seccompProfile != null) {
      json[r'seccompProfile'] = this.seccompProfile;
    } else {
      json[r'seccompProfile'] = null;
    }
    json[r'supplementalGroups'] = this.supplementalGroups;
    json[r'sysctls'] = this.sysctls;
    if (this.windowsOptions != null) {
      json[r'windowsOptions'] = this.windowsOptions;
    } else {
      json[r'windowsOptions'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodSecurityContext] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodSecurityContext? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodSecurityContext[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodSecurityContext[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodSecurityContext(
        fsGroup: mapValueOfType<int>(json, r'fsGroup'),
        fsGroupChangePolicy:
            mapValueOfType<String>(json, r'fsGroupChangePolicy'),
        runAsGroup: mapValueOfType<int>(json, r'runAsGroup'),
        runAsNonRoot: mapValueOfType<bool>(json, r'runAsNonRoot'),
        runAsUser: mapValueOfType<int>(json, r'runAsUser'),
        seLinuxOptions:
            IoK8sApiCoreV1SELinuxOptions.fromJson(json[r'seLinuxOptions']),
        seccompProfile:
            IoK8sApiCoreV1SeccompProfile.fromJson(json[r'seccompProfile']),
        supplementalGroups: json[r'supplementalGroups'] is List
            ? (json[r'supplementalGroups'] as List).cast<int>()
            : const [],
        sysctls:
            IoK8sApiCoreV1Sysctl.listFromJson(json[r'sysctls']) ?? const [],
        windowsOptions: IoK8sApiCoreV1WindowsSecurityContextOptions.fromJson(
            json[r'windowsOptions']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodSecurityContext>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodSecurityContext>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodSecurityContext.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodSecurityContext> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1PodSecurityContext>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodSecurityContext.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodSecurityContext-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodSecurityContext>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodSecurityContext>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodSecurityContext.listFromJson(
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
