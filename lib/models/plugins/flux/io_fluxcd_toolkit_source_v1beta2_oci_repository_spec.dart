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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository_spec_cert_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository_spec_layer_selector.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository_spec_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository_spec_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository_spec_verify.dart';

class IoFluxcdToolkitSourceV1beta2OCIRepositorySpec {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2OCIRepositorySpec] instance.
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpec({
    this.certSecretRef,
    this.ignore,
    this.insecure,
    required this.interval,
    this.layerSelector,
    this.provider,
    this.ref,
    this.secretRef,
    this.serviceAccountName,
    this.suspend,
    this.timeout,
    required this.url,
    this.verify,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecCertSecretRef? certSecretRef;

  /// Ignore overrides the set of excluded patterns in the .sourceignore format (which is the same as .gitignore). If not provided, a default will be used, consult the documentation for your version to find out what those are.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ignore;

  /// Insecure allows connecting to a non-TLS HTTP container registry.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? insecure;

  /// Interval at which the OCIRepository URL is checked for updates. This interval is approximate and may be subject to jitter to ensure efficient use of resources.
  String interval;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector? layerSelector;

  /// The provider used for authentication, can be 'aws', 'azure', 'gcp' or 'generic'. When not specified, defaults to 'generic'.
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum? provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecRef? ref;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecSecretRef? secretRef;

  /// ServiceAccountName is the name of the Kubernetes ServiceAccount used to authenticate the image pull if the service account has attached pull secrets. For more information: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/#add-imagepullsecrets-to-a-service-account
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccountName;

  /// This flag tells the controller to suspend the reconciliation of this source.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// The timeout for remote OCI Repository operations like pulling, defaults to 60s.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  /// URL is a reference to an OCI artifact repository hosted on a remote container registry.
  String url;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecVerify? verify;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2OCIRepositorySpec &&
          other.certSecretRef == certSecretRef &&
          other.ignore == ignore &&
          other.insecure == insecure &&
          other.interval == interval &&
          other.layerSelector == layerSelector &&
          other.provider == provider &&
          other.ref == ref &&
          other.secretRef == secretRef &&
          other.serviceAccountName == serviceAccountName &&
          other.suspend == suspend &&
          other.timeout == timeout &&
          other.url == url &&
          other.verify == verify;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (certSecretRef == null ? 0 : certSecretRef!.hashCode) +
      (ignore == null ? 0 : ignore!.hashCode) +
      (insecure == null ? 0 : insecure!.hashCode) +
      (interval.hashCode) +
      (layerSelector == null ? 0 : layerSelector!.hashCode) +
      (provider == null ? 0 : provider!.hashCode) +
      (ref == null ? 0 : ref!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (serviceAccountName == null ? 0 : serviceAccountName!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (url.hashCode) +
      (verify == null ? 0 : verify!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2OCIRepositorySpec[certSecretRef=$certSecretRef, ignore=$ignore, insecure=$insecure, interval=$interval, layerSelector=$layerSelector, provider=$provider, ref=$ref, secretRef=$secretRef, serviceAccountName=$serviceAccountName, suspend=$suspend, timeout=$timeout, url=$url, verify=$verify]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.certSecretRef != null) {
      json[r'certSecretRef'] = this.certSecretRef;
    } else {
      json[r'certSecretRef'] = null;
    }
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
    if (this.layerSelector != null) {
      json[r'layerSelector'] = this.layerSelector;
    } else {
      json[r'layerSelector'] = null;
    }
    if (this.provider != null) {
      json[r'provider'] = this.provider;
    } else {
      json[r'provider'] = null;
    }
    if (this.ref != null) {
      json[r'ref'] = this.ref;
    } else {
      json[r'ref'] = null;
    }
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    if (this.serviceAccountName != null) {
      json[r'serviceAccountName'] = this.serviceAccountName;
    } else {
      json[r'serviceAccountName'] = null;
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
    json[r'url'] = this.url;
    if (this.verify != null) {
      json[r'verify'] = this.verify;
    } else {
      json[r'verify'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2OCIRepositorySpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2OCIRepositorySpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2OCIRepositorySpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2OCIRepositorySpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2OCIRepositorySpec(
        certSecretRef:
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecCertSecretRef.fromJson(
                json[r'certSecretRef']),
        ignore: mapValueOfType<String>(json, r'ignore'),
        insecure: mapValueOfType<bool>(json, r'insecure'),
        interval: mapValueOfType<String>(json, r'interval')!,
        layerSelector:
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector.fromJson(
                json[r'layerSelector']),
        provider:
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum.fromJson(
                json[r'provider']),
        ref: IoFluxcdToolkitSourceV1beta2OCIRepositorySpecRef.fromJson(
            json[r'ref']),
        secretRef:
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecSecretRef.fromJson(
                json[r'secretRef']),
        serviceAccountName: mapValueOfType<String>(json, r'serviceAccountName'),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
        url: mapValueOfType<String>(json, r'url')!,
        verify: IoFluxcdToolkitSourceV1beta2OCIRepositorySpecVerify.fromJson(
            json[r'verify']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2OCIRepositorySpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2OCIRepositorySpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2OCIRepositorySpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta2OCIRepositorySpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2OCIRepositorySpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta2OCIRepositorySpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1beta2OCIRepositorySpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'interval',
    'url',
  };
}

/// The provider used for authentication, can be 'aws', 'azure', 'gcp' or 'generic'. When not specified, defaults to 'generic'.
class IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const generic =
      IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum._(r'generic');
  static const aws =
      IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum._(r'aws');
  static const azure =
      IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum._(r'azure');
  static const gcp =
      IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum._(r'gcp');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum].
  static const values =
      <IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum>[
    generic,
    aws,
    azure,
    gcp,
  ];

  static IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum].
class IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'generic':
          return IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum
              .generic;
        case r'aws':
          return IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum.aws;
        case r'azure':
          return IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum
              .azure;
        case r'gcp':
          return IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnum.gcp;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta2OCIRepositorySpecProviderEnumTypeTransformer?
      _instance;
}
