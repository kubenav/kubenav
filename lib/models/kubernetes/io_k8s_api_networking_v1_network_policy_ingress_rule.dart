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

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_network_policy_peer.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_network_policy_port.dart';

class IoK8sApiNetworkingV1NetworkPolicyIngressRule {
  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyIngressRule] instance.
  IoK8sApiNetworkingV1NetworkPolicyIngressRule({
    this.from = const [],
    this.ports = const [],
  });

  /// List of sources which should be able to access the pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all sources (traffic not restricted by source). If this field is present and contains at least one item, this rule allows traffic only if the traffic matches at least one item in the from list.
  List<IoK8sApiNetworkingV1NetworkPolicyPeer> from;

  /// List of ports which should be made accessible on the pods selected for this rule. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
  List<IoK8sApiNetworkingV1NetworkPolicyPort> ports;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1NetworkPolicyIngressRule &&
          other.from == from &&
          other.ports == ports;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (from.hashCode) + (ports.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1NetworkPolicyIngressRule[from=$from, ports=$ports]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'from'] = this.from;
    json[r'ports'] = this.ports;
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyIngressRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1NetworkPolicyIngressRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1NetworkPolicyIngressRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1NetworkPolicyIngressRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1NetworkPolicyIngressRule(
        from:
            IoK8sApiNetworkingV1NetworkPolicyPeer.listFromJson(json[r'from']) ??
                const [],
        ports: IoK8sApiNetworkingV1NetworkPolicyPort.listFromJson(
                json[r'ports']) ??
            const [],
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1NetworkPolicyIngressRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1NetworkPolicyIngressRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiNetworkingV1NetworkPolicyIngressRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1NetworkPolicyIngressRule> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1NetworkPolicyIngressRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiNetworkingV1NetworkPolicyIngressRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1NetworkPolicyIngressRule-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1NetworkPolicyIngressRule>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1NetworkPolicyIngressRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1NetworkPolicyIngressRule.listFromJson(
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
