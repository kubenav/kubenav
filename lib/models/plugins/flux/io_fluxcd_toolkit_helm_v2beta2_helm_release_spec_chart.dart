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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_chart_metadata.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta2_helm_release_spec_chart_spec.dart';

class IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart {
  /// Returns a new [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart] instance.
  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart({
    this.metadata,
    required this.spec,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2HelmReleaseSpecChartMetadata? metadata;

  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec spec;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart &&
          other.metadata == metadata &&
          other.spec == spec;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (metadata == null ? 0 : metadata!.hashCode) + (spec.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart[metadata=$metadata, spec=$spec]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.metadata != null) {
      json[r'metadata'] = this.metadata;
    } else {
      json[r'metadata'] = null;
    }
    json[r'spec'] = this.spec;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart(
        metadata: IoFluxcdToolkitHelmV2HelmReleaseSpecChartMetadata.fromJson(
            json[r'metadata']),
        spec: IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec.fromJson(
            json[r'spec'])!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChart.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'spec',
  };
}
