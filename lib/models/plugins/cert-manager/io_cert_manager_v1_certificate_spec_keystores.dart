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

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_keystores_jks.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_keystores_pkcs12.dart';

class IoCertManagerV1CertificateSpecKeystores {
  /// Returns a new [IoCertManagerV1CertificateSpecKeystores] instance.
  IoCertManagerV1CertificateSpecKeystores({
    this.jks,
    this.pkcs12,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecKeystoresJks? jks;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecKeystoresPkcs12? pkcs12;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecKeystores &&
          other.jks == jks &&
          other.pkcs12 == pkcs12;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (jks == null ? 0 : jks!.hashCode) +
      (pkcs12 == null ? 0 : pkcs12!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecKeystores[jks=$jks, pkcs12=$pkcs12]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.jks != null) {
      json[r'jks'] = this.jks;
    } else {
      json[r'jks'] = null;
    }
    if (this.pkcs12 != null) {
      json[r'pkcs12'] = this.pkcs12;
    } else {
      json[r'pkcs12'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecKeystores] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecKeystores? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecKeystores[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecKeystores[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecKeystores(
        jks: IoCertManagerV1CertificateSpecKeystoresJks.fromJson(json[r'jks']),
        pkcs12: IoCertManagerV1CertificateSpecKeystoresPkcs12.fromJson(
            json[r'pkcs12']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecKeystores> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecKeystores>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1CertificateSpecKeystores.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecKeystores> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpecKeystores>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecKeystores.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecKeystores-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpecKeystores>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpecKeystores>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1CertificateSpecKeystores.listFromJson(
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
