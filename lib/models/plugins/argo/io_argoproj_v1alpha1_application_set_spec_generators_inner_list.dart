//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template.dart';

class IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList] instance.
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList({
    this.elements = const [],
    this.elementsYaml,
    this.template,
  });

  List<Object> elements;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? elementsYaml;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplate?
      template;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList &&
          deepEquality.equals(other.elements, elements) &&
          other.elementsYaml == elementsYaml &&
          other.template == template;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (elements.hashCode) +
      (elementsYaml == null ? 0 : elementsYaml!.hashCode) +
      (template == null ? 0 : template!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList[elements=$elements, elementsYaml=$elementsYaml, template=$template]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'elements'] = this.elements;
    if (this.elementsYaml != null) {
      json[r'elementsYaml'] = this.elementsYaml;
    } else {
      json[r'elementsYaml'] = null;
    }
    if (this.template != null) {
      json[r'template'] = this.template;
    } else {
      json[r'template'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList(
        elements: json[r'elements'],
        elementsYaml: mapValueOfType<String>(json, r'elementsYaml'),
        template:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplate
                .fromJson(json[r'template']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList>
      mapFromJson(dynamic json) {
    final map =
        <String, IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList-objects as value to a dart map
  static Map<String,
          List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerList
            .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
