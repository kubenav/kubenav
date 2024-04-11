//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_status_cause.dart';

class IoK8sApimachineryPkgApisMetaV1StatusDetails {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1StatusDetails] instance.
  IoK8sApimachineryPkgApisMetaV1StatusDetails({
    this.causes = const [],
    this.group,
    this.kind,
    this.name,
    this.retryAfterSeconds,
    this.uid,
  });

  /// The Causes array includes more details associated with the StatusReason failure. Not all StatusReasons may provide detailed causes.
  List<IoK8sApimachineryPkgApisMetaV1StatusCause> causes;

  /// The group attribute of the resource associated with the status StatusReason.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? group;

  /// The kind attribute of the resource associated with the status StatusReason. On some operations may differ from the requested resource Kind. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  /// The name attribute of the resource associated with the status StatusReason (when there is a single name which can be described).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// If specified, the time in seconds before the operation should be retried. Some errors may indicate the client must take an alternate action - for those errors this field may indicate how long to wait before taking the alternate action.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? retryAfterSeconds;

  /// UID of the resource. (when there is a single resource which can be described). More info: http://kubernetes.io/docs/user-guide/identifiers#uids
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
      other is IoK8sApimachineryPkgApisMetaV1StatusDetails &&
          other.causes == causes &&
          other.group == group &&
          other.kind == kind &&
          other.name == name &&
          other.retryAfterSeconds == retryAfterSeconds &&
          other.uid == uid;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (causes.hashCode) +
      (group == null ? 0 : group!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (retryAfterSeconds == null ? 0 : retryAfterSeconds!.hashCode) +
      (uid == null ? 0 : uid!.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1StatusDetails[causes=$causes, group=$group, kind=$kind, name=$name, retryAfterSeconds=$retryAfterSeconds, uid=$uid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'causes'] = this.causes;
    if (this.group != null) {
      json[r'group'] = this.group;
    } else {
      json[r'group'] = null;
    }
    if (this.kind != null) {
      json[r'kind'] = this.kind;
    } else {
      json[r'kind'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.retryAfterSeconds != null) {
      json[r'retryAfterSeconds'] = this.retryAfterSeconds;
    } else {
      json[r'retryAfterSeconds'] = null;
    }
    if (this.uid != null) {
      json[r'uid'] = this.uid;
    } else {
      json[r'uid'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1StatusDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1StatusDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1StatusDetails[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1StatusDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1StatusDetails(
        causes: IoK8sApimachineryPkgApisMetaV1StatusCause.listFromJson(
                json[r'causes']) ??
            const [],
        group: mapValueOfType<String>(json, r'group'),
        kind: mapValueOfType<String>(json, r'kind'),
        name: mapValueOfType<String>(json, r'name'),
        retryAfterSeconds: mapValueOfType<int>(json, r'retryAfterSeconds'),
        uid: mapValueOfType<String>(json, r'uid'),
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1StatusDetails>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1StatusDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgApisMetaV1StatusDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1StatusDetails> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1StatusDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1StatusDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1StatusDetails-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1StatusDetails>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1StatusDetails>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1StatusDetails.listFromJson(
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
