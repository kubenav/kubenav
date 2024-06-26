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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_helm_repository_spec_cert_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_helm_repository_spec_secret_ref.dart';

class IoFluxcdToolkitSourceV1HelmRepositorySpec {
  /// Returns a new [IoFluxcdToolkitSourceV1HelmRepositorySpec] instance.
  IoFluxcdToolkitSourceV1HelmRepositorySpec({
    this.accessFrom,
    this.certSecretRef,
    this.insecure,
    this.interval,
    this.passCredentials,
    this.provider,
    this.secretRef,
    this.suspend,
    this.timeout,
    this.type,
    required this.url,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1HelmRepositorySpecAccessFrom? accessFrom;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1HelmRepositorySpecCertSecretRef? certSecretRef;

  /// Insecure allows connecting to a non-TLS HTTP container registry. This field is only taken into account if the .spec.type field is set to 'oci'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? insecure;

  /// Interval at which the HelmRepository URL is checked for updates. This interval is approximate and may be subject to jitter to ensure efficient use of resources.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? interval;

  /// PassCredentials allows the credentials from the SecretRef to be passed on to a host that does not match the host as defined in URL. This may be required if the host of the advertised chart URLs in the index differ from the defined URL. Enabling this should be done with caution, as it can potentially result in credentials getting stolen in a MITM-attack.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? passCredentials;

  /// Provider used for authentication, can be 'aws', 'azure', 'gcp' or 'generic'. This field is optional, and only taken into account if the .spec.type field is set to 'oci'. When not specified, defaults to 'generic'.
  IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum? provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1HelmRepositorySpecSecretRef? secretRef;

  /// Suspend tells the controller to suspend the reconciliation of this HelmRepository.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Timeout is used for the index fetch operation for an HTTPS helm repository, and for remote OCI Repository operations like pulling for an OCI helm chart by the associated HelmChart. Its default value is 60s.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  /// Type of the HelmRepository. When this field is set to  \"oci\", the URL field value must be prefixed with \"oci://\".
  IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum? type;

  /// URL of the Helm repository, a valid URL contains at least a protocol and host.
  String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1HelmRepositorySpec &&
          other.accessFrom == accessFrom &&
          other.certSecretRef == certSecretRef &&
          other.insecure == insecure &&
          other.interval == interval &&
          other.passCredentials == passCredentials &&
          other.provider == provider &&
          other.secretRef == secretRef &&
          other.suspend == suspend &&
          other.timeout == timeout &&
          other.type == type &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessFrom == null ? 0 : accessFrom!.hashCode) +
      (certSecretRef == null ? 0 : certSecretRef!.hashCode) +
      (insecure == null ? 0 : insecure!.hashCode) +
      (interval == null ? 0 : interval!.hashCode) +
      (passCredentials == null ? 0 : passCredentials!.hashCode) +
      (provider == null ? 0 : provider!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (url.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1HelmRepositorySpec[accessFrom=$accessFrom, certSecretRef=$certSecretRef, insecure=$insecure, interval=$interval, passCredentials=$passCredentials, provider=$provider, secretRef=$secretRef, suspend=$suspend, timeout=$timeout, type=$type, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessFrom != null) {
      json[r'accessFrom'] = this.accessFrom;
    } else {
      json[r'accessFrom'] = null;
    }
    if (this.certSecretRef != null) {
      json[r'certSecretRef'] = this.certSecretRef;
    } else {
      json[r'certSecretRef'] = null;
    }
    if (this.insecure != null) {
      json[r'insecure'] = this.insecure;
    } else {
      json[r'insecure'] = null;
    }
    if (this.interval != null) {
      json[r'interval'] = this.interval;
    } else {
      json[r'interval'] = null;
    }
    if (this.passCredentials != null) {
      json[r'passCredentials'] = this.passCredentials;
    } else {
      json[r'passCredentials'] = null;
    }
    if (this.provider != null) {
      json[r'provider'] = this.provider;
    } else {
      json[r'provider'] = null;
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
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1HelmRepositorySpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1HelmRepositorySpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1HelmRepositorySpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1HelmRepositorySpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1HelmRepositorySpec(
        accessFrom:
            IoFluxcdToolkitSourceV1HelmRepositorySpecAccessFrom.fromJson(
                json[r'accessFrom']),
        certSecretRef:
            IoFluxcdToolkitSourceV1HelmRepositorySpecCertSecretRef.fromJson(
                json[r'certSecretRef']),
        insecure: mapValueOfType<bool>(json, r'insecure'),
        interval: mapValueOfType<String>(json, r'interval'),
        passCredentials: mapValueOfType<bool>(json, r'passCredentials'),
        provider:
            IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum.fromJson(
                json[r'provider']),
        secretRef: IoFluxcdToolkitSourceV1HelmRepositorySpecSecretRef.fromJson(
            json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
        type: IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum.fromJson(
            json[r'type']),
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1HelmRepositorySpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1HelmRepositorySpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitSourceV1HelmRepositorySpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1HelmRepositorySpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1HelmRepositorySpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1HelmRepositorySpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1HelmRepositorySpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1HelmRepositorySpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1HelmRepositorySpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitSourceV1HelmRepositorySpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'url',
  };
}

/// Provider used for authentication, can be 'aws', 'azure', 'gcp' or 'generic'. This field is optional, and only taken into account if the .spec.type field is set to 'oci'. When not specified, defaults to 'generic'.
class IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const generic =
      IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum._(r'generic');
  static const aws =
      IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum._(r'aws');
  static const azure =
      IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum._(r'azure');
  static const gcp =
      IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum._(r'gcp');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum].
  static const values = <IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum>[
    generic,
    aws,
    azure,
    gcp,
  ];

  static IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum].
class IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnumTypeTransformer._();

  String encode(IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'generic':
          return IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum.generic;
        case r'aws':
          return IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum.aws;
        case r'azure':
          return IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum.azure;
        case r'gcp':
          return IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnum.gcp;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1HelmRepositorySpecProviderEnumTypeTransformer?
      _instance;
}

/// Type of the HelmRepository. When this field is set to  \"oci\", the URL field value must be prefixed with \"oci://\".
class IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const default_ =
      IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum._(r'default');
  static const oci =
      IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum._(r'oci');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum].
  static const values = <IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum>[
    default_,
    oci,
  ];

  static IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum].
class IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnumTypeTransformer._();

  String encode(IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'default':
          return IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum.default_;
        case r'oci':
          return IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnum.oci;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1HelmRepositorySpecTypeEnumTypeTransformer?
      _instance;
}
