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

class IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation({
    this.ignoreTestFailures,
    this.remediateLastFailure,
    this.retries,
  });

  /// IgnoreTestFailures tells the controller to skip remediation when the Helm tests are run after an install action but fail. Defaults to 'Test.IgnoreFailures'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? ignoreTestFailures;

  /// RemediateLastFailure tells the controller to remediate the last failure, when no retries remain. Defaults to 'false'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? remediateLastFailure;

  /// Retries is the number of retries that should be attempted on failures before bailing. Remediation, using an uninstall, is performed between each attempt. Defaults to '0', a negative integer equals to unlimited retries.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? retries;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation &&
          other.ignoreTestFailures == ignoreTestFailures &&
          other.remediateLastFailure == remediateLastFailure &&
          other.retries == retries;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ignoreTestFailures == null ? 0 : ignoreTestFailures!.hashCode) +
      (remediateLastFailure == null ? 0 : remediateLastFailure!.hashCode) +
      (retries == null ? 0 : retries!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation[ignoreTestFailures=$ignoreTestFailures, remediateLastFailure=$remediateLastFailure, retries=$retries]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ignoreTestFailures != null) {
      json[r'ignoreTestFailures'] = this.ignoreTestFailures;
    } else {
      json[r'ignoreTestFailures'] = null;
    }
    if (this.remediateLastFailure != null) {
      json[r'remediateLastFailure'] = this.remediateLastFailure;
    } else {
      json[r'remediateLastFailure'] = null;
    }
    if (this.retries != null) {
      json[r'retries'] = this.retries;
    } else {
      json[r'retries'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation(
        ignoreTestFailures: mapValueOfType<bool>(json, r'ignoreTestFailures'),
        remediateLastFailure:
            mapValueOfType<bool>(json, r'remediateLastFailure'),
        retries: mapValueOfType<int>(json, r'retries'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation.listFromJson(
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
