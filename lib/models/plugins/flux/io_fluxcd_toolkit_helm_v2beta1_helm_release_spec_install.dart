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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_install_remediation.dart';

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall({
    this.crds,
    this.createNamespace,
    this.disableHooks,
    this.disableOpenAPIValidation,
    this.disableWait,
    this.disableWaitForJobs,
    this.remediation,
    this.replace,
    this.skipCRDs,
    this.timeout,
  });

  /// CRDs upgrade CRDs from the Helm Chart's crds directory according to the CRD upgrade policy provided here. Valid values are `Skip`, `Create` or `CreateReplace`. Default is `Create` and if omitted CRDs are installed but not updated.   Skip: do neither install nor replace (update) any CRDs.   Create: new CRDs are created, existing CRDs are neither updated nor deleted.   CreateReplace: new CRDs are created, existing CRDs are updated (replaced) but not deleted.   By default, CRDs are applied (installed) during Helm install action. With this option users can opt-in to CRD replace existing CRDs on Helm install actions, which is not (yet) natively supported by Helm. https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum? crds;

  /// CreateNamespace tells the Helm install action to create the HelmReleaseSpec.TargetNamespace if it does not exist yet. On uninstall, the namespace will not be garbage collected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? createNamespace;

  /// DisableHooks prevents hooks from running during the Helm install action.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableHooks;

  /// DisableOpenAPIValidation prevents the Helm install action from validating rendered templates against the Kubernetes OpenAPI Schema.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableOpenAPIValidation;

  /// DisableWait disables the waiting for resources to be ready after a Helm install has been performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableWait;

  /// DisableWaitForJobs disables waiting for jobs to complete after a Helm install has been performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableWaitForJobs;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation? remediation;

  /// Replace tells the Helm install action to re-use the 'ReleaseName', but only if that name is a deleted release which remains in the history.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? replace;

  /// SkipCRDs tells the Helm install action to not install any CRDs. By default, CRDs are installed if not already present.   Deprecated use CRD policy (`crds`) attribute with value `Skip` instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? skipCRDs;

  /// Timeout is the time to wait for any individual Kubernetes operation (like Jobs for hooks) during the performance of a Helm install action. Defaults to 'HelmReleaseSpec.Timeout'.
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
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall &&
          other.crds == crds &&
          other.createNamespace == createNamespace &&
          other.disableHooks == disableHooks &&
          other.disableOpenAPIValidation == disableOpenAPIValidation &&
          other.disableWait == disableWait &&
          other.disableWaitForJobs == disableWaitForJobs &&
          other.remediation == remediation &&
          other.replace == replace &&
          other.skipCRDs == skipCRDs &&
          other.timeout == timeout;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (crds == null ? 0 : crds!.hashCode) +
      (createNamespace == null ? 0 : createNamespace!.hashCode) +
      (disableHooks == null ? 0 : disableHooks!.hashCode) +
      (disableOpenAPIValidation == null
          ? 0
          : disableOpenAPIValidation!.hashCode) +
      (disableWait == null ? 0 : disableWait!.hashCode) +
      (disableWaitForJobs == null ? 0 : disableWaitForJobs!.hashCode) +
      (remediation == null ? 0 : remediation!.hashCode) +
      (replace == null ? 0 : replace!.hashCode) +
      (skipCRDs == null ? 0 : skipCRDs!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall[crds=$crds, createNamespace=$createNamespace, disableHooks=$disableHooks, disableOpenAPIValidation=$disableOpenAPIValidation, disableWait=$disableWait, disableWaitForJobs=$disableWaitForJobs, remediation=$remediation, replace=$replace, skipCRDs=$skipCRDs, timeout=$timeout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.crds != null) {
      json[r'crds'] = this.crds;
    } else {
      json[r'crds'] = null;
    }
    if (this.createNamespace != null) {
      json[r'createNamespace'] = this.createNamespace;
    } else {
      json[r'createNamespace'] = null;
    }
    if (this.disableHooks != null) {
      json[r'disableHooks'] = this.disableHooks;
    } else {
      json[r'disableHooks'] = null;
    }
    if (this.disableOpenAPIValidation != null) {
      json[r'disableOpenAPIValidation'] = this.disableOpenAPIValidation;
    } else {
      json[r'disableOpenAPIValidation'] = null;
    }
    if (this.disableWait != null) {
      json[r'disableWait'] = this.disableWait;
    } else {
      json[r'disableWait'] = null;
    }
    if (this.disableWaitForJobs != null) {
      json[r'disableWaitForJobs'] = this.disableWaitForJobs;
    } else {
      json[r'disableWaitForJobs'] = null;
    }
    if (this.remediation != null) {
      json[r'remediation'] = this.remediation;
    } else {
      json[r'remediation'] = null;
    }
    if (this.replace != null) {
      json[r'replace'] = this.replace;
    } else {
      json[r'replace'] = null;
    }
    if (this.skipCRDs != null) {
      json[r'skipCRDs'] = this.skipCRDs;
    } else {
      json[r'skipCRDs'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall(
        crds: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum.fromJson(
            json[r'crds']),
        createNamespace: mapValueOfType<bool>(json, r'createNamespace'),
        disableHooks: mapValueOfType<bool>(json, r'disableHooks'),
        disableOpenAPIValidation:
            mapValueOfType<bool>(json, r'disableOpenAPIValidation'),
        disableWait: mapValueOfType<bool>(json, r'disableWait'),
        disableWaitForJobs: mapValueOfType<bool>(json, r'disableWaitForJobs'),
        remediation:
            IoFluxcdToolkitHelmV2HelmReleaseSpecInstallRemediation.fromJson(
                json[r'remediation']),
        replace: mapValueOfType<bool>(json, r'replace'),
        skipCRDs: mapValueOfType<bool>(json, r'skipCRDs'),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstall.listFromJson(
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

/// CRDs upgrade CRDs from the Helm Chart's crds directory according to the CRD upgrade policy provided here. Valid values are `Skip`, `Create` or `CreateReplace`. Default is `Create` and if omitted CRDs are installed but not updated.   Skip: do neither install nor replace (update) any CRDs.   Create: new CRDs are created, existing CRDs are neither updated nor deleted.   CreateReplace: new CRDs are created, existing CRDs are updated (replaced) but not deleted.   By default, CRDs are applied (installed) during Helm install action. With this option users can opt-in to CRD replace existing CRDs on Helm install actions, which is not (yet) natively supported by Helm. https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const skip =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum._(r'Skip');
  static const create =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum._(r'Create');
  static const createReplace =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum._(
          r'CreateReplace');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum>[
    skip,
    create,
    createReplace,
  ];

  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum].
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Skip':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum.skip;
        case r'Create':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum
              .create;
        case r'CreateReplace':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnum
              .createReplace;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecInstallCrdsEnumTypeTransformer?
      _instance;
}
