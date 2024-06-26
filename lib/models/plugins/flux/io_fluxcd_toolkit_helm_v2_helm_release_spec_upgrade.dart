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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_upgrade_remediation.dart';

class IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade({
    this.cleanupOnFail,
    this.crds,
    this.disableHooks,
    this.disableOpenAPIValidation,
    this.disableWait,
    this.disableWaitForJobs,
    this.force,
    this.preserveValues,
    this.remediation,
    this.timeout,
  });

  /// CleanupOnFail allows deletion of new resources created during the Helm upgrade action when it fails.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? cleanupOnFail;

  /// CRDs upgrade CRDs from the Helm Chart's crds directory according to the CRD upgrade policy provided here. Valid values are `Skip`, `Create` or `CreateReplace`. Default is `Skip` and if omitted CRDs are neither installed nor upgraded.   Skip: do neither install nor replace (update) any CRDs.   Create: new CRDs are created, existing CRDs are neither updated nor deleted.   CreateReplace: new CRDs are created, existing CRDs are updated (replaced) but not deleted.   By default, CRDs are not applied during Helm upgrade action. With this option users can opt-in to CRD upgrade, which is not (yet) natively supported by Helm. https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
  IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum? crds;

  /// DisableHooks prevents hooks from running during the Helm upgrade action.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableHooks;

  /// DisableOpenAPIValidation prevents the Helm upgrade action from validating rendered templates against the Kubernetes OpenAPI Schema.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableOpenAPIValidation;

  /// DisableWait disables the waiting for resources to be ready after a Helm upgrade has been performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableWait;

  /// DisableWaitForJobs disables waiting for jobs to complete after a Helm upgrade has been performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableWaitForJobs;

  /// Force forces resource updates through a replacement strategy.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? force;

  /// PreserveValues will make Helm reuse the last release's values and merge in overrides from 'Values'. Setting this flag makes the HelmRelease non-declarative.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? preserveValues;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeRemediation? remediation;

  /// Timeout is the time to wait for any individual Kubernetes operation (like Jobs for hooks) during the performance of a Helm upgrade action. Defaults to 'HelmReleaseSpec.Timeout'.
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
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade &&
          other.cleanupOnFail == cleanupOnFail &&
          other.crds == crds &&
          other.disableHooks == disableHooks &&
          other.disableOpenAPIValidation == disableOpenAPIValidation &&
          other.disableWait == disableWait &&
          other.disableWaitForJobs == disableWaitForJobs &&
          other.force == force &&
          other.preserveValues == preserveValues &&
          other.remediation == remediation &&
          other.timeout == timeout;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cleanupOnFail == null ? 0 : cleanupOnFail!.hashCode) +
      (crds == null ? 0 : crds!.hashCode) +
      (disableHooks == null ? 0 : disableHooks!.hashCode) +
      (disableOpenAPIValidation == null
          ? 0
          : disableOpenAPIValidation!.hashCode) +
      (disableWait == null ? 0 : disableWait!.hashCode) +
      (disableWaitForJobs == null ? 0 : disableWaitForJobs!.hashCode) +
      (force == null ? 0 : force!.hashCode) +
      (preserveValues == null ? 0 : preserveValues!.hashCode) +
      (remediation == null ? 0 : remediation!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade[cleanupOnFail=$cleanupOnFail, crds=$crds, disableHooks=$disableHooks, disableOpenAPIValidation=$disableOpenAPIValidation, disableWait=$disableWait, disableWaitForJobs=$disableWaitForJobs, force=$force, preserveValues=$preserveValues, remediation=$remediation, timeout=$timeout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cleanupOnFail != null) {
      json[r'cleanupOnFail'] = this.cleanupOnFail;
    } else {
      json[r'cleanupOnFail'] = null;
    }
    if (this.crds != null) {
      json[r'crds'] = this.crds;
    } else {
      json[r'crds'] = null;
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
    if (this.force != null) {
      json[r'force'] = this.force;
    } else {
      json[r'force'] = null;
    }
    if (this.preserveValues != null) {
      json[r'preserveValues'] = this.preserveValues;
    } else {
      json[r'preserveValues'] = null;
    }
    if (this.remediation != null) {
      json[r'remediation'] = this.remediation;
    } else {
      json[r'remediation'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade(
        cleanupOnFail: mapValueOfType<bool>(json, r'cleanupOnFail'),
        crds: IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum.fromJson(
            json[r'crds']),
        disableHooks: mapValueOfType<bool>(json, r'disableHooks'),
        disableOpenAPIValidation:
            mapValueOfType<bool>(json, r'disableOpenAPIValidation'),
        disableWait: mapValueOfType<bool>(json, r'disableWait'),
        disableWaitForJobs: mapValueOfType<bool>(json, r'disableWaitForJobs'),
        force: mapValueOfType<bool>(json, r'force'),
        preserveValues: mapValueOfType<bool>(json, r'preserveValues'),
        remediation:
            IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeRemediation.fromJson(
                json[r'remediation']),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecUpgrade.listFromJson(
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

/// CRDs upgrade CRDs from the Helm Chart's crds directory according to the CRD upgrade policy provided here. Valid values are `Skip`, `Create` or `CreateReplace`. Default is `Skip` and if omitted CRDs are neither installed nor upgraded.   Skip: do neither install nor replace (update) any CRDs.   Create: new CRDs are created, existing CRDs are neither updated nor deleted.   CreateReplace: new CRDs are created, existing CRDs are updated (replaced) but not deleted.   By default, CRDs are not applied during Helm upgrade action. With this option users can opt-in to CRD upgrade, which is not (yet) natively supported by Helm. https://helm.sh/docs/chart_best_practices/custom_resource_definitions.
class IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const skip =
      IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum._(r'Skip');
  static const create =
      IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum._(r'Create');
  static const createReplace =
      IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum._(r'CreateReplace');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum].
  static const values = <IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum>[
    skip,
    create,
    createReplace,
  ];

  static IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum].
class IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnumTypeTransformer._();

  String encode(IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Skip':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum.skip;
        case r'Create':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum.create;
        case r'CreateReplace':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnum
              .createReplace;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2HelmReleaseSpecUpgradeCrdsEnumTypeTransformer?
      _instance;
}
