//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1PodDNSConfig {
  /// Returns a new [IoK8sApiCoreV1PodDNSConfig] instance.
  IoK8sApiCoreV1PodDNSConfig({
    this.nameservers = const [],
    this.options = const [],
    this.searches = const [],
  });

  /// A list of DNS name server IP addresses. This will be appended to the base nameservers generated from DNSPolicy. Duplicated nameservers will be removed.
  List<String> nameservers;

  /// A list of DNS resolver options. This will be merged with the base options generated from DNSPolicy. Duplicated entries will be removed. Resolution options given in Options will override those that appear in the base DNSPolicy.
  List<IoK8sApiCoreV1PodDNSConfigOption> options;

  /// A list of DNS search domains for host-name lookup. This will be appended to the base search paths generated from DNSPolicy. Duplicated search paths will be removed.
  List<String> searches;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodDNSConfig &&
          other.nameservers == nameservers &&
          other.options == options &&
          other.searches == searches;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (nameservers.hashCode) + (options.hashCode) + (searches.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodDNSConfig[nameservers=$nameservers, options=$options, searches=$searches]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'nameservers'] = nameservers;
    json[r'options'] = options;
    json[r'searches'] = searches;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodDNSConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodDNSConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodDNSConfig[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodDNSConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodDNSConfig(
        nameservers: json[r'nameservers'] is List
            ? (json[r'nameservers'] as List).cast<String>()
            : const [],
        options:
            IoK8sApiCoreV1PodDNSConfigOption.listFromJson(json[r'options']) ??
                const [],
        searches: json[r'searches'] is List
            ? (json[r'searches'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodDNSConfig>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodDNSConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodDNSConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodDNSConfig> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PodDNSConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodDNSConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodDNSConfig-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodDNSConfig>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodDNSConfig>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodDNSConfig.listFromJson(
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
