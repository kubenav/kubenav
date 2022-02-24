//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1LimitRangeItem {
  /// Returns a new [IoK8sApiCoreV1LimitRangeItem] instance.
  IoK8sApiCoreV1LimitRangeItem({
    this.default_ = const {},
    this.defaultRequest = const {},
    this.max = const {},
    this.maxLimitRequestRatio = const {},
    this.min = const {},
    required this.type,
  });

  /// Default resource requirement limit value by resource name if resource limit is omitted.
  Map<String, String> default_;

  /// DefaultRequest is the default resource requirement request value by resource name if resource request is omitted.
  Map<String, String> defaultRequest;

  /// Max usage constraints on this kind by resource name.
  Map<String, String> max;

  /// MaxLimitRequestRatio if specified, the named resource must have a request and limit that are both non-zero where limit divided by request is less than or equal to the enumerated value; this represents the max burst for the named resource.
  Map<String, String> maxLimitRequestRatio;

  /// Min usage constraints on this kind by resource name.
  Map<String, String> min;

  /// Type of resource that this limit applies to.  Possible enum values:  - `\"Container\"` Limit that applies to all containers in a namespace  - `\"PersistentVolumeClaim\"` Limit that applies to all persistent volume claims in a namespace  - `\"Pod\"` Limit that applies to all pods in a namespace
  IoK8sApiCoreV1LimitRangeItemTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1LimitRangeItem &&
          other.default_ == default_ &&
          other.defaultRequest == defaultRequest &&
          other.max == max &&
          other.maxLimitRequestRatio == maxLimitRequestRatio &&
          other.min == min &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (default_.hashCode) +
      (defaultRequest.hashCode) +
      (max.hashCode) +
      (maxLimitRequestRatio.hashCode) +
      (min.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1LimitRangeItem[default_=$default_, defaultRequest=$defaultRequest, max=$max, maxLimitRequestRatio=$maxLimitRequestRatio, min=$min, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'default'] = default_;
    json[r'defaultRequest'] = defaultRequest;
    json[r'max'] = max;
    json[r'maxLimitRequestRatio'] = maxLimitRequestRatio;
    json[r'min'] = min;
    json[r'type'] = type;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1LimitRangeItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1LimitRangeItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1LimitRangeItem[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1LimitRangeItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1LimitRangeItem(
        default_: mapCastOfType<String, String>(json, r'default') ?? const {},
        defaultRequest:
            mapCastOfType<String, String>(json, r'defaultRequest') ?? const {},
        max: mapCastOfType<String, String>(json, r'max') ?? const {},
        maxLimitRequestRatio:
            mapCastOfType<String, String>(json, r'maxLimitRequestRatio') ??
                const {},
        min: mapCastOfType<String, String>(json, r'min') ?? const {},
        type: IoK8sApiCoreV1LimitRangeItemTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1LimitRangeItem>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1LimitRangeItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1LimitRangeItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1LimitRangeItem> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1LimitRangeItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1LimitRangeItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1LimitRangeItem-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1LimitRangeItem>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1LimitRangeItem>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1LimitRangeItem.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

/// Type of resource that this limit applies to.  Possible enum values:  - `\"Container\"` Limit that applies to all containers in a namespace  - `\"PersistentVolumeClaim\"` Limit that applies to all persistent volume claims in a namespace  - `\"Pod\"` Limit that applies to all pods in a namespace
class IoK8sApiCoreV1LimitRangeItemTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1LimitRangeItemTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const container = IoK8sApiCoreV1LimitRangeItemTypeEnum._(r'Container');
  static const persistentVolumeClaim =
      IoK8sApiCoreV1LimitRangeItemTypeEnum._(r'PersistentVolumeClaim');
  static const pod = IoK8sApiCoreV1LimitRangeItemTypeEnum._(r'Pod');

  /// List of all possible values in this [enum][IoK8sApiCoreV1LimitRangeItemTypeEnum].
  static const values = <IoK8sApiCoreV1LimitRangeItemTypeEnum>[
    container,
    persistentVolumeClaim,
    pod,
  ];

  static IoK8sApiCoreV1LimitRangeItemTypeEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1LimitRangeItemTypeEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1LimitRangeItemTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1LimitRangeItemTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1LimitRangeItemTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1LimitRangeItemTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1LimitRangeItemTypeEnum].
class IoK8sApiCoreV1LimitRangeItemTypeEnumTypeTransformer {
  factory IoK8sApiCoreV1LimitRangeItemTypeEnumTypeTransformer() => _instance ??=
      const IoK8sApiCoreV1LimitRangeItemTypeEnumTypeTransformer._();

  const IoK8sApiCoreV1LimitRangeItemTypeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1LimitRangeItemTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1LimitRangeItemTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1LimitRangeItemTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Container':
          return IoK8sApiCoreV1LimitRangeItemTypeEnum.container;
        case r'PersistentVolumeClaim':
          return IoK8sApiCoreV1LimitRangeItemTypeEnum.persistentVolumeClaim;
        case r'Pod':
          return IoK8sApiCoreV1LimitRangeItemTypeEnum.pod;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1LimitRangeItemTypeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1LimitRangeItemTypeEnumTypeTransformer? _instance;
}
