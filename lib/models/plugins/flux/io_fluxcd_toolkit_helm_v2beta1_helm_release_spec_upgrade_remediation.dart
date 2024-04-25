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

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation({
    this.ignoreTestFailures,
    this.remediateLastFailure,
    this.retries,
    this.strategy,
  });

  /// IgnoreTestFailures tells the controller to skip remediation when the Helm tests are run after an upgrade action but fail. Defaults to 'Test.IgnoreFailures'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? ignoreTestFailures;

  /// RemediateLastFailure tells the controller to remediate the last failure, when no retries remain. Defaults to 'false' unless 'Retries' is greater than 0.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? remediateLastFailure;

  /// Retries is the number of retries that should be attempted on failures before bailing. Remediation, using 'Strategy', is performed between each attempt. Defaults to '0', a negative integer equals to unlimited retries.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? retries;

  /// Strategy to use for failure remediation. Defaults to 'rollback'.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum?
      strategy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation &&
          other.ignoreTestFailures == ignoreTestFailures &&
          other.remediateLastFailure == remediateLastFailure &&
          other.retries == retries &&
          other.strategy == strategy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ignoreTestFailures == null ? 0 : ignoreTestFailures!.hashCode) +
      (remediateLastFailure == null ? 0 : remediateLastFailure!.hashCode) +
      (retries == null ? 0 : retries!.hashCode) +
      (strategy == null ? 0 : strategy!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation[ignoreTestFailures=$ignoreTestFailures, remediateLastFailure=$remediateLastFailure, retries=$retries, strategy=$strategy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ignoreTestFailures != null) {
      json[r'ignoreTestFailures'] = this.ignoreTestFailures;
    } else {
      json[r'ignoreTestFailures'] = null;
    }
    if (this.remediateLastFailure != null) {
      json[r'remediateLastFailure'] = this.remediateLastFailure;
    } else {
      json[r'remediateLastFailure'] = null;
    }
    if (this.retries != null) {
      json[r'retries'] = this.retries;
    } else {
      json[r'retries'] = null;
    }
    if (this.strategy != null) {
      json[r'strategy'] = this.strategy;
    } else {
      json[r'strategy'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation(
        ignoreTestFailures: mapValueOfType<bool>(json, r'ignoreTestFailures'),
        remediateLastFailure:
            mapValueOfType<bool>(json, r'remediateLastFailure'),
        retries: mapValueOfType<int>(json, r'retries'),
        strategy:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum
                .fromJson(json[r'strategy']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediation
                .listFromJson(
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

/// Strategy to use for failure remediation. Defaults to 'rollback'.
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const rollback =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum._(
          r'rollback');
  static const uninstall =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum._(
          r'uninstall');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum>[
    rollback,
    uninstall,
  ];

  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum].
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum?
      decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'rollback':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum
              .rollback;
        case r'uninstall':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnum
              .uninstall;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUpgradeRemediationStrategyEnumTypeTransformer?
      _instance;
}
