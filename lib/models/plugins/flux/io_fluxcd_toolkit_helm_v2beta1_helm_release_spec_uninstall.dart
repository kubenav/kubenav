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

class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall({
    this.deletionPropagation,
    this.disableHooks,
    this.disableWait,
    this.keepHistory,
    this.timeout,
  });

  /// DeletionPropagation specifies the deletion propagation policy when a Helm uninstall is performed.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum?
      deletionPropagation;

  /// DisableHooks prevents hooks from running during the Helm rollback action.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableHooks;

  /// DisableWait disables waiting for all the resources to be deleted after a Helm uninstall is performed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disableWait;

  /// KeepHistory tells Helm to remove all associated resources and mark the release as deleted, but retain the release history.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? keepHistory;

  /// Timeout is the time to wait for any individual Kubernetes operation (like Jobs for hooks) during the performance of a Helm uninstall action. Defaults to 'HelmReleaseSpec.Timeout'.
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
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall &&
          other.deletionPropagation == deletionPropagation &&
          other.disableHooks == disableHooks &&
          other.disableWait == disableWait &&
          other.keepHistory == keepHistory &&
          other.timeout == timeout;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (deletionPropagation == null ? 0 : deletionPropagation!.hashCode) +
      (disableHooks == null ? 0 : disableHooks!.hashCode) +
      (disableWait == null ? 0 : disableWait!.hashCode) +
      (keepHistory == null ? 0 : keepHistory!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall[deletionPropagation=$deletionPropagation, disableHooks=$disableHooks, disableWait=$disableWait, keepHistory=$keepHistory, timeout=$timeout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.deletionPropagation != null) {
      json[r'deletionPropagation'] = this.deletionPropagation;
    } else {
      json[r'deletionPropagation'] = null;
    }
    if (this.disableHooks != null) {
      json[r'disableHooks'] = this.disableHooks;
    } else {
      json[r'disableHooks'] = null;
    }
    if (this.disableWait != null) {
      json[r'disableWait'] = this.disableWait;
    } else {
      json[r'disableWait'] = null;
    }
    if (this.keepHistory != null) {
      json[r'keepHistory'] = this.keepHistory;
    } else {
      json[r'keepHistory'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall(
        deletionPropagation:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
                .fromJson(json[r'deletionPropagation']),
        disableHooks: mapValueOfType<bool>(json, r'disableHooks'),
        disableWait: mapValueOfType<bool>(json, r'disableWait'),
        keepHistory: mapValueOfType<bool>(json, r'keepHistory'),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstall.listFromJson(
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

/// DeletionPropagation specifies the deletion propagation policy when a Helm uninstall is performed.
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const background =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
          ._(r'background');
  static const foreground =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
          ._(r'foreground');
  static const orphan =
      IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
          ._(r'orphan');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum>[
    background,
    foreground,
    orphan,
  ];

  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum].
class IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum?
      decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'background':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
              .background;
        case r'foreground':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
              .foreground;
        case r'orphan':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnum
              .orphan;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta1HelmReleaseSpecUninstallDeletionPropagationEnumTypeTransformer?
      _instance;
}
