//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta1_bucket_spec_access_from.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta1_bucket_spec_secret_ref.dart';

class IoFluxcdToolkitSourceV1beta1BucketSpec {
  /// Returns a new [IoFluxcdToolkitSourceV1beta1BucketSpec] instance.
  IoFluxcdToolkitSourceV1beta1BucketSpec({
    this.accessFrom,
    required this.bucketName,
    required this.endpoint,
    this.ignore,
    this.insecure,
    required this.interval,
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
  IoFluxcdToolkitSourceV1beta1BucketSpecAccessFrom? accessFrom;

  /// The bucket name.
  String bucketName;

  /// The bucket endpoint address.
  String endpoint;

  /// Ignore overrides the set of excluded patterns in the .sourceignore format (which is the same as .gitignore). If not provided, a default will be used, consult the documentation for your version to find out what those are.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ignore;

  /// Insecure allows connecting to a non-TLS S3 HTTP endpoint.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? insecure;

  /// The interval at which to check for bucket updates.
  String interval;

  /// The S3 compatible storage provider name, default ('generic').
  IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum? provider;

  /// The bucket region.
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
  IoFluxcdToolkitSourceV1beta1BucketSpecSecretRef? secretRef;

  /// This flag tells the controller to suspend the reconciliation of this source.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// The timeout for download operations, defaults to 60s.
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
      other is IoFluxcdToolkitSourceV1beta1BucketSpec &&
          other.accessFrom == accessFrom &&
          other.bucketName == bucketName &&
          other.endpoint == endpoint &&
          other.ignore == ignore &&
          other.insecure == insecure &&
          other.interval == interval &&
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
      (provider == null ? 0 : provider!.hashCode) +
      (region == null ? 0 : region!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta1BucketSpec[accessFrom=$accessFrom, bucketName=$bucketName, endpoint=$endpoint, ignore=$ignore, insecure=$insecure, interval=$interval, provider=$provider, region=$region, secretRef=$secretRef, suspend=$suspend, timeout=$timeout]';

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

  /// Returns a new [IoFluxcdToolkitSourceV1beta1BucketSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta1BucketSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta1BucketSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta1BucketSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta1BucketSpec(
        accessFrom: IoFluxcdToolkitSourceV1beta1BucketSpecAccessFrom.fromJson(
            json[r'accessFrom']),
        bucketName: mapValueOfType<String>(json, r'bucketName')!,
        endpoint: mapValueOfType<String>(json, r'endpoint')!,
        ignore: mapValueOfType<String>(json, r'ignore'),
        insecure: mapValueOfType<bool>(json, r'insecure'),
        interval: mapValueOfType<String>(json, r'interval')!,
        provider: IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum.fromJson(
            json[r'provider']),
        region: mapValueOfType<String>(json, r'region'),
        secretRef: IoFluxcdToolkitSourceV1beta1BucketSpecSecretRef.fromJson(
            json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta1BucketSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta1BucketSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitSourceV1beta1BucketSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta1BucketSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta1BucketSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta1BucketSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta1BucketSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta1BucketSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1beta1BucketSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitSourceV1beta1BucketSpec.listFromJson(
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

/// The S3 compatible storage provider name, default ('generic').
class IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const generic =
      IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum._(r'generic');
  static const aws =
      IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum._(r'aws');
  static const gcp =
      IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum._(r'gcp');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum].
  static const values = <IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum>[
    generic,
    aws,
    gcp,
  ];

  static IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum].
class IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnumTypeTransformer._();

  String encode(IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'generic':
          return IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum.generic;
        case r'aws':
          return IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum.aws;
        case r'gcp':
          return IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnum.gcp;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta1BucketSpecProviderEnumTypeTransformer?
      _instance;
}
