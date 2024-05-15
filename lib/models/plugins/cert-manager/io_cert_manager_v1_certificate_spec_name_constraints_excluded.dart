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

class IoCertManagerV1CertificateSpecNameConstraintsExcluded {
  /// Returns a new [IoCertManagerV1CertificateSpecNameConstraintsExcluded] instance.
  IoCertManagerV1CertificateSpecNameConstraintsExcluded({
    this.dnsDomains = const [],
    this.emailAddresses = const [],
    this.ipRanges = const [],
    this.uriDomains = const [],
  });

  /// DNSDomains is a list of DNS domains that are permitted or excluded.
  List<String> dnsDomains;

  /// EmailAddresses is a list of Email Addresses that are permitted or excluded.
  List<String> emailAddresses;

  /// IPRanges is a list of IP Ranges that are permitted or excluded. This should be a valid CIDR notation.
  List<String> ipRanges;

  /// URIDomains is a list of URI domains that are permitted or excluded.
  List<String> uriDomains;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecNameConstraintsExcluded &&
          deepEquality.equals(other.dnsDomains, dnsDomains) &&
          deepEquality.equals(other.emailAddresses, emailAddresses) &&
          deepEquality.equals(other.ipRanges, ipRanges) &&
          deepEquality.equals(other.uriDomains, uriDomains);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (dnsDomains.hashCode) +
      (emailAddresses.hashCode) +
      (ipRanges.hashCode) +
      (uriDomains.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecNameConstraintsExcluded[dnsDomains=$dnsDomains, emailAddresses=$emailAddresses, ipRanges=$ipRanges, uriDomains=$uriDomains]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'dnsDomains'] = this.dnsDomains;
    json[r'emailAddresses'] = this.emailAddresses;
    json[r'ipRanges'] = this.ipRanges;
    json[r'uriDomains'] = this.uriDomains;
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecNameConstraintsExcluded] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecNameConstraintsExcluded? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecNameConstraintsExcluded[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecNameConstraintsExcluded[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecNameConstraintsExcluded(
        dnsDomains: json[r'dnsDomains'] is Iterable
            ? (json[r'dnsDomains'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        emailAddresses: json[r'emailAddresses'] is Iterable
            ? (json[r'emailAddresses'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        ipRanges: json[r'ipRanges'] is Iterable
            ? (json[r'ipRanges'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        uriDomains: json[r'uriDomains'] is Iterable
            ? (json[r'uriDomains'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecNameConstraintsExcluded>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecNameConstraintsExcluded>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecNameConstraintsExcluded.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecNameConstraintsExcluded>
      mapFromJson(dynamic json) {
    final map =
        <String, IoCertManagerV1CertificateSpecNameConstraintsExcluded>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecNameConstraintsExcluded.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecNameConstraintsExcluded-objects as value to a dart map
  static Map<String,
          List<IoCertManagerV1CertificateSpecNameConstraintsExcluded>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerV1CertificateSpecNameConstraintsExcluded>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1CertificateSpecNameConstraintsExcluded.listFromJson(
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
