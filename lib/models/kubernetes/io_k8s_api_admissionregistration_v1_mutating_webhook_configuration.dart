//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_admissionregistration_v1_mutating_webhook.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';

class IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration {
  /// Returns a new [IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration] instance.
  IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration({
    this.apiVersion,
    this.kind,
    this.metadata,
    this.webhooks = const [],
  });

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  /// Webhooks is a list of webhooks and the affected resources and operations.
  List<IoK8sApiAdmissionregistrationV1MutatingWebhook> webhooks;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.webhooks == webhooks;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (webhooks.hashCode);

  @override
  String toString() =>
      'IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration[apiVersion=$apiVersion, kind=$kind, metadata=$metadata, webhooks=$webhooks]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    json[r'webhooks'] = webhooks;
    return json;
  }

  /// Returns a new [IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        webhooks: IoK8sApiAdmissionregistrationV1MutatingWebhook.listFromJson(
                json[r'webhooks']) ??
            const [],
      );
    }
    return null;
  }

  static List<IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration-objects as value to a dart map
  static Map<String,
          List<IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAdmissionregistrationV1MutatingWebhookConfiguration
                .listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}