//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoFluxcdToolkitHelmV2HelmReleaseSpecRollback {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecRollback] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecRollback({
    this.cleanupOnFail,
    this.disableHooks,
    this.disableWait,
    this.disableWaitForJobs,
    this.force,
    this.recreate,
    this.timeout,
  });

  /// CleanupOnFail allows deletion of new resources created during the Helm rollback action when it fails.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? cleanupOnFail;

  /// DisableHooks prevents hooks from running during the Helm rollback action.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableHooks;

  /// DisableWait disables the waiting for resources to be ready after a Helm rollback has been performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableWait;

  /// DisableWaitForJobs disables waiting for jobs to complete after a Helm rollback has been performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableWaitForJobs;

  /// Force forces resource updates through a replacement strategy.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? force;

  /// Recreate performs pod restarts for the resource if applicable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? recreate;

  /// Timeout is the time to wait for any individual Kubernetes operation (like Jobs for hooks) during the performance of a Helm rollback action. Defaults to 'HelmReleaseSpec.Timeout'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecRollback &&
          other.cleanupOnFail == cleanupOnFail &&
          other.disableHooks == disableHooks &&
          other.disableWait == disableWait &&
          other.disableWaitForJobs == disableWaitForJobs &&
          other.force == force &&
          other.recreate == recreate &&
          other.timeout == timeout;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cleanupOnFail == null ? 0 : cleanupOnFail!.hashCode) +
      (disableHooks == null ? 0 : disableHooks!.hashCode) +
      (disableWait == null ? 0 : disableWait!.hashCode) +
      (disableWaitForJobs == null ? 0 : disableWaitForJobs!.hashCode) +
      (force == null ? 0 : force!.hashCode) +
      (recreate == null ? 0 : recreate!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecRollback[cleanupOnFail=$cleanupOnFail, disableHooks=$disableHooks, disableWait=$disableWait, disableWaitForJobs=$disableWaitForJobs, force=$force, recreate=$recreate, timeout=$timeout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cleanupOnFail != null) {
      json[r'cleanupOnFail'] = this.cleanupOnFail;
    } else {
      json[r'cleanupOnFail'] = null;
    }
    if (this.disableHooks != null) {
      json[r'disableHooks'] = this.disableHooks;
    } else {
      json[r'disableHooks'] = null;
    }
    if (this.disableWait != null) {
      json[r'disableWait'] = this.disableWait;
    } else {
      json[r'disableWait'] = null;
    }
    if (this.disableWaitForJobs != null) {
      json[r'disableWaitForJobs'] = this.disableWaitForJobs;
    } else {
      json[r'disableWaitForJobs'] = null;
    }
    if (this.force != null) {
      json[r'force'] = this.force;
    } else {
      json[r'force'] = null;
    }
    if (this.recreate != null) {
      json[r'recreate'] = this.recreate;
    } else {
      json[r'recreate'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecRollback] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecRollback? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecRollback[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecRollback[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecRollback(
        cleanupOnFail: mapValueOfType<bool>(json, r'cleanupOnFail'),
        disableHooks: mapValueOfType<bool>(json, r'disableHooks'),
        disableWait: mapValueOfType<bool>(json, r'disableWait'),
        disableWaitForJobs: mapValueOfType<bool>(json, r'disableWaitForJobs'),
        force: mapValueOfType<bool>(json, r'force'),
        recreate: mapValueOfType<bool>(json, r'recreate'),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecRollback> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecRollback>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecRollback.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseSpecRollback> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2HelmReleaseSpecRollback>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecRollback.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecRollback-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecRollback>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecRollback>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecRollback.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
