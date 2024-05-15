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

class IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook({
    this.config,
    required this.groupName,
    required this.solverName,
  });

  /// Additional configuration that should be passed to the webhook apiserver when challenges are processed. This can contain arbitrary JSON data. Secret values should not be specified in this stanza. If secret values are needed (e.g. credentials for a DNS service), you should use a SecretKeySelector to reference a Secret resource. For details on the schema of this field, consult the webhook provider implementation's documentation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? config;

  /// The API group name that should be used when POSTing ChallengePayload resources to the webhook apiserver. This should be the same as the GroupName specified in the webhook provider implementation.
  String groupName;

  /// The name of the solver to use, as defined in the webhook provider implementation. This will typically be the name of the provider, e.g. 'cloudflare'.
  String solverName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook &&
          other.config == config &&
          other.groupName == groupName &&
          other.solverName == solverName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (config == null ? 0 : config!.hashCode) +
      (groupName.hashCode) +
      (solverName.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook[config=$config, groupName=$groupName, solverName=$solverName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.config != null) {
      json[r'config'] = this.config;
    } else {
      json[r'config'] = null;
    }
    json[r'groupName'] = this.groupName;
    json[r'solverName'] = this.solverName;
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook(
        config: mapValueOfType<Object>(json, r'config'),
        groupName: mapValueOfType<String>(json, r'groupName')!,
        solverName: mapValueOfType<String>(json, r'solverName')!,
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01Webhook.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'groupName',
    'solverName',
  };
}
