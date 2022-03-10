//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoK8sApimachineryPkgVersionInfo {
  /// Returns a new [IoK8sApimachineryPkgVersionInfo] instance.
  IoK8sApimachineryPkgVersionInfo({
    required this.buildDate,
    required this.compiler,
    required this.gitCommit,
    required this.gitTreeState,
    required this.gitVersion,
    required this.goVersion,
    required this.major,
    required this.minor,
    required this.platform,
  });

  String buildDate;

  String compiler;

  String gitCommit;

  String gitTreeState;

  String gitVersion;

  String goVersion;

  String major;

  String minor;

  String platform;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgVersionInfo &&
          other.buildDate == buildDate &&
          other.compiler == compiler &&
          other.gitCommit == gitCommit &&
          other.gitTreeState == gitTreeState &&
          other.gitVersion == gitVersion &&
          other.goVersion == goVersion &&
          other.major == major &&
          other.minor == minor &&
          other.platform == platform;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (buildDate.hashCode) +
      (compiler.hashCode) +
      (gitCommit.hashCode) +
      (gitTreeState.hashCode) +
      (gitVersion.hashCode) +
      (goVersion.hashCode) +
      (major.hashCode) +
      (minor.hashCode) +
      (platform.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgVersionInfo[buildDate=$buildDate, compiler=$compiler, gitCommit=$gitCommit, gitTreeState=$gitTreeState, gitVersion=$gitVersion, goVersion=$goVersion, major=$major, minor=$minor, platform=$platform]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'buildDate'] = buildDate;
    json[r'compiler'] = compiler;
    json[r'gitCommit'] = gitCommit;
    json[r'gitTreeState'] = gitTreeState;
    json[r'gitVersion'] = gitVersion;
    json[r'goVersion'] = goVersion;
    json[r'major'] = major;
    json[r'minor'] = minor;
    json[r'platform'] = platform;
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgVersionInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgVersionInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgVersionInfo[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgVersionInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgVersionInfo(
        buildDate: mapValueOfType<String>(json, r'buildDate')!,
        compiler: mapValueOfType<String>(json, r'compiler')!,
        gitCommit: mapValueOfType<String>(json, r'gitCommit')!,
        gitTreeState: mapValueOfType<String>(json, r'gitTreeState')!,
        gitVersion: mapValueOfType<String>(json, r'gitVersion')!,
        goVersion: mapValueOfType<String>(json, r'goVersion')!,
        major: mapValueOfType<String>(json, r'major')!,
        minor: mapValueOfType<String>(json, r'minor')!,
        platform: mapValueOfType<String>(json, r'platform')!,
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgVersionInfo>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgVersionInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgVersionInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgVersionInfo> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgVersionInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgVersionInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgVersionInfo-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgVersionInfo>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgVersionInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgVersionInfo.listFromJson(
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
    'buildDate',
    'compiler',
    'gitCommit',
    'gitTreeState',
    'gitVersion',
    'goVersion',
    'major',
    'minor',
    'platform',
  };
}
