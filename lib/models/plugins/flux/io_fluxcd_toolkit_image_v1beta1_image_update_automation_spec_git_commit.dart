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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_git_commit_author.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_update_automation_spec_git_commit_signing_key.dart';

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit({
    required this.author,
    this.messageTemplate,
    this.signingKey,
  });

  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor author;

  /// MessageTemplate provides a template for the commit message, into which will be interpolated the details of the change made.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? messageTemplate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitSigningKey?
      signingKey;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit &&
          other.author == author &&
          other.messageTemplate == messageTemplate &&
          other.signingKey == signingKey;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (author.hashCode) +
      (messageTemplate == null ? 0 : messageTemplate!.hashCode) +
      (signingKey == null ? 0 : signingKey!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit[author=$author, messageTemplate=$messageTemplate, signingKey=$signingKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'author'] = this.author;
    if (this.messageTemplate != null) {
      json[r'messageTemplate'] = this.messageTemplate;
    } else {
      json[r'messageTemplate'] = null;
    }
    if (this.signingKey != null) {
      json[r'signingKey'] = this.signingKey;
    } else {
      json[r'signingKey'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit(
        author:
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitAuthor
                .fromJson(json[r'author'])!,
        messageTemplate: mapValueOfType<String>(json, r'messageTemplate'),
        signingKey:
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommitSigningKey
                .fromJson(json[r'signingKey']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecGitCommit
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
    'author',
  };
}
