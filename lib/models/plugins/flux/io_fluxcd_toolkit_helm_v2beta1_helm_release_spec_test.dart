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

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest({
    this.enable,
    this.ignoreFailures,
    this.timeout,
  });

  /// Enable enables Helm test actions for this HelmRelease after an Helm install or upgrade action has been performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enable;

  /// IgnoreFailures tells the controller to skip remediation when the Helm tests are run but fail. Can be overwritten for tests run after install or upgrade actions in 'Install.IgnoreTestFailures' and 'Upgrade.IgnoreTestFailures'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? ignoreFailures;

  /// Timeout is the time to wait for any individual Kubernetes operation during the performance of a Helm test action. Defaults to 'HelmReleaseSpec.Timeout'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest &&
          other.enable == enable &&
          other.ignoreFailures == ignoreFailures &&
          other.timeout == timeout;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (enable == null ? 0 : enable!.hashCode) +
      (ignoreFailures == null ? 0 : ignoreFailures!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest[enable=$enable, ignoreFailures=$ignoreFailures, timeout=$timeout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.enable != null) {
      json[r'enable'] = this.enable;
    } else {
      json[r'enable'] = null;
    }
    if (this.ignoreFailures != null) {
      json[r'ignoreFailures'] = this.ignoreFailures;
    } else {
      json[r'ignoreFailures'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest(
        enable: mapValueOfType<bool>(json, r'enable'),
        ignoreFailures: mapValueOfType<bool>(json, r'ignoreFailures'),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecTest.listFromJson(
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
