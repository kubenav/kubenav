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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map_env_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_secret_env_source.dart';

class IoK8sApiCoreV1EnvFromSource {
  /// Returns a new [IoK8sApiCoreV1EnvFromSource] instance.
  IoK8sApiCoreV1EnvFromSource({
    this.configMapRef,
    this.prefix,
    this.secretRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ConfigMapEnvSource? configMapRef;

  /// An optional identifier to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? prefix;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretEnvSource? secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1EnvFromSource &&
          other.configMapRef == configMapRef &&
          other.prefix == prefix &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (configMapRef == null ? 0 : configMapRef!.hashCode) +
      (prefix == null ? 0 : prefix!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1EnvFromSource[configMapRef=$configMapRef, prefix=$prefix, secretRef=$secretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.configMapRef != null) {
      json[r'configMapRef'] = this.configMapRef;
    } else {
      json[r'configMapRef'] = null;
    }
    if (this.prefix != null) {
      json[r'prefix'] = this.prefix;
    } else {
      json[r'prefix'] = null;
    }
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1EnvFromSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1EnvFromSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1EnvFromSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1EnvFromSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1EnvFromSource(
        configMapRef:
            IoK8sApiCoreV1ConfigMapEnvSource.fromJson(json[r'configMapRef']),
        prefix: mapValueOfType<String>(json, r'prefix'),
        secretRef: IoK8sApiCoreV1SecretEnvSource.fromJson(json[r'secretRef']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1EnvFromSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EnvFromSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EnvFromSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1EnvFromSource> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1EnvFromSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EnvFromSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1EnvFromSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1EnvFromSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1EnvFromSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EnvFromSource.listFromJson(
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
