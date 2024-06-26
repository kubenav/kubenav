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

class IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult {
  /// Returns a new [IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult] instance.
  IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult({
    this.latestTags = const [],
    this.scanTime,
    required this.tagCount,
  });

  List<String> latestTags;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? scanTime;

  int tagCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult &&
          deepEquality.equals(other.latestTags, latestTags) &&
          other.scanTime == scanTime &&
          other.tagCount == tagCount;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (latestTags.hashCode) +
      (scanTime == null ? 0 : scanTime!.hashCode) +
      (tagCount.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult[latestTags=$latestTags, scanTime=$scanTime, tagCount=$tagCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'latestTags'] = this.latestTags;
    if (this.scanTime != null) {
      json[r'scanTime'] = this.scanTime!.toUtc().toIso8601String();
    } else {
      json[r'scanTime'] = null;
    }
    json[r'tagCount'] = this.tagCount;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult(
        latestTags: json[r'latestTags'] is Iterable
            ? (json[r'latestTags'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        scanTime: mapDateTime(json, r'scanTime', r''),
        tagCount: mapValueOfType<int>(json, r'tagCount')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta2ImageRepositoryStatusLastScanResult
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
    'tagCount',
  };
}
