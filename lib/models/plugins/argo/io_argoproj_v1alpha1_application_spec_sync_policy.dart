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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_sync_policy_automated.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_sync_policy_managed_namespace_metadata.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_spec_sync_policy_retry.dart';

class IoArgoprojV1alpha1ApplicationSpecSyncPolicy {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecSyncPolicy] instance.
  IoArgoprojV1alpha1ApplicationSpecSyncPolicy({
    this.automated,
    this.managedNamespaceMetadata,
    this.retry,
    this.syncOptions = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated? automated;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSpecSyncPolicyManagedNamespaceMetadata?
      managedNamespaceMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry? retry;

  /// Options allow you to specify whole app sync-options
  List<String> syncOptions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSpecSyncPolicy &&
          other.automated == automated &&
          other.managedNamespaceMetadata == managedNamespaceMetadata &&
          other.retry == retry &&
          deepEquality.equals(other.syncOptions, syncOptions);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (automated == null ? 0 : automated!.hashCode) +
      (managedNamespaceMetadata == null
          ? 0
          : managedNamespaceMetadata!.hashCode) +
      (retry == null ? 0 : retry!.hashCode) +
      (syncOptions.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSpecSyncPolicy[automated=$automated, managedNamespaceMetadata=$managedNamespaceMetadata, retry=$retry, syncOptions=$syncOptions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.automated != null) {
      json[r'automated'] = this.automated;
    } else {
      json[r'automated'] = null;
    }
    if (this.managedNamespaceMetadata != null) {
      json[r'managedNamespaceMetadata'] = this.managedNamespaceMetadata;
    } else {
      json[r'managedNamespaceMetadata'] = null;
    }
    if (this.retry != null) {
      json[r'retry'] = this.retry;
    } else {
      json[r'retry'] = null;
    }
    json[r'syncOptions'] = this.syncOptions;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSpecSyncPolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSpecSyncPolicy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSpecSyncPolicy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSpecSyncPolicy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSpecSyncPolicy(
        automated:
            IoArgoprojV1alpha1ApplicationSpecSyncPolicyAutomated.fromJson(
                json[r'automated']),
        managedNamespaceMetadata:
            IoArgoprojV1alpha1ApplicationSpecSyncPolicyManagedNamespaceMetadata
                .fromJson(json[r'managedNamespaceMetadata']),
        retry: IoArgoprojV1alpha1ApplicationSpecSyncPolicyRetry.fromJson(
            json[r'retry']),
        syncOptions: json[r'syncOptions'] is Iterable
            ? (json[r'syncOptions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSpecSyncPolicy> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSpecSyncPolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ApplicationSpecSyncPolicy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSpecSyncPolicy> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSpecSyncPolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSpecSyncPolicy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSpecSyncPolicy-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSpecSyncPolicy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ApplicationSpecSyncPolicy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSpecSyncPolicy.listFromJson(
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
