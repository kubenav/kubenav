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
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress_backend.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress_rule.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress_tls.dart';

class IoK8sApiNetworkingV1IngressSpec {
  /// Returns a new [IoK8sApiNetworkingV1IngressSpec] instance.
  IoK8sApiNetworkingV1IngressSpec({
    this.defaultBackend,
    this.ingressClassName,
    this.rules = const [],
    this.tls = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNetworkingV1IngressBackend? defaultBackend;

  /// IngressClassName is the name of an IngressClass cluster resource. Ingress controller implementations use this field to know whether they should be serving this Ingress resource, by a transitive connection (controller -> IngressClass -> Ingress resource). Although the `kubernetes.io/ingress.class` annotation (simple constant name) was never formally defined, it was widely supported by Ingress controllers to create a direct binding between Ingress controller and Ingress resources. Newly created Ingress resources should prefer using the field. However, even though the annotation is officially deprecated, for backwards compatibility reasons, ingress controllers should still honor that annotation if present.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ingressClassName;

  /// A list of host rules used to configure the Ingress. If unspecified, or no rule matches, all traffic is sent to the default backend.
  List<IoK8sApiNetworkingV1IngressRule> rules;

  /// TLS configuration. Currently the Ingress only supports a single TLS port, 443. If multiple members of this list specify different hosts, they will be multiplexed on the same port according to the hostname specified through the SNI TLS extension, if the ingress controller fulfilling the ingress supports SNI.
  List<IoK8sApiNetworkingV1IngressTLS> tls;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1IngressSpec &&
          other.defaultBackend == defaultBackend &&
          other.ingressClassName == ingressClassName &&
          other.rules == rules &&
          other.tls == tls;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (defaultBackend == null ? 0 : defaultBackend!.hashCode) +
      (ingressClassName == null ? 0 : ingressClassName!.hashCode) +
      (rules.hashCode) +
      (tls.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1IngressSpec[defaultBackend=$defaultBackend, ingressClassName=$ingressClassName, rules=$rules, tls=$tls]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultBackend != null) {
      json[r'defaultBackend'] = this.defaultBackend;
    } else {
      json[r'defaultBackend'] = null;
    }
    if (this.ingressClassName != null) {
      json[r'ingressClassName'] = this.ingressClassName;
    } else {
      json[r'ingressClassName'] = null;
    }
    json[r'rules'] = this.rules;
    json[r'tls'] = this.tls;
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1IngressSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1IngressSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1IngressSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1IngressSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1IngressSpec(
        defaultBackend: IoK8sApiNetworkingV1IngressBackend.fromJson(
            json[r'defaultBackend']),
        ingressClassName: mapValueOfType<String>(json, r'ingressClassName'),
        rules: IoK8sApiNetworkingV1IngressRule.listFromJson(json[r'rules']) ??
            const [],
        tls: IoK8sApiNetworkingV1IngressTLS.listFromJson(json[r'tls']) ??
            const [],
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1IngressSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1IngressSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1IngressSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1IngressSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1IngressSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IngressSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1IngressSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1IngressSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1IngressSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1IngressSpec.listFromJson(
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
