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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_drift_detection_ignore_inner.dart';

class IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection({
    this.ignore = const [],
    this.mode,
  });

  /// Ignore contains a list of rules for specifying which changes to ignore during diffing.
  List<IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionIgnoreInner> ignore;

  /// Mode defines how differences should be handled between the Helm manifest and the manifest currently applied to the cluster. If not explicitly set, it defaults to DiffModeDisabled.
  IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum? mode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection &&
          deepEquality.equals(other.ignore, ignore) &&
          other.mode == mode;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (ignore.hashCode) + (mode == null ? 0 : mode!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection[ignore=$ignore, mode=$mode]';

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

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection(
        ignore: IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionIgnoreInner
            .listFromJson(json[r'ignore']),
        mode:
            IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum.fromJson(
                json[r'mode']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetection.listFromJson(
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
class IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const enabled =
      IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum._(r'enabled');
  static const warn =
      IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum._(r'warn');
  static const disabled =
      IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum._(r'disabled');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum].
  static const values =
      <IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum>[
    enabled,
    warn,
    disabled,
  ];

  static IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum].
class IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'enabled':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum
              .enabled;
        case r'warn':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum
              .warn;
        case r'disabled':
          return IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnum
              .disabled;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2HelmReleaseSpecDriftDetectionModeEnumTypeTransformer?
      _instance;
}
