//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiNetworkingV1IngressClassSpec {
  /// Returns a new [IoK8sApiNetworkingV1IngressClassSpec] instance.
  IoK8sApiNetworkingV1IngressClassSpec({
    this.controller,
    this.parameters,
  });

  /// Controller refers to the name of the controller that should handle this class. This allows for different \"flavors\" that are controlled by the same controller. For example, you may have different Parameters for the same implementing controller. This should be specified as a domain-prefixed path no more than 250 characters in length, e.g. \"acme.io/ingress-controller\". This field is immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? controller;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNetworkingV1IngressClassParametersReference? parameters;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1IngressClassSpec &&
          other.controller == controller &&
          other.parameters == parameters;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (controller == null ? 0 : controller!.hashCode) +
      (parameters == null ? 0 : parameters!.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1IngressClassSpec[controller=$controller, parameters=$parameters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (controller != null) {
      json[r'controller'] = controller;
    }
    if (parameters != null) {
      json[r'parameters'] = parameters;
    }
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1IngressClassSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1IngressClassSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1IngressClassSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1IngressClassSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1IngressClassSpec(
        controller: mapValueOfType<String>(json, r'controller'),
        parameters:
            IoK8sApiNetworkingV1IngressClassParametersReference.fromJson(
                json[r'parameters']),
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1IngressClassSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1IngressClassSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1IngressClassSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1IngressClassSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1IngressClassSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiNetworkingV1IngressClassSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1IngressClassSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1IngressClassSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1IngressClassSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IngressClassSpec.listFromJson(
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
