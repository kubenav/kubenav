//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiFlowcontrolV1beta2Subject {
  /// Returns a new [IoK8sApiFlowcontrolV1beta2Subject] instance.
  IoK8sApiFlowcontrolV1beta2Subject({
    this.group,
    required this.kind,
    this.serviceAccount,
    this.user,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiFlowcontrolV1beta2GroupSubject? group;

  /// `kind` indicates which one of the other fields is non-empty. Required
  String kind;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiFlowcontrolV1beta2ServiceAccountSubject? serviceAccount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiFlowcontrolV1beta2UserSubject? user;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta2Subject &&
          other.group == group &&
          other.kind == kind &&
          other.serviceAccount == serviceAccount &&
          other.user == user;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (group == null ? 0 : group!.hashCode) +
      (kind.hashCode) +
      (serviceAccount == null ? 0 : serviceAccount!.hashCode) +
      (user == null ? 0 : user!.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta2Subject[group=$group, kind=$kind, serviceAccount=$serviceAccount, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (group != null) {
      json[r'group'] = group;
    }
    json[r'kind'] = kind;
    if (serviceAccount != null) {
      json[r'serviceAccount'] = serviceAccount;
    }
    if (user != null) {
      json[r'user'] = user;
    }
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta2Subject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta2Subject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta2Subject[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta2Subject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta2Subject(
        group: IoK8sApiFlowcontrolV1beta2GroupSubject.fromJson(json[r'group']),
        kind: mapValueOfType<String>(json, r'kind')!,
        serviceAccount:
            IoK8sApiFlowcontrolV1beta2ServiceAccountSubject.fromJson(
                json[r'serviceAccount']),
        user: IoK8sApiFlowcontrolV1beta2UserSubject.fromJson(json[r'user']),
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta2Subject>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiFlowcontrolV1beta2Subject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiFlowcontrolV1beta2Subject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta2Subject> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiFlowcontrolV1beta2Subject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta2Subject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta2Subject-objects as value to a dart map
  static Map<String, List<IoK8sApiFlowcontrolV1beta2Subject>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiFlowcontrolV1beta2Subject>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta2Subject.listFromJson(
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
    'kind',
  };
}
