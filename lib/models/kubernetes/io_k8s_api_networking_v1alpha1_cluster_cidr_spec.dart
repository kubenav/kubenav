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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_selector.dart';

class IoK8sApiNetworkingV1alpha1ClusterCIDRSpec {
  /// Returns a new [IoK8sApiNetworkingV1alpha1ClusterCIDRSpec] instance.
  IoK8sApiNetworkingV1alpha1ClusterCIDRSpec({
    this.ipv4,
    this.ipv6,
    this.nodeSelector,
    required this.perNodeHostBits,
  });

  /// IPv4 defines an IPv4 IP block in CIDR notation(e.g. \"10.0.0.0/8\"). At least one of IPv4 and IPv6 must be specified. This field is immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ipv4;

  /// IPv6 defines an IPv6 IP block in CIDR notation(e.g. \"fd12:3456:789a:1::/64\"). At least one of IPv4 and IPv6 must be specified. This field is immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ipv6;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1NodeSelector? nodeSelector;

  /// PerNodeHostBits defines the number of host bits to be configured per node. A subnet mask determines how much of the address is used for network bits and host bits. For example an IPv4 address of 192.168.0.0/24, splits the address into 24 bits for the network portion and 8 bits for the host portion. To allocate 256 IPs, set this field to 8 (a /24 mask for IPv4 or a /120 for IPv6). Minimum value is 4 (16 IPs). This field is immutable.
  int perNodeHostBits;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1alpha1ClusterCIDRSpec &&
          other.ipv4 == ipv4 &&
          other.ipv6 == ipv6 &&
          other.nodeSelector == nodeSelector &&
          other.perNodeHostBits == perNodeHostBits;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ipv4 == null ? 0 : ipv4!.hashCode) +
      (ipv6 == null ? 0 : ipv6!.hashCode) +
      (nodeSelector == null ? 0 : nodeSelector!.hashCode) +
      (perNodeHostBits.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1alpha1ClusterCIDRSpec[ipv4=$ipv4, ipv6=$ipv6, nodeSelector=$nodeSelector, perNodeHostBits=$perNodeHostBits]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ipv4 != null) {
      json[r'ipv4'] = this.ipv4;
    } else {
      json[r'ipv4'] = null;
    }
    if (this.ipv6 != null) {
      json[r'ipv6'] = this.ipv6;
    } else {
      json[r'ipv6'] = null;
    }
    if (this.nodeSelector != null) {
      json[r'nodeSelector'] = this.nodeSelector;
    } else {
      json[r'nodeSelector'] = null;
    }
    json[r'perNodeHostBits'] = this.perNodeHostBits;
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1alpha1ClusterCIDRSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1alpha1ClusterCIDRSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1alpha1ClusterCIDRSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1alpha1ClusterCIDRSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1alpha1ClusterCIDRSpec(
        ipv4: mapValueOfType<String>(json, r'ipv4'),
        ipv6: mapValueOfType<String>(json, r'ipv6'),
        nodeSelector:
            IoK8sApiCoreV1NodeSelector.fromJson(json[r'nodeSelector']),
        perNodeHostBits: mapValueOfType<int>(json, r'perNodeHostBits')!,
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1alpha1ClusterCIDRSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1alpha1ClusterCIDRSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1alpha1ClusterCIDRSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1alpha1ClusterCIDRSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1alpha1ClusterCIDRSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiNetworkingV1alpha1ClusterCIDRSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1alpha1ClusterCIDRSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1alpha1ClusterCIDRSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1alpha1ClusterCIDRSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1alpha1ClusterCIDRSpec.listFromJson(
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
    'perNodeHostBits',
  };
}
