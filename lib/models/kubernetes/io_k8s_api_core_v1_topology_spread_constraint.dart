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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';

class IoK8sApiCoreV1TopologySpreadConstraint {
  /// Returns a new [IoK8sApiCoreV1TopologySpreadConstraint] instance.
  IoK8sApiCoreV1TopologySpreadConstraint({
    this.labelSelector,
    this.matchLabelKeys = const [],
    required this.maxSkew,
    this.minDomains,
    this.nodeAffinityPolicy,
    this.nodeTaintsPolicy,
    required this.topologyKey,
    required this.whenUnsatisfiable,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? labelSelector;

  /// MatchLabelKeys is a set of pod label keys to select the pods over which spreading will be calculated. The keys are used to lookup values from the incoming pod labels, those key-value labels are ANDed with labelSelector to select the group of existing pods over which spreading will be calculated for the incoming pod. Keys that don't exist in the incoming pod labels will be ignored. A null or empty list means only match against labelSelector.
  List<String> matchLabelKeys;

  /// MaxSkew describes the degree to which pods may be unevenly distributed. When `whenUnsatisfiable=DoNotSchedule`, it is the maximum permitted difference between the number of matching pods in the target topology and the global minimum. The global minimum is the minimum number of matching pods in an eligible domain or zero if the number of eligible domains is less than MinDomains. For example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector spread as 2/2/1: In this case, the global minimum is 1. | zone1 | zone2 | zone3 | |  P P  |  P P  |   P   | - if MaxSkew is 1, incoming pod can only be scheduled to zone3 to become 2/2/2; scheduling it onto zone1(zone2) would make the ActualSkew(3-1) on zone1(zone2) violate MaxSkew(1). - if MaxSkew is 2, incoming pod can be scheduled onto any zone. When `whenUnsatisfiable=ScheduleAnyway`, it is used to give higher precedence to topologies that satisfy it. It's a required field. Default value is 1 and 0 is not allowed.
  int maxSkew;

  /// MinDomains indicates a minimum number of eligible domains. When the number of eligible domains with matching topology keys is less than minDomains, Pod Topology Spread treats \"global minimum\" as 0, and then the calculation of Skew is performed. And when the number of eligible domains with matching topology keys equals or greater than minDomains, this value has no effect on scheduling. As a result, when the number of eligible domains is less than minDomains, scheduler won't schedule more than maxSkew Pods to those domains. If value is nil, the constraint behaves as if MinDomains is equal to 1. Valid values are integers greater than 0. When value is not nil, WhenUnsatisfiable must be DoNotSchedule.  For example, in a 3-zone cluster, MaxSkew is set to 2, MinDomains is set to 5 and pods with the same labelSelector spread as 2/2/2: | zone1 | zone2 | zone3 | |  P P  |  P P  |  P P  | The number of domains is less than 5(MinDomains), so \"global minimum\" is treated as 0. In this situation, new pod with the same labelSelector cannot be scheduled, because computed skew will be 3(3 - 0) if new Pod is scheduled to any of the three zones, it will violate MaxSkew.  This is a beta field and requires the MinDomainsInPodTopologySpread feature gate to be enabled (enabled by default).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minDomains;

  /// NodeAffinityPolicy indicates how we will treat Pod's nodeAffinity/nodeSelector when calculating pod topology spread skew. Options are: - Honor: only nodes matching nodeAffinity/nodeSelector are included in the calculations. - Ignore: nodeAffinity/nodeSelector are ignored. All nodes are included in the calculations.  If this value is nil, the behavior is equivalent to the Honor policy. This is a alpha-level feature enabled by the NodeInclusionPolicyInPodTopologySpread feature flag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nodeAffinityPolicy;

  /// NodeTaintsPolicy indicates how we will treat node taints when calculating pod topology spread skew. Options are: - Honor: nodes without taints, along with tainted nodes for which the incoming pod has a toleration, are included. - Ignore: node taints are ignored. All nodes are included.  If this value is nil, the behavior is equivalent to the Ignore policy. This is a alpha-level feature enabled by the NodeInclusionPolicyInPodTopologySpread feature flag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nodeTaintsPolicy;

  /// TopologyKey is the key of node labels. Nodes that have a label with this key and identical values are considered to be in the same topology. We consider each <key, value> as a \"bucket\", and try to put balanced number of pods into each bucket. We define a domain as a particular instance of a topology. Also, we define an eligible domain as a domain whose nodes meet the requirements of nodeAffinityPolicy and nodeTaintsPolicy. e.g. If TopologyKey is \"kubernetes.io/hostname\", each Node is a domain of that topology. And, if TopologyKey is \"topology.kubernetes.io/zone\", each zone is a domain of that topology. It's a required field.
  String topologyKey;

  /// WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread constraint. - DoNotSchedule (default) tells the scheduler not to schedule it. - ScheduleAnyway tells the scheduler to schedule the pod in any location,   but giving higher precedence to topologies that would help reduce the   skew. A constraint is considered \"Unsatisfiable\" for an incoming pod if and only if every possible node assignment for that pod would violate \"MaxSkew\" on some topology. For example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector spread as 3/1/1: | zone1 | zone2 | zone3 | | P P P |   P   |   P   | If WhenUnsatisfiable is set to DoNotSchedule, incoming pod can only be scheduled to zone2(zone3) to become 3/2/1(3/1/2) as ActualSkew(2-1) on zone2(zone3) satisfies MaxSkew(1). In other words, the cluster can still be imbalanced, but scheduler won't make it *more* imbalanced. It's a required field.
  String whenUnsatisfiable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1TopologySpreadConstraint &&
          other.labelSelector == labelSelector &&
          other.matchLabelKeys == matchLabelKeys &&
          other.maxSkew == maxSkew &&
          other.minDomains == minDomains &&
          other.nodeAffinityPolicy == nodeAffinityPolicy &&
          other.nodeTaintsPolicy == nodeTaintsPolicy &&
          other.topologyKey == topologyKey &&
          other.whenUnsatisfiable == whenUnsatisfiable;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (labelSelector == null ? 0 : labelSelector!.hashCode) +
      (matchLabelKeys.hashCode) +
      (maxSkew.hashCode) +
      (minDomains == null ? 0 : minDomains!.hashCode) +
      (nodeAffinityPolicy == null ? 0 : nodeAffinityPolicy!.hashCode) +
      (nodeTaintsPolicy == null ? 0 : nodeTaintsPolicy!.hashCode) +
      (topologyKey.hashCode) +
      (whenUnsatisfiable.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1TopologySpreadConstraint[labelSelector=$labelSelector, matchLabelKeys=$matchLabelKeys, maxSkew=$maxSkew, minDomains=$minDomains, nodeAffinityPolicy=$nodeAffinityPolicy, nodeTaintsPolicy=$nodeTaintsPolicy, topologyKey=$topologyKey, whenUnsatisfiable=$whenUnsatisfiable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.labelSelector != null) {
      json[r'labelSelector'] = this.labelSelector;
    } else {
      json[r'labelSelector'] = null;
    }
    json[r'matchLabelKeys'] = this.matchLabelKeys;
    json[r'maxSkew'] = this.maxSkew;
    if (this.minDomains != null) {
      json[r'minDomains'] = this.minDomains;
    } else {
      json[r'minDomains'] = null;
    }
    if (this.nodeAffinityPolicy != null) {
      json[r'nodeAffinityPolicy'] = this.nodeAffinityPolicy;
    } else {
      json[r'nodeAffinityPolicy'] = null;
    }
    if (this.nodeTaintsPolicy != null) {
      json[r'nodeTaintsPolicy'] = this.nodeTaintsPolicy;
    } else {
      json[r'nodeTaintsPolicy'] = null;
    }
    json[r'topologyKey'] = this.topologyKey;
    json[r'whenUnsatisfiable'] = this.whenUnsatisfiable;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1TopologySpreadConstraint] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1TopologySpreadConstraint? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1TopologySpreadConstraint[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1TopologySpreadConstraint[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1TopologySpreadConstraint(
        labelSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'labelSelector']),
        matchLabelKeys: json[r'matchLabelKeys'] is List
            ? (json[r'matchLabelKeys'] as List).cast<String>()
            : const [],
        maxSkew: mapValueOfType<int>(json, r'maxSkew')!,
        minDomains: mapValueOfType<int>(json, r'minDomains'),
        nodeAffinityPolicy: mapValueOfType<String>(json, r'nodeAffinityPolicy'),
        nodeTaintsPolicy: mapValueOfType<String>(json, r'nodeTaintsPolicy'),
        topologyKey: mapValueOfType<String>(json, r'topologyKey')!,
        whenUnsatisfiable: mapValueOfType<String>(json, r'whenUnsatisfiable')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1TopologySpreadConstraint>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1TopologySpreadConstraint>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1TopologySpreadConstraint.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1TopologySpreadConstraint> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1TopologySpreadConstraint>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1TopologySpreadConstraint.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1TopologySpreadConstraint-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1TopologySpreadConstraint>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1TopologySpreadConstraint>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1TopologySpreadConstraint.listFromJson(
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
    'maxSkew',
    'topologyKey',
    'whenUnsatisfiable',
  };
}
