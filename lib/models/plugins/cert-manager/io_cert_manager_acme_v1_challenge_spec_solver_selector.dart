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

class IoCertManagerAcmeV1ChallengeSpecSolverSelector {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverSelector] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverSelector({
    this.dnsNames = const [],
    this.dnsZones = const [],
    this.matchLabels = const {},
  });

  /// List of DNSNames that this solver will be used to solve. If specified and a match is found, a dnsNames selector will take precedence over a dnsZones selector. If multiple solvers match with the same dnsNames value, the solver with the most matching labels in matchLabels will be selected. If neither has more matches, the solver defined earlier in the list will be selected.
  List<String> dnsNames;

  /// List of DNSZones that this solver will be used to solve. The most specific DNS zone match specified here will take precedence over other DNS zone matches, so a solver specifying sys.example.com will be selected over one specifying example.com for the domain www.sys.example.com. If multiple solvers match with the same dnsZones value, the solver with the most matching labels in matchLabels will be selected. If neither has more matches, the solver defined earlier in the list will be selected.
  List<String> dnsZones;

  /// A label selector that is used to refine the set of certificate's that this challenge solver will apply to.
  Map<String, String> matchLabels;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverSelector &&
          deepEquality.equals(other.dnsNames, dnsNames) &&
          deepEquality.equals(other.dnsZones, dnsZones) &&
          deepEquality.equals(other.matchLabels, matchLabels);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (dnsNames.hashCode) + (dnsZones.hashCode) + (matchLabels.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverSelector[dnsNames=$dnsNames, dnsZones=$dnsZones, matchLabels=$matchLabels]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'dnsNames'] = this.dnsNames;
    json[r'dnsZones'] = this.dnsZones;
    json[r'matchLabels'] = this.matchLabels;
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverSelector] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverSelector? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverSelector[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverSelector[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverSelector(
        dnsNames: json[r'dnsNames'] is Iterable
            ? (json[r'dnsNames'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        dnsZones: json[r'dnsZones'] is Iterable
            ? (json[r'dnsZones'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        matchLabels:
            mapCastOfType<String, String>(json, r'matchLabels') ?? const {},
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverSelector> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverSelector>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverSelector.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverSelector>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverSelector>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerAcmeV1ChallengeSpecSolverSelector.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverSelector-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverSelector>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverSelector>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverSelector.listFromJson(
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
