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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_venafi_cloud.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_venafi_tpp.dart';

class IoCertManagerV1ClusterIssuerSpecVenafi {
  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVenafi] instance.
  IoCertManagerV1ClusterIssuerSpecVenafi({
    this.cloud,
    this.tpp,
    required this.zone,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVenafiCloud? cloud;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerV1ClusterIssuerSpecVenafiTpp? tpp;

  /// Zone is the Venafi Policy Zone to use for this issuer. All requests made to the Venafi platform will be restricted by the named zone policy. This field is required.
  String zone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1ClusterIssuerSpecVenafi &&
          other.cloud == cloud &&
          other.tpp == tpp &&
          other.zone == zone;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cloud == null ? 0 : cloud!.hashCode) +
      (tpp == null ? 0 : tpp!.hashCode) +
      (zone.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1ClusterIssuerSpecVenafi[cloud=$cloud, tpp=$tpp, zone=$zone]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cloud != null) {
      json[r'cloud'] = this.cloud;
    } else {
      json[r'cloud'] = null;
    }
    if (this.tpp != null) {
      json[r'tpp'] = this.tpp;
    } else {
      json[r'tpp'] = null;
    }
    json[r'zone'] = this.zone;
    return json;
  }

  /// Returns a new [IoCertManagerV1ClusterIssuerSpecVenafi] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1ClusterIssuerSpecVenafi? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1ClusterIssuerSpecVenafi[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1ClusterIssuerSpecVenafi[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1ClusterIssuerSpecVenafi(
        cloud: IoCertManagerV1ClusterIssuerSpecVenafiCloud.fromJson(
            json[r'cloud']),
        tpp: IoCertManagerV1ClusterIssuerSpecVenafiTpp.fromJson(json[r'tpp']),
        zone: mapValueOfType<String>(json, r'zone')!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1ClusterIssuerSpecVenafi> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1ClusterIssuerSpecVenafi>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerV1ClusterIssuerSpecVenafi.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1ClusterIssuerSpecVenafi> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerV1ClusterIssuerSpecVenafi>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1ClusterIssuerSpecVenafi.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1ClusterIssuerSpecVenafi-objects as value to a dart map
  static Map<String, List<IoCertManagerV1ClusterIssuerSpecVenafi>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerV1ClusterIssuerSpecVenafi>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerV1ClusterIssuerSpecVenafi.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'zone',
  };
}
