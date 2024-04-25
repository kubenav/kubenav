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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta1_helm_release_spec_chart_spec_verify.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta2_helm_release_spec_chart_spec_source_ref.dart';

class IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec {
  /// Returns a new [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec] instance.
  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec({
    required this.chart,
    this.interval,
    this.reconcileStrategy,
    required this.sourceRef,
    this.valuesFile,
    this.valuesFiles = const [],
    this.verify,
    this.version,
  });

  /// The name or path the Helm chart is available at in the SourceRef.
  String chart;

  /// Interval at which to check the v1.Source for updates. Defaults to 'HelmReleaseSpec.Interval'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? interval;

  /// Determines what enables the creation of a new artifact. Valid values are ('ChartVersion', 'Revision'). See the documentation of the values for an explanation on their behavior. Defaults to ChartVersion when omitted.
  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum?
      reconcileStrategy;

  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecSourceRef sourceRef;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecVerify? verify;

  /// Version semver expression, ignored for charts from v1beta2.GitRepository and v1beta2.Bucket sources. Defaults to latest when omitted.
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
      other is IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec &&
          other.chart == chart &&
          other.interval == interval &&
          other.reconcileStrategy == reconcileStrategy &&
          other.sourceRef == sourceRef &&
          other.valuesFile == valuesFile &&
          deepEquality.equals(other.valuesFiles, valuesFiles) &&
          other.verify == verify &&
          other.version == version;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (chart.hashCode) +
      (interval == null ? 0 : interval!.hashCode) +
      (reconcileStrategy == null ? 0 : reconcileStrategy!.hashCode) +
      (sourceRef.hashCode) +
      (valuesFile == null ? 0 : valuesFile!.hashCode) +
      (valuesFiles.hashCode) +
      (verify == null ? 0 : verify!.hashCode) +
      (version == null ? 0 : version!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec[chart=$chart, interval=$interval, reconcileStrategy=$reconcileStrategy, sourceRef=$sourceRef, valuesFile=$valuesFile, valuesFiles=$valuesFiles, verify=$verify, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'chart'] = this.chart;
    if (this.interval != null) {
      json[r'interval'] = this.interval;
    } else {
      json[r'interval'] = null;
    }
    if (this.reconcileStrategy != null) {
      json[r'reconcileStrategy'] = this.reconcileStrategy;
    } else {
      json[r'reconcileStrategy'] = null;
    }
    json[r'sourceRef'] = this.sourceRef;
    if (this.valuesFile != null) {
      json[r'valuesFile'] = this.valuesFile;
    } else {
      json[r'valuesFile'] = null;
    }
    json[r'valuesFiles'] = this.valuesFiles;
    if (this.verify != null) {
      json[r'verify'] = this.verify;
    } else {
      json[r'verify'] = null;
    }
    if (this.version != null) {
      json[r'version'] = this.version;
    } else {
      json[r'version'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec(
        chart: mapValueOfType<String>(json, r'chart')!,
        interval: mapValueOfType<String>(json, r'interval'),
        reconcileStrategy:
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum
                .fromJson(json[r'reconcileStrategy']),
        sourceRef: IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecSourceRef
            .fromJson(json[r'sourceRef'])!,
        valuesFile: mapValueOfType<String>(json, r'valuesFile'),
        valuesFiles: json[r'valuesFiles'] is Iterable
            ? (json[r'valuesFiles'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        verify:
            IoFluxcdToolkitHelmV2beta1HelmReleaseSpecChartSpecVerify.fromJson(
                json[r'verify']),
        version: mapValueOfType<String>(json, r'version'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpec.listFromJson(
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
    'sourceRef',
  };
}

/// Determines what enables the creation of a new artifact. Valid values are ('ChartVersion', 'Revision'). See the documentation of the values for an explanation on their behavior. Defaults to ChartVersion when omitted.
class IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const chartVersion =
      IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum._(
          r'ChartVersion');
  static const revision =
      IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum._(
          r'Revision');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum>[
    chartVersion,
    revision,
  ];

  static IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum].
class IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum?
      decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ChartVersion':
          return IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum
              .chartVersion;
        case r'Revision':
          return IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnum
              .revision;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta2HelmReleaseSpecChartSpecReconcileStrategyEnumTypeTransformer?
      _instance;
}
