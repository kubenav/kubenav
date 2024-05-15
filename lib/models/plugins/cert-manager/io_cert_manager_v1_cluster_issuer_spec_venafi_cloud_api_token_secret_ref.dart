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

class IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef] instance.
  IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef({
    this.key,
    required this.name,
  });

  /// The key of the entry in the Secret resource's `data` field to be used. Some instances of this field may be defaulted, in others it may be required.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// Name of the resource being referred to. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
  String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef &&
          other.key == key &&
          other.name == name;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (key == null ? 0 : key!.hashCode) + (name.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef[key=$key, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef(
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef-objects as value to a dart map
  static Map<String,
          List<IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef
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
    'name',
  };
}
