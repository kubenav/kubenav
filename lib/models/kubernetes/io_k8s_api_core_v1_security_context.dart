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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_capabilities.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_se_linux_options.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_seccomp_profile.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_windows_security_context_options.dart';

class IoK8sApiCoreV1SecurityContext {
  /// Returns a new [IoK8sApiCoreV1SecurityContext] instance.
  IoK8sApiCoreV1SecurityContext({
    this.allowPrivilegeEscalation,
    this.capabilities,
    this.privileged,
    this.procMount,
    this.readOnlyRootFilesystem,
    this.runAsGroup,
    this.runAsNonRoot,
    this.runAsUser,
    this.seLinuxOptions,
    this.seccompProfile,
    this.windowsOptions,
  });

  /// AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process. AllowPrivilegeEscalation is true always when the container is: 1) run as Privileged 2) has CAP_SYS_ADMIN Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? allowPrivilegeEscalation;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Capabilities? capabilities;

  /// Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? privileged;

  /// procMount denotes the type of proc mount to use for the containers. The default is DefaultProcMount which uses the container runtime defaults for readonly paths and masked paths. This requires the ProcMountType feature flag to be enabled. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? procMount;

  /// Whether this container has a read-only root filesystem. Default is false. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnlyRootFilesystem;

  /// The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Note that this field cannot be set when spec.os.name is windows.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? runAsGroup;

  /// Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? runAsNonRoot;

  /// The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Note that this field cannot be set when spec.os.name is windows.
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
      other is IoK8sApiCoreV1SecurityContext &&
          other.allowPrivilegeEscalation == allowPrivilegeEscalation &&
          other.capabilities == capabilities &&
          other.privileged == privileged &&
          other.procMount == procMount &&
          other.readOnlyRootFilesystem == readOnlyRootFilesystem &&
          other.runAsGroup == runAsGroup &&
          other.runAsNonRoot == runAsNonRoot &&
          other.runAsUser == runAsUser &&
          other.seLinuxOptions == seLinuxOptions &&
          other.seccompProfile == seccompProfile &&
          other.windowsOptions == windowsOptions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (allowPrivilegeEscalation == null
          ? 0
          : allowPrivilegeEscalation!.hashCode) +
      (capabilities == null ? 0 : capabilities!.hashCode) +
      (privileged == null ? 0 : privileged!.hashCode) +
      (procMount == null ? 0 : procMount!.hashCode) +
      (readOnlyRootFilesystem == null ? 0 : readOnlyRootFilesystem!.hashCode) +
      (runAsGroup == null ? 0 : runAsGroup!.hashCode) +
      (runAsNonRoot == null ? 0 : runAsNonRoot!.hashCode) +
      (runAsUser == null ? 0 : runAsUser!.hashCode) +
      (seLinuxOptions == null ? 0 : seLinuxOptions!.hashCode) +
      (seccompProfile == null ? 0 : seccompProfile!.hashCode) +
      (windowsOptions == null ? 0 : windowsOptions!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1SecurityContext[allowPrivilegeEscalation=$allowPrivilegeEscalation, capabilities=$capabilities, privileged=$privileged, procMount=$procMount, readOnlyRootFilesystem=$readOnlyRootFilesystem, runAsGroup=$runAsGroup, runAsNonRoot=$runAsNonRoot, runAsUser=$runAsUser, seLinuxOptions=$seLinuxOptions, seccompProfile=$seccompProfile, windowsOptions=$windowsOptions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.allowPrivilegeEscalation != null) {
      json[r'allowPrivilegeEscalation'] = this.allowPrivilegeEscalation;
    } else {
      json[r'allowPrivilegeEscalation'] = null;
    }
    if (this.capabilities != null) {
      json[r'capabilities'] = this.capabilities;
    } else {
      json[r'capabilities'] = null;
    }
    if (this.privileged != null) {
      json[r'privileged'] = this.privileged;
    } else {
      json[r'privileged'] = null;
    }
    if (this.procMount != null) {
      json[r'procMount'] = this.procMount;
    } else {
      json[r'procMount'] = null;
    }
    if (this.readOnlyRootFilesystem != null) {
      json[r'readOnlyRootFilesystem'] = this.readOnlyRootFilesystem;
    } else {
      json[r'readOnlyRootFilesystem'] = null;
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
    if (this.windowsOptions != null) {
      json[r'windowsOptions'] = this.windowsOptions;
    } else {
      json[r'windowsOptions'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1SecurityContext] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1SecurityContext? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1SecurityContext[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1SecurityContext[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1SecurityContext(
        allowPrivilegeEscalation:
            mapValueOfType<bool>(json, r'allowPrivilegeEscalation'),
        capabilities:
            IoK8sApiCoreV1Capabilities.fromJson(json[r'capabilities']),
        privileged: mapValueOfType<bool>(json, r'privileged'),
        procMount: mapValueOfType<String>(json, r'procMount'),
        readOnlyRootFilesystem:
            mapValueOfType<bool>(json, r'readOnlyRootFilesystem'),
        runAsGroup: mapValueOfType<int>(json, r'runAsGroup'),
        runAsNonRoot: mapValueOfType<bool>(json, r'runAsNonRoot'),
        runAsUser: mapValueOfType<int>(json, r'runAsUser'),
        seLinuxOptions:
            IoK8sApiCoreV1SELinuxOptions.fromJson(json[r'seLinuxOptions']),
        seccompProfile:
            IoK8sApiCoreV1SeccompProfile.fromJson(json[r'seccompProfile']),
        windowsOptions: IoK8sApiCoreV1WindowsSecurityContextOptions.fromJson(
            json[r'windowsOptions']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1SecurityContext>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1SecurityContext>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1SecurityContext.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1SecurityContext> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1SecurityContext>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SecurityContext.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1SecurityContext-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1SecurityContext>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1SecurityContext>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SecurityContext.listFromJson(
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
