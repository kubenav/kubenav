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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';

class IoK8sApiCoreV1PodAffinityTerm {
  /// Returns a new [IoK8sApiCoreV1PodAffinityTerm] instance.
  IoK8sApiCoreV1PodAffinityTerm({
    this.labelSelector,
    this.namespaceSelector,
    this.namespaces = const [],
    required this.topologyKey,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? labelSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? namespaceSelector;

  /// namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector. null or empty namespaces list and null namespaceSelector means \"this pod's namespace\".
  List<String> namespaces;

  /// This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed.
  String topologyKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodAffinityTerm &&
          other.labelSelector == labelSelector &&
          other.namespaceSelector == namespaceSelector &&
          other.namespaces == namespaces &&
          other.topologyKey == topologyKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (labelSelector == null ? 0 : labelSelector!.hashCode) +
      (namespaceSelector == null ? 0 : namespaceSelector!.hashCode) +
      (namespaces.hashCode) +
      (topologyKey.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodAffinityTerm[labelSelector=$labelSelector, namespaceSelector=$namespaceSelector, namespaces=$namespaces, topologyKey=$topologyKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.labelSelector != null) {
      json[r'labelSelector'] = this.labelSelector;
    } else {
      json[r'labelSelector'] = null;
    }
    if (this.namespaceSelector != null) {
      json[r'namespaceSelector'] = this.namespaceSelector;
    } else {
      json[r'namespaceSelector'] = null;
    }
    json[r'namespaces'] = this.namespaces;
    json[r'topologyKey'] = this.topologyKey;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodAffinityTerm] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodAffinityTerm? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodAffinityTerm[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodAffinityTerm[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodAffinityTerm(
        labelSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'labelSelector']),
        namespaceSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'namespaceSelector']),
        namespaces: json[r'namespaces'] is List
            ? (json[r'namespaces'] as List).cast<String>()
            : const [],
        topologyKey: mapValueOfType<String>(json, r'topologyKey')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodAffinityTerm>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodAffinityTerm>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodAffinityTerm.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodAffinityTerm> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PodAffinityTerm>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodAffinityTerm.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodAffinityTerm-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodAffinityTerm>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodAffinityTerm>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodAffinityTerm.listFromJson(
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
    'topologyKey',
  };
}
