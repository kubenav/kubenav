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

class IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical] instance.
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical({
    this.order,
  });

  /// Order specifies the sorting order of the tags. Given the letters of the alphabet as tags, ascending order would select Z, and descending order would select A.
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum? order;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical &&
          other.order == order;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (order == null ? 0 : order!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical[order=$order]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.order != null) {
      json[r'order'] = this.order;
    } else {
      json[r'order'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical(
        order:
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum
                .fromJson(json[r'order']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabetical
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

/// Order specifies the sorting order of the tags. Given the letters of the alphabet as tags, ascending order would select Z, and descending order would select A.
class IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const asc =
      IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum._(
          r'asc');
  static const desc =
      IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum._(
          r'desc');

  /// List of all possible values in this [enum][IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum].
  static const values =
      <IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum>[
    asc,
    desc,
  ];

  static IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum].
class IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnumTypeTransformer {
  factory IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnumTypeTransformer
              ._();

  const IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'asc':
          return IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum
              .asc;
        case r'desc':
          return IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnum
              .desc;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnumTypeTransformer] instance.
  static IoFluxcdToolkitImageV1beta1ImagePolicySpecPolicyAlphabeticalOrderEnumTypeTransformer?
      _instance;
}
