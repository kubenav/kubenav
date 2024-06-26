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

class IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner {
  /// Returns a new [IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner] instance.
  IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner({
    required this.issuer,
    required this.subject,
  });

  /// Issuer specifies the regex pattern to match against to verify the OIDC issuer in the Fulcio certificate. The pattern must be a valid Go regular expression.
  String issuer;

  /// Subject specifies the regex pattern to match against to verify the identity subject in the Fulcio certificate. The pattern must be a valid Go regular expression.
  String subject;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner &&
          other.issuer == issuer &&
          other.subject == subject;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (issuer.hashCode) + (subject.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner[issuer=$issuer, subject=$subject]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'issuer'] = this.issuer;
    json[r'subject'] = this.subject;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner(
        issuer: mapValueOfType<String>(json, r'issuer')!,
        subject: mapValueOfType<String>(json, r'subject')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1HelmChartSpecVerifyMatchOIDCIdentityInner
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issuer',
    'subject',
  };
}
