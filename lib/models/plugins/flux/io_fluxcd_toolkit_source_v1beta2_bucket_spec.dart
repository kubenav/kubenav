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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_helm_repository_spec_access_from.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_bucket_spec_secret_ref.dart';

class IoFluxcdToolkitSourceV1beta2BucketSpec {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2BucketSpec] instance.
  IoFluxcdToolkitSourceV1beta2BucketSpec({
    this.accessFrom,
    required this.bucketName,
    required this.endpoint,
    this.ignore,
    this.insecure,
    required this.interval,
    this.prefix,
    this.provider,
    this.region,
    this.secretRef,
    this.suspend,
    this.timeout,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1HelmRepositorySpecAccessFrom? accessFrom;

  /// BucketName is the name of the object storage bucket.
  String bucketName;

  /// Endpoint is the object storage address the BucketName is located at.
  String endpoint;

  /// Ignore overrides the set of excluded patterns in the .sourceignore format (which is the same as .gitignore). If not provided, a default will be used, consult the documentation for your version to find out what those are.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ignore;

  /// Insecure allows connecting to a non-TLS HTTP Endpoint.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? insecure;

  /// Interval at which the Bucket Endpoint is checked for updates. This interval is approximate and may be subject to jitter to ensure efficient use of resources.
  String interval;

  /// Prefix to use for server-side filtering of files in the Bucket.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? prefix;

  /// Provider of the object storage bucket. Defaults to 'generic', which expects an S3 (API) compatible object storage.
  IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum? provider;

  /// Region of the Endpoint where the BucketName is located in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? region;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2BucketSpecSecretRef? secretRef;

  /// Suspend tells the controller to suspend the reconciliation of this Bucket.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Timeout for fetch operations, defaults to 60s.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2BucketSpec &&
          other.accessFrom == accessFrom &&
          other.bucketName == bucketName &&
          other.endpoint == endpoint &&
          other.ignore == ignore &&
          other.insecure == insecure &&
          other.interval == interval &&
          other.prefix == prefix &&
          other.provider == provider &&
          other.region == region &&
          other.secretRef == secretRef &&
          other.suspend == suspend &&
          other.timeout == timeout;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessFrom == null ? 0 : accessFrom!.hashCode) +
      (bucketName.hashCode) +
      (endpoint.hashCode) +
      (ignore == null ? 0 : ignore!.hashCode) +
      (insecure == null ? 0 : insecure!.hashCode) +
      (interval.hashCode) +
      (prefix == null ? 0 : prefix!.hashCode) +
      (provider == null ? 0 : provider!.hashCode) +
      (region == null ? 0 : region!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2BucketSpec[accessFrom=$accessFrom, bucketName=$bucketName, endpoint=$endpoint, ignore=$ignore, insecure=$insecure, interval=$interval, prefix=$prefix, provider=$provider, region=$region, secretRef=$secretRef, suspend=$suspend, timeout=$timeout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessFrom != null) {
      json[r'accessFrom'] = this.accessFrom;
    } else {
      json[r'accessFrom'] = null;
    }
    json[r'bucketName'] = this.bucketName;
    json[r'endpoint'] = this.endpoint;
    if (this.ignore != null) {
      json[r'ignore'] = this.ignore;
    } else {
      json[r'ignore'] = null;
    }
    if (this.insecure != null) {
      json[r'insecure'] = this.insecure;
    } else {
      json[r'insecure'] = null;
    }
    json[r'interval'] = this.interval;
    if (this.prefix != null) {
      json[r'prefix'] = this.prefix;
    } else {
      json[r'prefix'] = null;
    }
    if (this.provider != null) {
      json[r'provider'] = this.provider;
    } else {
      json[r'provider'] = null;
    }
    if (this.region != null) {
      json[r'region'] = this.region;
    } else {
      json[r'region'] = null;
    }
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2BucketSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2BucketSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2BucketSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2BucketSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2BucketSpec(
        accessFrom:
            IoFluxcdToolkitSourceV1HelmRepositorySpecAccessFrom.fromJson(
                json[r'accessFrom']),
        bucketName: mapValueOfType<String>(json, r'bucketName')!,
        endpoint: mapValueOfType<String>(json, r'endpoint')!,
        ignore: mapValueOfType<String>(json, r'ignore'),
        insecure: mapValueOfType<bool>(json, r'insecure'),
        interval: mapValueOfType<String>(json, r'interval')!,
        prefix: mapValueOfType<String>(json, r'prefix'),
        provider: IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum.fromJson(
            json[r'provider']),
        region: mapValueOfType<String>(json, r'region'),
        secretRef: IoFluxcdToolkitSourceV1beta2BucketSpecSecretRef.fromJson(
            json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2BucketSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2BucketSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitSourceV1beta2BucketSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2BucketSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta2BucketSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta2BucketSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2BucketSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta2BucketSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1beta2BucketSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitSourceV1beta2BucketSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'bucketName',
    'endpoint',
    'interval',
  };
}

/// Provider of the object storage bucket. Defaults to 'generic', which expects an S3 (API) compatible object storage.
class IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const generic =
      IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum._(r'generic');
  static const aws =
      IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum._(r'aws');
  static const gcp =
      IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum._(r'gcp');
  static const azure =
      IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum._(r'azure');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum].
  static const values = <IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum>[
    generic,
    aws,
    gcp,
    azure,
  ];

  static IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum].
class IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnumTypeTransformer._();

  String encode(IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'generic':
          return IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum.generic;
        case r'aws':
          return IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum.aws;
        case r'gcp':
          return IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum.gcp;
        case r'azure':
          return IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnum.azure;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta2BucketSpecProviderEnumTypeTransformer?
      _instance;
}
