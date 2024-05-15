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

import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_acme.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_ca.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_self_signed.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_venafi.dart';

class IoCertManagerV1ClusterIssuerSpec {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpec] instance.
  IoCertManagerV1ClusterIssuerSpec({
    this.acme,
    this.ca,
    this.selfSigned,
    this.vault,
    this.venafi,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecAcme? acme;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecCa? ca;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecSelfSigned? selfSigned;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVault? vault;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVenafi? venafi;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpec &&
          other.acme == acme &&
          other.ca == ca &&
          other.selfSigned == selfSigned &&
          other.vault == vault &&
          other.venafi == venafi;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (acme == null ? 0 : acme!.hashCode) +
      (ca == null ? 0 : ca!.hashCode) +
      (selfSigned == null ? 0 : selfSigned!.hashCode) +
      (vault == null ? 0 : vault!.hashCode) +
      (venafi == null ? 0 : venafi!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpec[acme=$acme, ca=$ca, selfSigned=$selfSigned, vault=$vault, venafi=$venafi]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.acme != null) {
      json[r'acme'] = this.acme;
    } else {
      json[r'acme'] = null;
    }
    if (this.ca != null) {
      json[r'ca'] = this.ca;
    } else {
      json[r'ca'] = null;
    }
    if (this.selfSigned != null) {
      json[r'selfSigned'] = this.selfSigned;
    } else {
      json[r'selfSigned'] = null;
    }
    if (this.vault != null) {
      json[r'vault'] = this.vault;
    } else {
      json[r'vault'] = null;
    }
    if (this.venafi != null) {
      json[r'venafi'] = this.venafi;
    } else {
      json[r'venafi'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpec(
        acme: IoCertManagerV1ClusterIssuerSpecAcme.fromJson(json[r'acme']),
        ca: IoCertManagerV1ClusterIssuerSpecCa.fromJson(json[r'ca']),
        selfSigned: IoCertManagerV1ClusterIssuerSpecSelfSigned.fromJson(
            json[r'selfSigned']),
        vault: IoCertManagerV1ClusterIssuerSpecVault.fromJson(json[r'vault']),
        venafi:
            IoCertManagerV1ClusterIssuerSpecVenafi.fromJson(json[r'venafi']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerV1ClusterIssuerSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpec-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1ClusterIssuerSpec.listFromJson(
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
