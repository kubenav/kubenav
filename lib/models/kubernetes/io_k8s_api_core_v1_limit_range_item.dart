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

  /// Type of resource that this limit applies to.
  String type;

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
    json[r'default'] = this.default_;
    json[r'defaultRequest'] = this.defaultRequest;
    json[r'max'] = this.max;
    json[r'maxLimitRequestRatio'] = this.maxLimitRequestRatio;
    json[r'min'] = this.min;
    json[r'type'] = this.type;
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
        type: mapValueOfType<String>(json, r'type')!,
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
