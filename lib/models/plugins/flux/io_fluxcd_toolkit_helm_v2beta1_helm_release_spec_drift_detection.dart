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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_drift_detection_ignore_inner.dart';

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection({
    this.ignore = const [],
    this.mode,
  });

  /// Ignore contains a list of rules for specifying which changes to ignore during diffing.
  List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionIgnoreInner>
      ignore;

  /// Mode defines how differences should be handled between the Helm manifest and the manifest currently applied to the cluster. If not explicitly set, it defaults to DiffModeDisabled.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum? mode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection &&
          deepEquality.equals(other.ignore, ignore) &&
          other.mode == mode;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ignore.hashCode) + (mode == null ? 0 : mode!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection[ignore=$ignore, mode=$mode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'ignore'] = this.ignore;
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection(
        ignore:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionIgnoreInner
                .listFromJson(json[r'ignore']),
        mode: IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum
            .fromJson(json[r'mode']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetection
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

/// Mode defines how differences should be handled between the Helm manifest and the manifest currently applied to the cluster. If not explicitly set, it defaults to DiffModeDisabled.
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const enabled =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum._(
          r'enabled');
  static const warn =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum._(
          r'warn');
  static const disabled =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum._(
          r'disabled');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum>[
    enabled,
    warn,
    disabled,
  ];

  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum].
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'enabled':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum
              .enabled;
        case r'warn':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum
              .warn;
        case r'disabled':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnum
              .disabled;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecDriftDetectionModeEnumTypeTransformer?
      _instance;
}
