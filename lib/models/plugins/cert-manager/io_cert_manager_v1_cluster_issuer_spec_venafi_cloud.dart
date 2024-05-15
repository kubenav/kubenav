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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_venafi_cloud_api_token_secret_ref.dart';

class IoCertManagerV1ClusterIssuerSpecVenafiCloud {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVenafiCloud] instance.
  IoCertManagerV1ClusterIssuerSpecVenafiCloud({
    required this.apiTokenSecretRef,
    this.url,
  });

  IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef
      apiTokenSecretRef;

  /// URL is the base URL for Venafi Cloud. Defaults to \"https://api.venafi.cloud/v1\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecVenafiCloud &&
          other.apiTokenSecretRef == apiTokenSecretRef &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiTokenSecretRef.hashCode) + (url == null ? 0 : url!.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecVenafiCloud[apiTokenSecretRef=$apiTokenSecretRef, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'apiTokenSecretRef'] = this.apiTokenSecretRef;
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVenafiCloud] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecVenafiCloud? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecVenafiCloud[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecVenafiCloud[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecVenafiCloud(
        apiTokenSecretRef:
            IoCertManagerV1ClusterIssuerSpecVenafiCloudApiTokenSecretRef
                .fromJson(json[r'apiTokenSecretRef'])!,
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecVenafiCloud> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecVenafiCloud>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpecVenafiCloud.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecVenafiCloud> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecVenafiCloud>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVenafiCloud.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecVenafiCloud-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecVenafiCloud>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpecVenafiCloud>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1ClusterIssuerSpecVenafiCloud.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'apiTokenSecretRef',
  };
}
