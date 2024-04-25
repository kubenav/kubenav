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

class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate] instance.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate({
    this.path,
    required this.strategy,
  });

  /// Path to the directory containing the manifests to be updated. Defaults to 'None', which translates to the root path of the GitRepositoryRef.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// Strategy names the strategy to be used.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum
      strategy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate &&
          other.path == path &&
          other.strategy == strategy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (path == null ? 0 : path!.hashCode) + (strategy.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate[path=$path, strategy=$strategy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    json[r'strategy'] = this.strategy;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate(
        path: mapValueOfType<String>(json, r'path'),
        strategy:
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum
                .fromJson(json[r'strategy'])!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdate
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'strategy',
  };
}

/// Strategy names the strategy to be used.
class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const setters =
      IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum._(
          r'Setters');

  /// List of all possible values in this [enum][IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum].
  static const values =
      <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum>[
    setters,
  ];

  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum].
class IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnumTypeTransformer {
  factory IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnumTypeTransformer
              ._();

  const IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum?
      decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'Setters':
          return IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnum
              .setters;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnumTypeTransformer] instance.
  static IoFluxcdToolkitImageV1beta1ImageUpdateAutomationSpecUpdateStrategyEnumTypeTransformer?
      _instance;
}
