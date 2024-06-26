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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_git_checkout.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_git_commit.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_git_push.dart';

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit({
    this.checkout,
    required this.commit,
    this.push,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckout? checkout;

  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit commit;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush? push;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit &&
          other.checkout == checkout &&
          other.commit == commit &&
          other.push == push;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (checkout == null ? 0 : checkout!.hashCode) +
      (commit.hashCode) +
      (push == null ? 0 : push!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit[checkout=$checkout, commit=$commit, push=$push]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.checkout != null) {
      json[r'checkout'] = this.checkout;
    } else {
      json[r'checkout'] = null;
    }
    json[r'commit'] = this.commit;
    if (this.push != null) {
      json[r'push'] = this.push;
    } else {
      json[r'push'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit(
        checkout:
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCheckout
                .fromJson(json[r'checkout']),
        commit: IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit
            .fromJson(json[r'commit'])!,
        push: IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush
            .fromJson(json[r'push']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGit
            .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'commit',
  };
}
