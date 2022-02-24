//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiNetworkingV1NetworkPolicyEgressRule {
  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyEgressRule] instance.
  IoK8sApiNetworkingV1NetworkPolicyEgressRule({
    this.ports = const [],
    this.to = const [],
  });

  /// List of destination ports for outgoing traffic. Each item in this list is combined using a logical OR. If this field is empty or missing, this rule matches all ports (traffic not restricted by port). If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list.
  List<IoK8sApiNetworkingV1NetworkPolicyPort> ports;

  /// List of destinations for outgoing traffic of pods selected for this rule. Items in this list are combined using a logical OR operation. If this field is empty or missing, this rule matches all destinations (traffic not restricted by destination). If this field is present and contains at least one item, this rule allows traffic only if the traffic matches at least one item in the to list.
  List<IoK8sApiNetworkingV1NetworkPolicyPeer> to;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1NetworkPolicyEgressRule &&
          other.ports == ports &&
          other.to == to;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ports.hashCode) + (to.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1NetworkPolicyEgressRule[ports=$ports, to=$to]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'ports'] = ports;
    json[r'to'] = to;
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyEgressRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1NetworkPolicyEgressRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1NetworkPolicyEgressRule[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1NetworkPolicyEgressRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1NetworkPolicyEgressRule(
        ports: IoK8sApiNetworkingV1NetworkPolicyPort.listFromJson(
                json[r'ports']) ??
            const [],
        to: IoK8sApiNetworkingV1NetworkPolicyPeer.listFromJson(json[r'to']) ??
            const [],
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1NetworkPolicyEgressRule>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1NetworkPolicyEgressRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1NetworkPolicyEgressRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1NetworkPolicyEgressRule> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1NetworkPolicyEgressRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiNetworkingV1NetworkPolicyEgressRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1NetworkPolicyEgressRule-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1NetworkPolicyEgressRule>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1NetworkPolicyEgressRule>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1NetworkPolicyEgressRule.listFromJson(
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
