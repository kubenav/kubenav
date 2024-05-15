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

class IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity({
    this.clientID,
    this.resourceID,
  });

  /// client ID of the managed identity, can not be used at the same time as resourceID
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? clientID;

  /// resource ID of the managed identity, can not be used at the same time as clientID Cannot be used for Azure Managed Service Identity
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resourceID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity &&
          other.clientID == clientID &&
          other.resourceID == resourceID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (clientID == null ? 0 : clientID!.hashCode) +
      (resourceID == null ? 0 : resourceID!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity[clientID=$clientID, resourceID=$resourceID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.clientID != null) {
      json[r'clientID'] = this.clientID;
    } else {
      json[r'clientID'] = null;
    }
    if (this.resourceID != null) {
      json[r'resourceID'] = this.resourceID;
    } else {
      json[r'resourceID'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity(
        clientID: mapValueOfType<String>(json, r'clientID'),
        resourceID: mapValueOfType<String>(json, r'resourceID'),
      );
    }
    return null;
  }

  static List<
          IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity-objects as value to a dart map
  static Map<
          String,
          List<
              IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity
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
