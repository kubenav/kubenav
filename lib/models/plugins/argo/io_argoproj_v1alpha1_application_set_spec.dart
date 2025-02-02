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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_generators_inner_cluster_decision_resource_template.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_ignore_application_differences_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_preserved_fields.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_strategy.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_set_spec_sync_policy.dart';

class IoArgoprojV1alpha1ApplicationSetSpec {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpec] instance.
  IoArgoprojV1alpha1ApplicationSetSpec({
    this.applyNestedSelectors,
    this.generators = const [],
    this.goTemplate,
    this.goTemplateOptions = const [],
    this.ignoreApplicationDifferences = const [],
    this.preservedFields,
    this.strategy,
    this.syncPolicy,
    required this.template,
    this.templatePatch,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? applyNestedSelectors;

  List<IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner> generators;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? goTemplate;

  List<String> goTemplateOptions;

  List<IoArgoprojV1alpha1ApplicationSetSpecIgnoreApplicationDifferencesInner>
      ignoreApplicationDifferences;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecPreservedFields? preservedFields;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecStrategy? strategy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy? syncPolicy;

  IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplate
      template;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? templatePatch;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpec &&
          other.applyNestedSelectors == applyNestedSelectors &&
          deepEquality.equals(other.generators, generators) &&
          other.goTemplate == goTemplate &&
          deepEquality.equals(other.goTemplateOptions, goTemplateOptions) &&
          deepEquality.equals(other.ignoreApplicationDifferences,
              ignoreApplicationDifferences) &&
          other.preservedFields == preservedFields &&
          other.strategy == strategy &&
          other.syncPolicy == syncPolicy &&
          other.template == template &&
          other.templatePatch == templatePatch;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (applyNestedSelectors == null ? 0 : applyNestedSelectors!.hashCode) +
      (generators.hashCode) +
      (goTemplate == null ? 0 : goTemplate!.hashCode) +
      (goTemplateOptions.hashCode) +
      (ignoreApplicationDifferences.hashCode) +
      (preservedFields == null ? 0 : preservedFields!.hashCode) +
      (strategy == null ? 0 : strategy!.hashCode) +
      (syncPolicy == null ? 0 : syncPolicy!.hashCode) +
      (template.hashCode) +
      (templatePatch == null ? 0 : templatePatch!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpec[applyNestedSelectors=$applyNestedSelectors, generators=$generators, goTemplate=$goTemplate, goTemplateOptions=$goTemplateOptions, ignoreApplicationDifferences=$ignoreApplicationDifferences, preservedFields=$preservedFields, strategy=$strategy, syncPolicy=$syncPolicy, template=$template, templatePatch=$templatePatch]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.applyNestedSelectors != null) {
      json[r'applyNestedSelectors'] = this.applyNestedSelectors;
    } else {
      json[r'applyNestedSelectors'] = null;
    }
    json[r'generators'] = this.generators;
    if (this.goTemplate != null) {
      json[r'goTemplate'] = this.goTemplate;
    } else {
      json[r'goTemplate'] = null;
    }
    json[r'goTemplateOptions'] = this.goTemplateOptions;
    json[r'ignoreApplicationDifferences'] = this.ignoreApplicationDifferences;
    if (this.preservedFields != null) {
      json[r'preservedFields'] = this.preservedFields;
    } else {
      json[r'preservedFields'] = null;
    }
    if (this.strategy != null) {
      json[r'strategy'] = this.strategy;
    } else {
      json[r'strategy'] = null;
    }
    if (this.syncPolicy != null) {
      json[r'syncPolicy'] = this.syncPolicy;
    } else {
      json[r'syncPolicy'] = null;
    }
    json[r'template'] = this.template;
    if (this.templatePatch != null) {
      json[r'templatePatch'] = this.templatePatch;
    } else {
      json[r'templatePatch'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpec(
        applyNestedSelectors:
            mapValueOfType<bool>(json, r'applyNestedSelectors'),
        generators:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInner.listFromJson(
                json[r'generators']),
        goTemplate: mapValueOfType<bool>(json, r'goTemplate'),
        goTemplateOptions: json[r'goTemplateOptions'] is Iterable
            ? (json[r'goTemplateOptions'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        ignoreApplicationDifferences:
            IoArgoprojV1alpha1ApplicationSetSpecIgnoreApplicationDifferencesInner
                .listFromJson(json[r'ignoreApplicationDifferences']),
        preservedFields:
            IoArgoprojV1alpha1ApplicationSetSpecPreservedFields.fromJson(
                json[r'preservedFields']),
        strategy: IoArgoprojV1alpha1ApplicationSetSpecStrategy.fromJson(
            json[r'strategy']),
        syncPolicy: IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy.fromJson(
            json[r'syncPolicy']),
        template:
            IoArgoprojV1alpha1ApplicationSetSpecGeneratorsInnerClusterDecisionResourceTemplate
                .fromJson(json[r'template'])!,
        templatePatch: mapValueOfType<String>(json, r'templatePatch'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSetSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ApplicationSetSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSetSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSetSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpec-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSetSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ApplicationSetSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ApplicationSetSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'generators',
    'template',
  };
}
