//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this, avoid_function_literals_in_foreach_calls, require_trailing_commas
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_args_inner_value_from_field_ref.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_analysis_run_spec_args_inner_value_from_secret_key_ref.dart';

class IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom {
  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom] instance.
  IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom({
    this.fieldRef,
    this.secretKeyRef,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFromFieldRef? fieldRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFromSecretKeyRef? secretKeyRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom &&
          other.fieldRef == fieldRef &&
          other.secretKeyRef == secretKeyRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (fieldRef == null ? 0 : fieldRef!.hashCode) +
      (secretKeyRef == null ? 0 : secretKeyRef!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom[fieldRef=$fieldRef, secretKeyRef=$secretKeyRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fieldRef != null) {
      json[r'fieldRef'] = this.fieldRef;
    } else {
      json[r'fieldRef'] = null;
    }
    if (this.secretKeyRef != null) {
      json[r'secretKeyRef'] = this.secretKeyRef;
    } else {
      json[r'secretKeyRef'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom(
        fieldRef: IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFromFieldRef
            .fromJson(json[r'fieldRef']),
        secretKeyRef:
            IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFromSecretKeyRef
                .fromJson(json[r'secretKeyRef']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1AnalysisRunSpecArgsInnerValueFrom.listFromJson(
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
