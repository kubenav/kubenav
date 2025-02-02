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

class IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner {
  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner] instance.
  IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner({
    required this.defaultServiceAccount,
    this.namespace,
    required this.server,
  });

  /// DefaultServiceAccount to be used for impersonation during the sync operation
  String defaultServiceAccount;

  /// Namespace specifies the target namespace for the application's resources.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  /// Server specifies the URL of the target cluster's Kubernetes control plane API.
  String server;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner &&
          other.defaultServiceAccount == defaultServiceAccount &&
          other.namespace == namespace &&
          other.server == server;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (defaultServiceAccount.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode) +
      (server.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner[defaultServiceAccount=$defaultServiceAccount, namespace=$namespace, server=$server]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'defaultServiceAccount'] = this.defaultServiceAccount;
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    json[r'server'] = this.server;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner(
        defaultServiceAccount:
            mapValueOfType<String>(json, r'defaultServiceAccount')!,
        namespace: mapValueOfType<String>(json, r'namespace'),
        server: mapValueOfType<String>(json, r'server')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AppProjectSpecDestinationServiceAccountsInner
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'defaultServiceAccount',
    'server',
  };
}
