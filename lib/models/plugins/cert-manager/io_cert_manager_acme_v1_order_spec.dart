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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_order_spec_issuer_ref.dart';

class IoCertManagerAcmeV1OrderSpec {
  /// Returns a new [IoCertManagerAcmeV1OrderSpec] instance.
  IoCertManagerAcmeV1OrderSpec({
    this.commonName,
    this.dnsNames = const [],
    this.duration,
    this.ipAddresses = const [],
    required this.issuerRef,
    required this.request,
  });

  /// CommonName is the common name as specified on the DER encoded CSR. If specified, this value must also be present in `dnsNames` or `ipAddresses`. This field must match the corresponding field on the DER encoded CSR.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? commonName;

  /// DNSNames is a list of DNS names that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR.
  List<String> dnsNames;

  /// Duration is the duration for the not after date for the requested certificate. this is set on order creation as pe the ACME spec.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? duration;

  /// IPAddresses is a list of IP addresses that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR.
  List<String> ipAddresses;

  IoCertManagerAcmeV1OrderSpecIssuerRef issuerRef;

  /// Certificate signing request bytes in DER encoding. This will be used when finalizing the order. This field must be set on the order.
  String request;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1OrderSpec &&
          other.commonName == commonName &&
          deepEquality.equals(other.dnsNames, dnsNames) &&
          other.duration == duration &&
          deepEquality.equals(other.ipAddresses, ipAddresses) &&
          other.issuerRef == issuerRef &&
          other.request == request;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (commonName == null ? 0 : commonName!.hashCode) +
      (dnsNames.hashCode) +
      (duration == null ? 0 : duration!.hashCode) +
      (ipAddresses.hashCode) +
      (issuerRef.hashCode) +
      (request.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1OrderSpec[commonName=$commonName, dnsNames=$dnsNames, duration=$duration, ipAddresses=$ipAddresses, issuerRef=$issuerRef, request=$request]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.commonName != null) {
      json[r'commonName'] = this.commonName;
    } else {
      json[r'commonName'] = null;
    }
    json[r'dnsNames'] = this.dnsNames;
    if (this.duration != null) {
      json[r'duration'] = this.duration;
    } else {
      json[r'duration'] = null;
    }
    json[r'ipAddresses'] = this.ipAddresses;
    json[r'issuerRef'] = this.issuerRef;
    json[r'request'] = this.request;
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1OrderSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1OrderSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1OrderSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1OrderSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1OrderSpec(
        commonName: mapValueOfType<String>(json, r'commonName'),
        dnsNames: json[r'dnsNames'] is Iterable
            ? (json[r'dnsNames'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        duration: mapValueOfType<String>(json, r'duration'),
        ipAddresses: json[r'ipAddresses'] is Iterable
            ? (json[r'ipAddresses'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        issuerRef:
            IoCertManagerAcmeV1OrderSpecIssuerRef.fromJson(json[r'issuerRef'])!,
        request: mapValueOfType<String>(json, r'request')!,
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1OrderSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1OrderSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1OrderSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1OrderSpec> mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1OrderSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerAcmeV1OrderSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1OrderSpec-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1OrderSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerAcmeV1OrderSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerAcmeV1OrderSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issuerRef',
    'request',
  };
}
