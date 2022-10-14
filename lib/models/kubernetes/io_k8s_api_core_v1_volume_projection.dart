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

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map_projection.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_downward_api_projection.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_secret_projection.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service_account_token_projection.dart';

class IoK8sApiCoreV1VolumeProjection {
  /// Returns a new [IoK8sApiCoreV1VolumeProjection] instance.
  IoK8sApiCoreV1VolumeProjection({
    this.configMap,
    this.downwardAPI,
    this.secret,
    this.serviceAccountToken,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ConfigMapProjection? configMap;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1DownwardAPIProjection? downwardAPI;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretProjection? secret;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ServiceAccountTokenProjection? serviceAccountToken;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1VolumeProjection &&
          other.configMap == configMap &&
          other.downwardAPI == downwardAPI &&
          other.secret == secret &&
          other.serviceAccountToken == serviceAccountToken;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (configMap == null ? 0 : configMap!.hashCode) +
      (downwardAPI == null ? 0 : downwardAPI!.hashCode) +
      (secret == null ? 0 : secret!.hashCode) +
      (serviceAccountToken == null ? 0 : serviceAccountToken!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1VolumeProjection[configMap=$configMap, downwardAPI=$downwardAPI, secret=$secret, serviceAccountToken=$serviceAccountToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.configMap != null) {
      json[r'configMap'] = this.configMap;
    } else {
      json[r'configMap'] = null;
    }
    if (this.downwardAPI != null) {
      json[r'downwardAPI'] = this.downwardAPI;
    } else {
      json[r'downwardAPI'] = null;
    }
    if (this.secret != null) {
      json[r'secret'] = this.secret;
    } else {
      json[r'secret'] = null;
    }
    if (this.serviceAccountToken != null) {
      json[r'serviceAccountToken'] = this.serviceAccountToken;
    } else {
      json[r'serviceAccountToken'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1VolumeProjection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1VolumeProjection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1VolumeProjection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1VolumeProjection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1VolumeProjection(
        configMap:
            IoK8sApiCoreV1ConfigMapProjection.fromJson(json[r'configMap']),
        downwardAPI:
            IoK8sApiCoreV1DownwardAPIProjection.fromJson(json[r'downwardAPI']),
        secret: IoK8sApiCoreV1SecretProjection.fromJson(json[r'secret']),
        serviceAccountToken:
            IoK8sApiCoreV1ServiceAccountTokenProjection.fromJson(
                json[r'serviceAccountToken']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1VolumeProjection>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1VolumeProjection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1VolumeProjection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1VolumeProjection> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1VolumeProjection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1VolumeProjection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1VolumeProjection-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1VolumeProjection>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1VolumeProjection>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1VolumeProjection.listFromJson(
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
