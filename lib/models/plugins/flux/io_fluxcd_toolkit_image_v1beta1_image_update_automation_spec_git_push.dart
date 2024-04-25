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

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush({
    this.branch,
    this.options = const {},
    this.refspec,
  });

  /// Branch specifies that commits should be pushed to the branch named. The branch is created using `.spec.checkout.branch` as the starting point, if it doesn't already exist.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? branch;

  /// Options specifies the push options that are sent to the Git server when performing a push operation. For details, see: https://git-scm.com/docs/git-push#Documentation/git-push.txt---push-optionltoptiongt
  Map<String, String> options;

  /// Refspec specifies the Git Refspec to use for a push operation. If both Branch and Refspec are provided, then the commit is pushed to the branch and also using the specified refspec. For more details about Git Refspecs, see: https://git-scm.com/book/en/v2/Git-Internals-The-Refspec
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? refspec;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush &&
          other.branch == branch &&
          deepEquality.equals(other.options, options) &&
          other.refspec == refspec;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (branch == null ? 0 : branch!.hashCode) +
      (options.hashCode) +
      (refspec == null ? 0 : refspec!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush[branch=$branch, options=$options, refspec=$refspec]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.branch != null) {
      json[r'branch'] = this.branch;
    } else {
      json[r'branch'] = null;
    }
    json[r'options'] = this.options;
    if (this.refspec != null) {
      json[r'refspec'] = this.refspec;
    } else {
      json[r'refspec'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush(
        branch: mapValueOfType<String>(json, r'branch'),
        options: mapCastOfType<String, String>(json, r'options') ?? const {},
        refspec: mapValueOfType<String>(json, r'refspec'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitPush
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
