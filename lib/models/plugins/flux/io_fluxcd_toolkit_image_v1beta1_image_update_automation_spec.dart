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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_git.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_source_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_update.dart';

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec({
    this.git,
    required this.interval,
    required this.sourceRef,
    this.suspend,
    this.update,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit? git;

  /// Interval gives an lower bound for how often the automation run should be attempted.
  String interval;

  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef sourceRef;

  /// Suspend tells the controller to not run this automation, until it is unset (or set to false). Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate? update;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec &&
          other.git == git &&
          other.interval == interval &&
          other.sourceRef == sourceRef &&
          other.suspend == suspend &&
          other.update == update;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (git == null ? 0 : git!.hashCode) +
      (interval.hashCode) +
      (sourceRef.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (update == null ? 0 : update!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec[git=$git, interval=$interval, sourceRef=$sourceRef, suspend=$suspend, update=$update]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.git != null) {
      json[r'git'] = this.git;
    } else {
      json[r'git'] = null;
    }
    json[r'interval'] = this.interval;
    json[r'sourceRef'] = this.sourceRef;
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.update != null) {
      json[r'update'] = this.update;
    } else {
      json[r'update'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec(
        git: IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit.fromJson(
            json[r'git']),
        interval: mapValueOfType<String>(json, r'interval')!,
        sourceRef: IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecSourceRef
            .fromJson(json[r'sourceRef'])!,
        suspend: mapValueOfType<bool>(json, r'suspend'),
        update:
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate.fromJson(
                json[r'update']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'interval',
    'sourceRef',
  };
}
