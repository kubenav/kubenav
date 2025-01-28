//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, require_trailing_commas, avoid_function_literals_in_foreach_calls
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_args_inner.dart';

class IoArgoprojV1alpha1ExperimentSpecAnalysesInner {
  /// Returns a new [IoArgoprojV1alpha1ExperimentSpecAnalysesInner] instance.
  IoArgoprojV1alpha1ExperimentSpecAnalysesInner({
    this.args = const [],
    this.clusterScope,
    required this.name,
    this.requiredForCompletion,
    required this.templateName,
  });

  List<IoArgoprojV1alpha1AnalysisRunSpecArgsInner> args;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? clusterScope;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? requiredForCompletion;

  String templateName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ExperimentSpecAnalysesInner &&
          deepEquality.equals(other.args, args) &&
          other.clusterScope == clusterScope &&
          other.name == name &&
          other.requiredForCompletion == requiredForCompletion &&
          other.templateName == templateName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (args.hashCode) +
      (clusterScope == null ? 0 : clusterScope!.hashCode) +
      (name.hashCode) +
      (requiredForCompletion == null ? 0 : requiredForCompletion!.hashCode) +
      (templateName.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ExperimentSpecAnalysesInner[args=$args, clusterScope=$clusterScope, name=$name, requiredForCompletion=$requiredForCompletion, templateName=$templateName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'args'] = this.args;
    if (this.clusterScope != null) {
      json[r'clusterScope'] = this.clusterScope;
    } else {
      json[r'clusterScope'] = null;
    }
    json[r'name'] = this.name;
    if (this.requiredForCompletion != null) {
      json[r'requiredForCompletion'] = this.requiredForCompletion;
    } else {
      json[r'requiredForCompletion'] = null;
    }
    json[r'templateName'] = this.templateName;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ExperimentSpecAnalysesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ExperimentSpecAnalysesInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ExperimentSpecAnalysesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ExperimentSpecAnalysesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ExperimentSpecAnalysesInner(
        args: IoArgoprojV1alpha1AnalysisRunSpecArgsInner.listFromJson(
            json[r'args']),
        clusterScope: mapValueOfType<bool>(json, r'clusterScope'),
        name: mapValueOfType<String>(json, r'name')!,
        requiredForCompletion:
            mapValueOfType<bool>(json, r'requiredForCompletion'),
        templateName: mapValueOfType<String>(json, r'templateName')!,
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ExperimentSpecAnalysesInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ExperimentSpecAnalysesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ExperimentSpecAnalysesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ExperimentSpecAnalysesInner> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ExperimentSpecAnalysesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ExperimentSpecAnalysesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ExperimentSpecAnalysesInner-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ExperimentSpecAnalysesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ExperimentSpecAnalysesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ExperimentSpecAnalysesInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'templateName',
  };
}
