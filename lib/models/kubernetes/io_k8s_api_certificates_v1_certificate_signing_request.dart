//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCertificatesV1CertificateSigningRequest {
  /// Returns a new [IoK8sApiCertificatesV1CertificateSigningRequest] instance.
  IoK8sApiCertificatesV1CertificateSigningRequest({
    this.apiVersion,
    this.kind,
    this.metadata,
    required this.spec,
    this.status,
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

  IoK8sApiCertificatesV1CertificateSigningRequestSpec spec;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCertificatesV1CertificateSigningRequestStatus? status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCertificatesV1CertificateSigningRequest &&
          other.apiVersion == apiVersion &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.spec == spec &&
          other.status == status;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (spec.hashCode) +
      (status == null ? 0 : status!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCertificatesV1CertificateSigningRequest[apiVersion=$apiVersion, kind=$kind, metadata=$metadata, spec=$spec, status=$status]';

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
    json[r'spec'] = spec;
    if (status != null) {
      json[r'status'] = status;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCertificatesV1CertificateSigningRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCertificatesV1CertificateSigningRequest? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCertificatesV1CertificateSigningRequest[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCertificatesV1CertificateSigningRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCertificatesV1CertificateSigningRequest(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        spec: IoK8sApiCertificatesV1CertificateSigningRequestSpec.fromJson(
            json[r'spec'])!,
        status: IoK8sApiCertificatesV1CertificateSigningRequestStatus.fromJson(
            json[r'status']),
      );
    }
    return null;
  }

  static List<IoK8sApiCertificatesV1CertificateSigningRequest>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCertificatesV1CertificateSigningRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCertificatesV1CertificateSigningRequest>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCertificatesV1CertificateSigningRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCertificatesV1CertificateSigningRequest.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCertificatesV1CertificateSigningRequest-objects as value to a dart map
  static Map<String, List<IoK8sApiCertificatesV1CertificateSigningRequest>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiCertificatesV1CertificateSigningRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequest.listFromJson(
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
  static const requiredKeys = <String>{
    'spec',
  };
}
