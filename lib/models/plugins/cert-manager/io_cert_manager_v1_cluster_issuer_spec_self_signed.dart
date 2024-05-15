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

class IoCertManagerV1ClusterIssuerSpecSelfSigned {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecSelfSigned] instance.
  IoCertManagerV1ClusterIssuerSpecSelfSigned({
    this.crlDistributionPoints = const [],
  });

  /// The CRL distribution points is an X.509 v3 certificate extension which identifies the location of the CRL from which the revocation of this certificate can be checked. If not set certificate will be issued without CDP. Values are strings.
  List<String> crlDistributionPoints;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecSelfSigned &&
          deepEquality.equals(
              other.crlDistributionPoints, crlDistributionPoints);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (crlDistributionPoints.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecSelfSigned[crlDistributionPoints=$crlDistributionPoints]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'crlDistributionPoints'] = this.crlDistributionPoints;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecSelfSigned] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecSelfSigned? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecSelfSigned[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecSelfSigned[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecSelfSigned(
        crlDistributionPoints: json[r'crlDistributionPoints'] is Iterable
            ? (json[r'crlDistributionPoints'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecSelfSigned> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecSelfSigned>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpecSelfSigned.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecSelfSigned> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecSelfSigned>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecSelfSigned.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecSelfSigned-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecSelfSigned>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpecSelfSigned>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1ClusterIssuerSpecSelfSigned.listFromJson(
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
