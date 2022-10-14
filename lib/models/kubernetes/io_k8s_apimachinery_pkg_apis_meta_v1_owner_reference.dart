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

class IoK8sApimachineryPkgApisMetaV1OwnerReference {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1OwnerReference] instance.
  IoK8sApimachineryPkgApisMetaV1OwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });

  /// API version of the referent.
  String apiVersion;

  /// If true, AND if the owner has the \"foregroundDeletion\" finalizer, then the owner cannot be deleted from the key-value store until this reference is removed. See https://kubernetes.io/docs/concepts/architecture/garbage-collection/#foreground-deletion for how the garbage collector interacts with this field and enforces the foreground deletion. Defaults to false. To set this field, a user needs \"delete\" permission of the owner, otherwise 422 (Unprocessable Entity) will be returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? blockOwnerDeletion;

  /// If true, this reference points to the managing controller.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? controller;

  /// Kind of the referent. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  String kind;

  /// Name of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#names
  String name;

  /// UID of the referent. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
  String uid;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1OwnerReference &&
          other.apiVersion == apiVersion &&
          other.blockOwnerDeletion == blockOwnerDeletion &&
          other.controller == controller &&
          other.kind == kind &&
          other.name == name &&
          other.uid == uid;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion.hashCode) +
      (blockOwnerDeletion == null ? 0 : blockOwnerDeletion!.hashCode) +
      (controller == null ? 0 : controller!.hashCode) +
      (kind.hashCode) +
      (name.hashCode) +
      (uid.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1OwnerReference[apiVersion=$apiVersion, blockOwnerDeletion=$blockOwnerDeletion, controller=$controller, kind=$kind, name=$name, uid=$uid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiVersion'] = this.apiVersion;
    if (this.blockOwnerDeletion != null) {
      json[r'blockOwnerDeletion'] = this.blockOwnerDeletion;
    } else {
      json[r'blockOwnerDeletion'] = null;
    }
    if (this.controller != null) {
      json[r'controller'] = this.controller;
    } else {
      json[r'controller'] = null;
    }
    json[r'kind'] = this.kind;
    json[r'name'] = this.name;
    json[r'uid'] = this.uid;
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1OwnerReference] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1OwnerReference? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1OwnerReference[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1OwnerReference[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1OwnerReference(
        apiVersion: mapValueOfType<String>(json, r'apiVersion')!,
        blockOwnerDeletion: mapValueOfType<bool>(json, r'blockOwnerDeletion'),
        controller: mapValueOfType<bool>(json, r'controller'),
        kind: mapValueOfType<String>(json, r'kind')!,
        name: mapValueOfType<String>(json, r'name')!,
        uid: mapValueOfType<String>(json, r'uid')!,
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1OwnerReference>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1OwnerReference>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApimachineryPkgApisMetaV1OwnerReference.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1OwnerReference> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1OwnerReference>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1OwnerReference.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1OwnerReference-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1OwnerReference>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1OwnerReference>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1OwnerReference.listFromJson(
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
    'apiVersion',
    'kind',
    'name',
    'uid',
  };
}
