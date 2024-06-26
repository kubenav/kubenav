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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta1_bucket_spec_access_from.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta1_helm_chart_spec_source_ref.dart';

class IoFluxcdToolkitSourceV1beta1HelmChartSpec {
  /// Returns a new [IoFluxcdToolkitSourceV1beta1HelmChartSpec] instance.
  IoFluxcdToolkitSourceV1beta1HelmChartSpec({
    this.accessFrom,
    required this.chart,
    required this.interval,
    this.reconcileStrategy,
    required this.sourceRef,
    this.suspend,
    this.valuesFile,
    this.valuesFiles = const [],
    this.version,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta1BucketSpecAccessFrom? accessFrom;

  /// The name or path the Helm chart is available at in the SourceRef.
  String chart;

  /// The interval at which to check the Source for updates.
  String interval;

  /// Determines what enables the creation of a new artifact. Valid values are ('ChartVersion', 'Revision'). See the documentation of the values for an explanation on their behavior. Defaults to ChartVersion when omitted.
  IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum?
      reconcileStrategy;

  IoFluxcdToolkitSourceV1beta1HelmChartSpecSourceRef sourceRef;

  /// This flag tells the controller to suspend the reconciliation of this source.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Alternative values file to use as the default chart values, expected to be a relative path in the SourceRef. Deprecated in favor of ValuesFiles, for backwards compatibility the file defined here is merged before the ValuesFiles items. Ignored when omitted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? valuesFile;

  /// Alternative list of values files to use as the chart values (values.yaml is not included by default), expected to be a relative path in the SourceRef. Values files are merged in the order of this list with the last file overriding the first. Ignored when omitted.
  List<String> valuesFiles;

  /// The chart version semver expression, ignored for charts from GitRepository and Bucket sources. Defaults to latest when omitted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta1HelmChartSpec &&
          other.accessFrom == accessFrom &&
          other.chart == chart &&
          other.interval == interval &&
          other.reconcileStrategy == reconcileStrategy &&
          other.sourceRef == sourceRef &&
          other.suspend == suspend &&
          other.valuesFile == valuesFile &&
          deepEquality.equals(other.valuesFiles, valuesFiles) &&
          other.version == version;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessFrom == null ? 0 : accessFrom!.hashCode) +
      (chart.hashCode) +
      (interval.hashCode) +
      (reconcileStrategy == null ? 0 : reconcileStrategy!.hashCode) +
      (sourceRef.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (valuesFile == null ? 0 : valuesFile!.hashCode) +
      (valuesFiles.hashCode) +
      (version == null ? 0 : version!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta1HelmChartSpec[accessFrom=$accessFrom, chart=$chart, interval=$interval, reconcileStrategy=$reconcileStrategy, sourceRef=$sourceRef, suspend=$suspend, valuesFile=$valuesFile, valuesFiles=$valuesFiles, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessFrom != null) {
      json[r'accessFrom'] = this.accessFrom;
    } else {
      json[r'accessFrom'] = null;
    }
    json[r'chart'] = this.chart;
    json[r'interval'] = this.interval;
    if (this.reconcileStrategy != null) {
      json[r'reconcileStrategy'] = this.reconcileStrategy;
    } else {
      json[r'reconcileStrategy'] = null;
    }
    json[r'sourceRef'] = this.sourceRef;
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.valuesFile != null) {
      json[r'valuesFile'] = this.valuesFile;
    } else {
      json[r'valuesFile'] = null;
    }
    json[r'valuesFiles'] = this.valuesFiles;
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta1HelmChartSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta1HelmChartSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta1HelmChartSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta1HelmChartSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta1HelmChartSpec(
        accessFrom: IoFluxcdToolkitSourceV1beta1BucketSpecAccessFrom.fromJson(
            json[r'accessFrom']),
        chart: mapValueOfType<String>(json, r'chart')!,
        interval: mapValueOfType<String>(json, r'interval')!,
        reconcileStrategy:
            IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum
                .fromJson(json[r'reconcileStrategy']),
        sourceRef: IoFluxcdToolkitSourceV1beta1HelmChartSpecSourceRef.fromJson(
            json[r'sourceRef'])!,
        suspend: mapValueOfType<bool>(json, r'suspend'),
        valuesFile: mapValueOfType<String>(json, r'valuesFile'),
        valuesFiles: json[r'valuesFiles'] is Iterable
            ? (json[r'valuesFiles'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        version: mapValueOfType<String>(json, r'version'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta1HelmChartSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta1HelmChartSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitSourceV1beta1HelmChartSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta1HelmChartSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta1HelmChartSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta1HelmChartSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta1HelmChartSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta1HelmChartSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1beta1HelmChartSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitSourceV1beta1HelmChartSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'chart',
    'interval',
    'sourceRef',
  };
}

/// Determines what enables the creation of a new artifact. Valid values are ('ChartVersion', 'Revision'). See the documentation of the values for an explanation on their behavior. Defaults to ChartVersion when omitted.
class IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const chartVersion =
      IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum._(
          r'ChartVersion');
  static const revision =
      IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum._(
          r'Revision');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum].
  static const values =
      <IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum>[
    chartVersion,
    revision,
  ];

  static IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum].
class IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ChartVersion':
          return IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum
              .chartVersion;
        case r'Revision':
          return IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnum
              .revision;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta1HelmChartSpecReconcileStrategyEnumTypeTransformer?
      _instance;
}
