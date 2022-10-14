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

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ip_block.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';

class IoK8sApiNetworkingV1NetworkPolicyPeer {
  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyPeer] instance.
  IoK8sApiNetworkingV1NetworkPolicyPeer({
    this.ipBlock,
    this.namespaceSelector,
    this.podSelector,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiNetworkingV1IPBlock? ipBlock;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? namespaceSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? podSelector;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1NetworkPolicyPeer &&
          other.ipBlock == ipBlock &&
          other.namespaceSelector == namespaceSelector &&
          other.podSelector == podSelector;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ipBlock == null ? 0 : ipBlock!.hashCode) +
      (namespaceSelector == null ? 0 : namespaceSelector!.hashCode) +
      (podSelector == null ? 0 : podSelector!.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1NetworkPolicyPeer[ipBlock=$ipBlock, namespaceSelector=$namespaceSelector, podSelector=$podSelector]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ipBlock != null) {
      json[r'ipBlock'] = this.ipBlock;
    } else {
      json[r'ipBlock'] = null;
    }
    if (this.namespaceSelector != null) {
      json[r'namespaceSelector'] = this.namespaceSelector;
    } else {
      json[r'namespaceSelector'] = null;
    }
    if (this.podSelector != null) {
      json[r'podSelector'] = this.podSelector;
    } else {
      json[r'podSelector'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1NetworkPolicyPeer] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1NetworkPolicyPeer? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1NetworkPolicyPeer[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1NetworkPolicyPeer[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1NetworkPolicyPeer(
        ipBlock: IoK8sApiNetworkingV1IPBlock.fromJson(json[r'ipBlock']),
        namespaceSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'namespaceSelector']),
        podSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'podSelector']),
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1NetworkPolicyPeer>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1NetworkPolicyPeer>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1NetworkPolicyPeer.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1NetworkPolicyPeer> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1NetworkPolicyPeer>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiNetworkingV1NetworkPolicyPeer.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1NetworkPolicyPeer-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1NetworkPolicyPeer>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1NetworkPolicyPeer>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1NetworkPolicyPeer.listFromJson(
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
