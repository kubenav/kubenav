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

class IoCertManagerV1CertificateSpecOtherNamesInner {
  /// Returns a new [IoCertManagerV1CertificateSpecOtherNamesInner] instance.
  IoCertManagerV1CertificateSpecOtherNamesInner({
    this.oid,
    this.utf8Value,
  });

  /// OID is the object identifier for the otherName SAN. The object identifier must be expressed as a dotted string, for example, \"1.2.840.113556.1.4.221\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? oid;

  /// utf8Value is the string value of the otherName SAN. The utf8Value accepts any valid UTF8 string to set as value for the otherName SAN.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? utf8Value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecOtherNamesInner &&
          other.oid == oid &&
          other.utf8Value == utf8Value;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (oid == null ? 0 : oid!.hashCode) +
      (utf8Value == null ? 0 : utf8Value!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecOtherNamesInner[oid=$oid, utf8Value=$utf8Value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.oid != null) {
      json[r'oid'] = this.oid;
    } else {
      json[r'oid'] = null;
    }
    if (this.utf8Value != null) {
      json[r'utf8Value'] = this.utf8Value;
    } else {
      json[r'utf8Value'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecOtherNamesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecOtherNamesInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecOtherNamesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecOtherNamesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecOtherNamesInner(
        oid: mapValueOfType<String>(json, r'oid'),
        utf8Value: mapValueOfType<String>(json, r'utf8Value'),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecOtherNamesInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecOtherNamesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecOtherNamesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecOtherNamesInner> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpecOtherNamesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecOtherNamesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecOtherNamesInner-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpecOtherNamesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpecOtherNamesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1CertificateSpecOtherNamesInner.listFromJson(
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
