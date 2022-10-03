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

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map_key_selector.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_field_selector.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_resource_field_selector.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_secret_key_selector.dart';

class IoK8sApiCoreV1EnvVarSource {
  /// Returns a new [IoK8sApiCoreV1EnvVarSource] instance.
  IoK8sApiCoreV1EnvVarSource({
    this.configMapKeyRef,
    this.fieldRef,
    this.resourceFieldRef,
    this.secretKeyRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ConfigMapKeySelector? configMapKeyRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ObjectFieldSelector? fieldRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ResourceFieldSelector? resourceFieldRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecretKeySelector? secretKeyRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1EnvVarSource &&
          other.configMapKeyRef == configMapKeyRef &&
          other.fieldRef == fieldRef &&
          other.resourceFieldRef == resourceFieldRef &&
          other.secretKeyRef == secretKeyRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (configMapKeyRef == null ? 0 : configMapKeyRef!.hashCode) +
      (fieldRef == null ? 0 : fieldRef!.hashCode) +
      (resourceFieldRef == null ? 0 : resourceFieldRef!.hashCode) +
      (secretKeyRef == null ? 0 : secretKeyRef!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1EnvVarSource[configMapKeyRef=$configMapKeyRef, fieldRef=$fieldRef, resourceFieldRef=$resourceFieldRef, secretKeyRef=$secretKeyRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.configMapKeyRef != null) {
      json[r'configMapKeyRef'] = this.configMapKeyRef;
    } else {
      json[r'configMapKeyRef'] = null;
    }
    if (this.fieldRef != null) {
      json[r'fieldRef'] = this.fieldRef;
    } else {
      json[r'fieldRef'] = null;
    }
    if (this.resourceFieldRef != null) {
      json[r'resourceFieldRef'] = this.resourceFieldRef;
    } else {
      json[r'resourceFieldRef'] = null;
    }
    if (this.secretKeyRef != null) {
      json[r'secretKeyRef'] = this.secretKeyRef;
    } else {
      json[r'secretKeyRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1EnvVarSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1EnvVarSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1EnvVarSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1EnvVarSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1EnvVarSource(
        configMapKeyRef: IoK8sApiCoreV1ConfigMapKeySelector.fromJson(
            json[r'configMapKeyRef']),
        fieldRef: IoK8sApiCoreV1ObjectFieldSelector.fromJson(json[r'fieldRef']),
        resourceFieldRef: IoK8sApiCoreV1ResourceFieldSelector.fromJson(
            json[r'resourceFieldRef']),
        secretKeyRef:
            IoK8sApiCoreV1SecretKeySelector.fromJson(json[r'secretKeyRef']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1EnvVarSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EnvVarSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EnvVarSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1EnvVarSource> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1EnvVarSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EnvVarSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1EnvVarSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1EnvVarSource>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1EnvVarSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EnvVarSource.listFromJson(
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
