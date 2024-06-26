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

class IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector] instance.
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector({
    this.mediaType,
    this.operation,
  });

  /// MediaType specifies the OCI media type of the layer which should be extracted from the OCI Artifact. The first layer matching this type is selected.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? mediaType;

  /// Operation specifies how the selected layer should be processed. By default, the layer compressed content is extracted to storage. When the operation is set to 'copy', the layer compressed content is persisted to storage as it is.
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum?
      operation;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector &&
          other.mediaType == mediaType &&
          other.operation == operation;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (mediaType == null ? 0 : mediaType!.hashCode) +
      (operation == null ? 0 : operation!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector[mediaType=$mediaType, operation=$operation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.mediaType != null) {
      json[r'mediaType'] = this.mediaType;
    } else {
      json[r'mediaType'] = null;
    }
    if (this.operation != null) {
      json[r'operation'] = this.operation;
    } else {
      json[r'operation'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector(
        mediaType: mapValueOfType<String>(json, r'mediaType'),
        operation:
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum
                .fromJson(json[r'operation']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelector
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

/// Operation specifies how the selected layer should be processed. By default, the layer compressed content is extracted to storage. When the operation is set to 'copy', the layer compressed content is persisted to storage as it is.
class IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const extract =
      IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum._(
          r'extract');
  static const copy =
      IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum._(
          r'copy');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum].
  static const values =
      <IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum>[
    extract,
    copy,
  ];

  static IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum].
class IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum?
      decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'extract':
          return IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum
              .extract;
        case r'copy':
          return IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnum
              .copy;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta2OCIRepositorySpecLayerSelectorOperationEnumTypeTransformer?
      _instance;
}
