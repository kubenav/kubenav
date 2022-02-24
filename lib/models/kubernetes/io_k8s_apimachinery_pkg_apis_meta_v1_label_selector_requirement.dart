//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement] instance.
  IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement({
    required this.key,
    required this.operator_,
    this.values = const [],
  });

  /// key is the label key that the selector applies to.
  String key;

  /// operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.
  String operator_;

  /// values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
  List<String> values;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement &&
          other.key == key &&
          other.operator_ == operator_ &&
          other.values == values;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (key.hashCode) + (operator_.hashCode) + (values.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement[key=$key, operator_=$operator_, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'key'] = key;
    json[r'operator'] = operator_;
    json[r'values'] = values;
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement(
        key: mapValueOfType<String>(json, r'key')!,
        operator_: mapValueOfType<String>(json, r'operator')!,
        values: json[r'values'] is List
            ? (json[r'values'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement-objects as value to a dart map
  static Map<String,
          List<IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1LabelSelectorRequirement.listFromJson(
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
    'key',
    'operator',
  };
}
