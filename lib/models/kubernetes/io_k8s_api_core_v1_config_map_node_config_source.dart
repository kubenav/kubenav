//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1ConfigMapNodeConfigSource {
  /// Returns a new [IoK8sApiCoreV1ConfigMapNodeConfigSource] instance.
  IoK8sApiCoreV1ConfigMapNodeConfigSource({
    required this.kubeletConfigKey,
    required this.name,
    required this.namespace,
    this.resourceVersion,
    this.uid,
  });

  /// KubeletConfigKey declares which key of the referenced ConfigMap corresponds to the KubeletConfiguration structure This field is required in all cases.
  String kubeletConfigKey;

  /// Name is the metadata.name of the referenced ConfigMap. This field is required in all cases.
  String name;

  /// Namespace is the metadata.namespace of the referenced ConfigMap. This field is required in all cases.
  String namespace;

  /// ResourceVersion is the metadata.ResourceVersion of the referenced ConfigMap. This field is forbidden in Node.Spec, and required in Node.Status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resourceVersion;

  /// UID is the metadata.UID of the referenced ConfigMap. This field is forbidden in Node.Spec, and required in Node.Status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uid;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ConfigMapNodeConfigSource &&
          other.kubeletConfigKey == kubeletConfigKey &&
          other.name == name &&
          other.namespace == namespace &&
          other.resourceVersion == resourceVersion &&
          other.uid == uid;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (kubeletConfigKey.hashCode) +
      (name.hashCode) +
      (namespace.hashCode) +
      (resourceVersion == null ? 0 : resourceVersion!.hashCode) +
      (uid == null ? 0 : uid!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ConfigMapNodeConfigSource[kubeletConfigKey=$kubeletConfigKey, name=$name, namespace=$namespace, resourceVersion=$resourceVersion, uid=$uid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'kubeletConfigKey'] = kubeletConfigKey;
    json[r'name'] = name;
    json[r'namespace'] = namespace;
    if (resourceVersion != null) {
      json[r'resourceVersion'] = resourceVersion;
    }
    if (uid != null) {
      json[r'uid'] = uid;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ConfigMapNodeConfigSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ConfigMapNodeConfigSource? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ConfigMapNodeConfigSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ConfigMapNodeConfigSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ConfigMapNodeConfigSource(
        kubeletConfigKey: mapValueOfType<String>(json, r'kubeletConfigKey')!,
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace')!,
        resourceVersion: mapValueOfType<String>(json, r'resourceVersion'),
        uid: mapValueOfType<String>(json, r'uid'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ConfigMapNodeConfigSource>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ConfigMapNodeConfigSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ConfigMapNodeConfigSource.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ConfigMapNodeConfigSource> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1ConfigMapNodeConfigSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1ConfigMapNodeConfigSource.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ConfigMapNodeConfigSource-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ConfigMapNodeConfigSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ConfigMapNodeConfigSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ConfigMapNodeConfigSource.listFromJson(
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
    'kubeletConfigKey',
    'name',
    'namespace',
  };
}
