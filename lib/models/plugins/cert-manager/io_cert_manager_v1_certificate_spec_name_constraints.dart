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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_name_constraints_excluded.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_certificate_spec_name_constraints_permitted.dart';

class IoCertManagerV1CertificateSpecNameConstraints {
  /// Returns a new [IoCertManagerV1CertificateSpecNameConstraints] instance.
  IoCertManagerV1CertificateSpecNameConstraints({
    this.critical,
    this.excluded,
    this.permitted,
  });

  /// if true then the name constraints are marked critical.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? critical;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecNameConstraintsExcluded? excluded;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1CertificateSpecNameConstraintsPermitted? permitted;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecNameConstraints &&
          other.critical == critical &&
          other.excluded == excluded &&
          other.permitted == permitted;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (critical == null ? 0 : critical!.hashCode) +
      (excluded == null ? 0 : excluded!.hashCode) +
      (permitted == null ? 0 : permitted!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecNameConstraints[critical=$critical, excluded=$excluded, permitted=$permitted]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.critical != null) {
      json[r'critical'] = this.critical;
    } else {
      json[r'critical'] = null;
    }
    if (this.excluded != null) {
      json[r'excluded'] = this.excluded;
    } else {
      json[r'excluded'] = null;
    }
    if (this.permitted != null) {
      json[r'permitted'] = this.permitted;
    } else {
      json[r'permitted'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecNameConstraints] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecNameConstraints? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecNameConstraints[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecNameConstraints[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecNameConstraints(
        critical: mapValueOfType<bool>(json, r'critical'),
        excluded:
            IoCertManagerV1CertificateSpecNameConstraintsExcluded.fromJson(
                json[r'excluded']),
        permitted:
            IoCertManagerV1CertificateSpecNameConstraintsPermitted.fromJson(
                json[r'permitted']),
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecNameConstraints> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateSpecNameConstraints>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecNameConstraints.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecNameConstraints> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1CertificateSpecNameConstraints>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecNameConstraints.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecNameConstraints-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateSpecNameConstraints>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1CertificateSpecNameConstraints>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1CertificateSpecNameConstraints.listFromJson(
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
