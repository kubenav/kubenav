//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2beta2_metric_target.dart';

class IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource {
  /// Returns a new [IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource] instance.
  IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource({
    required this.container,
    required this.name,
    required this.target,
  });

  /// container is the name of the container in the pods of the scaling target
  String container;

  /// name is the name of the resource in question.
  String name;

  IoK8sApiAutoscalingV2beta2MetricTarget target;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource &&
          other.container == container &&
          other.name == name &&
          other.target == target;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (container.hashCode) + (name.hashCode) + (target.hashCode);

  @override
  String toString() =>
      'IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource[container=$container, name=$name, target=$target]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'container'] = container;
    json[r'name'] = name;
    json[r'target'] = target;
    return json;
  }

  /// Returns a new [IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource(
        container: mapValueOfType<String>(json, r'container')!,
        name: mapValueOfType<String>(json, r'name')!,
        target:
            IoK8sApiAutoscalingV2beta2MetricTarget.fromJson(json[r'target'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource-objects as value to a dart map
  static Map<String,
          List<IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAutoscalingV2beta2ContainerResourceMetricSource
            .listFromJson(
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
    'container',
    'name',
    'target',
  };
}
