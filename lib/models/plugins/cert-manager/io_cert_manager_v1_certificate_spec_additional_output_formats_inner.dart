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

class IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner {
  /// Returns a new [IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner] instance.
  IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner({
    required this.type,
  });

  /// Type is the name of the format type that should be written to the Certificate's target Secret.
  IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (type.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner[type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner(
        type: IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum
            .fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner-objects as value to a dart map
  static Map<String,
          List<IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1CertificateSpecAdditionalOutputFormatsInner
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
    'type',
  };
}

/// Type is the name of the format type that should be written to the Certificate's target Secret.
class IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const DER =
      IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum._(
          r'DER');
  static const combinedPEM =
      IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum._(
          r'CombinedPEM');

  /// List of all possible values in this [enum][IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum].
  static const values =
      <IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum>[
    DER,
    combinedPEM,
  ];

  static IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum?
      fromJson(dynamic value) =>
          IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnumTypeTransformer()
              .decode(value);

  static List<
          IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum].
class IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnumTypeTransformer {
  factory IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnumTypeTransformer
              ._();

  const IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnumTypeTransformer._();

  String encode(
          IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'DER':
          return IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum
              .DER;
        case r'CombinedPEM':
          return IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnum
              .combinedPEM;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnumTypeTransformer] instance.
  static IoCertManagerV1CertificateSpecAdditionalOutputFormatsInnerTypeEnumTypeTransformer?
      _instance;
}
