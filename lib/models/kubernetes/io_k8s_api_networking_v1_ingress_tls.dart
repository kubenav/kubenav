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

class IoK8sApiNetworkingV1IngressTLS {
  /// Returns a new [IoK8sApiNetworkingV1IngressTLS] instance.
  IoK8sApiNetworkingV1IngressTLS({
    this.hosts = const [],
    this.secretName,
  });

  /// Hosts are a list of hosts included in the TLS certificate. The values in this list must match the name/s used in the tlsSecret. Defaults to the wildcard host setting for the loadbalancer controller fulfilling this Ingress, if left unspecified.
  List<String> hosts;

  /// SecretName is the name of the secret used to terminate TLS traffic on port 443. Field is left optional to allow TLS routing based on SNI hostname alone. If the SNI host in a listener conflicts with the \"Host\" header field used by an IngressRule, the SNI host is used for termination and value of the Host header is used for routing.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? secretName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1IngressTLS &&
          other.hosts == hosts &&
          other.secretName == secretName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (hosts.hashCode) + (secretName == null ? 0 : secretName!.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1IngressTLS[hosts=$hosts, secretName=$secretName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'hosts'] = this.hosts;
    if (this.secretName != null) {
      json[r'secretName'] = this.secretName;
    } else {
      json[r'secretName'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1IngressTLS] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1IngressTLS? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1IngressTLS[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1IngressTLS[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1IngressTLS(
        hosts: json[r'hosts'] is List
            ? (json[r'hosts'] as List).cast<String>()
            : const [],
        secretName: mapValueOfType<String>(json, r'secretName'),
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1IngressTLS>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1IngressTLS>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1IngressTLS.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1IngressTLS> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiNetworkingV1IngressTLS>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IngressTLS.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1IngressTLS-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1IngressTLS>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1IngressTLS>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IngressTLS.listFromJson(
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
