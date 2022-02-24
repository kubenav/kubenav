//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiNetworkingV1IPBlock {
  /// Returns a new [IoK8sApiNetworkingV1IPBlock] instance.
  IoK8sApiNetworkingV1IPBlock({
    required this.cidr,
    this.except = const [],
  });

  /// CIDR is a string representing the IP Block Valid examples are \"192.168.1.1/24\" or \"2001:db9::/64\"
  String cidr;

  /// Except is a slice of CIDRs that should not be included within an IP Block Valid examples are \"192.168.1.1/24\" or \"2001:db9::/64\" Except values will be rejected if they are outside the CIDR range
  List<String> except;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1IPBlock &&
          other.cidr == cidr &&
          other.except == except;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cidr.hashCode) + (except.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1IPBlock[cidr=$cidr, except=$except]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'cidr'] = cidr;
    json[r'except'] = except;
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1IPBlock] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1IPBlock? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1IPBlock[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1IPBlock[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1IPBlock(
        cidr: mapValueOfType<String>(json, r'cidr')!,
        except: json[r'except'] is List
            ? (json[r'except'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1IPBlock>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1IPBlock>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1IPBlock.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1IPBlock> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiNetworkingV1IPBlock>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IPBlock.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1IPBlock-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1IPBlock>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1IPBlock>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IPBlock.listFromJson(
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
    'cidr',
  };
}
