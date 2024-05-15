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

class IoCertManagerV1CertificateSpecSubject {
  /// Returns a new [IoCertManagerV1CertificateSpecSubject] instance.
  IoCertManagerV1CertificateSpecSubject({
    this.countries = const [],
    this.localities = const [],
    this.organizationalUnits = const [],
    this.organizations = const [],
    this.postalCodes = const [],
    this.provinces = const [],
    this.serialNumber,
    this.streetAddresses = const [],
  });

  /// Countries to be used on the Certificate.
  List<String> countries;

  /// Cities to be used on the Certificate.
  List<String> localities;

  /// Organizational Units to be used on the Certificate.
  List<String> organizationalUnits;

  /// Organizations to be used on the Certificate.
  List<String> organizations;

  /// Postal codes to be used on the Certificate.
  List<String> postalCodes;

  /// State/Provinces to be used on the Certificate.
  List<String> provinces;

  /// Serial number to be used on the Certificate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serialNumber;

  /// Street addresses to be used on the Certificate.
  List<String> streetAddresses;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecSubject &&
          deepEquality.equals(other.countries, countries) &&
          deepEquality.equals(other.localities, localities) &&
          deepEquality.equals(other.organizationalUnits, organizationalUnits) &&
          deepEquality.equals(other.organizations, organizations) &&
          deepEquality.equals(other.postalCodes, postalCodes) &&
          deepEquality.equals(other.provinces, provinces) &&
          other.serialNumber == serialNumber &&
          deepEquality.equals(other.streetAddresses, streetAddresses);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (countries.hashCode) +
      (localities.hashCode) +
      (organizationalUnits.hashCode) +
      (organizations.hashCode) +
      (postalCodes.hashCode) +
      (provinces.hashCode) +
      (serialNumber == null ? 0 : serialNumber!.hashCode) +
      (streetAddresses.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecSubject[countries=$countries, localities=$localities, organizationalUnits=$organizationalUnits, organizations=$organizations, postalCodes=$postalCodes, provinces=$provinces, serialNumber=$serialNumber, streetAddresses=$streetAddresses]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'countries'] = this.countries;
    json[r'localities'] = this.localities;
    json[r'organizationalUnits'] = this.organizationalUnits;
    json[r'organizations'] = this.organizations;
    json[r'postalCodes'] = this.postalCodes;
    json[r'provinces'] = this.provinces;
    if (this.serialNumber != null) {
      json[r'serialNumber'] = this.serialNumber;
    } else {
      json[r'serialNumber'] = null;
    }
    json[r'streetAddresses'] = this.streetAddresses;
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecSubject] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecSubject? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecSubject[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecSubject[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecSubject(
        countries: json[r'countries'] is Iterable
            ? (json[r'countries'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        localities: json[r'localities'] is Iterable
            ? (json[r'localities'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        organizationalUnits: json[r'organizationalUnits'] is Iterable
            ? (json[r'organizationalUnits'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        organizations: json[r'organizations'] is Iterable
            ? (json[r'organizations'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        postalCodes: json[r'postalCodes'] is Iterable
            ? (json[r'postalCodes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        provinces: json[r'provinces'] is Iterable
            ? (json[r'provinces'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        serialNumber: mapValueOfType<String>(json, r'serialNumber'),
        streetAddresses: json[r'streetAddresses'] is Iterable
            ? (json[r'streetAddresses'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecSubject> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecSubject>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateSpecSubject.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecSubject> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpecSubject>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecSubject.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecSubject-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpecSubject>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpecSubject>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1CertificateSpecSubject.listFromJson(
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
