//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiBatchV1beta1CronJobSpec {
  /// Returns a new [IoK8sApiBatchV1beta1CronJobSpec] instance.
  IoK8sApiBatchV1beta1CronJobSpec({
    this.concurrencyPolicy,
    this.failedJobsHistoryLimit,
    required this.jobTemplate,
    required this.schedule,
    this.startingDeadlineSeconds,
    this.successfulJobsHistoryLimit,
    this.suspend,
  });

  /// Specifies how to treat concurrent executions of a Job. Valid values are: - \"Allow\" (default): allows CronJobs to run concurrently; - \"Forbid\": forbids concurrent runs, skipping next run if previous run hasn't finished yet; - \"Replace\": cancels currently running job and replaces it with a new one
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? concurrencyPolicy;

  /// The number of failed finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified. Defaults to 1.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failedJobsHistoryLimit;

  IoK8sApiBatchV1beta1JobTemplateSpec jobTemplate;

  /// The schedule in Cron format, see https://en.wikipedia.org/wiki/Cron.
  String schedule;

  /// Optional deadline in seconds for starting the job if it misses scheduled time for any reason.  Missed jobs executions will be counted as failed ones.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startingDeadlineSeconds;

  /// The number of successful finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified. Defaults to 3.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? successfulJobsHistoryLimit;

  /// This flag tells the controller to suspend subsequent executions, it does not apply to already started executions.  Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1beta1CronJobSpec &&
          other.concurrencyPolicy == concurrencyPolicy &&
          other.failedJobsHistoryLimit == failedJobsHistoryLimit &&
          other.jobTemplate == jobTemplate &&
          other.schedule == schedule &&
          other.startingDeadlineSeconds == startingDeadlineSeconds &&
          other.successfulJobsHistoryLimit == successfulJobsHistoryLimit &&
          other.suspend == suspend;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (concurrencyPolicy == null ? 0 : concurrencyPolicy!.hashCode) +
      (failedJobsHistoryLimit == null ? 0 : failedJobsHistoryLimit!.hashCode) +
      (jobTemplate.hashCode) +
      (schedule.hashCode) +
      (startingDeadlineSeconds == null
          ? 0
          : startingDeadlineSeconds!.hashCode) +
      (successfulJobsHistoryLimit == null
          ? 0
          : successfulJobsHistoryLimit!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode);

  @override
  String toString() =>
      'IoK8sApiBatchV1beta1CronJobSpec[concurrencyPolicy=$concurrencyPolicy, failedJobsHistoryLimit=$failedJobsHistoryLimit, jobTemplate=$jobTemplate, schedule=$schedule, startingDeadlineSeconds=$startingDeadlineSeconds, successfulJobsHistoryLimit=$successfulJobsHistoryLimit, suspend=$suspend]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (concurrencyPolicy != null) {
      json[r'concurrencyPolicy'] = concurrencyPolicy;
    }
    if (failedJobsHistoryLimit != null) {
      json[r'failedJobsHistoryLimit'] = failedJobsHistoryLimit;
    }
    json[r'jobTemplate'] = jobTemplate;
    json[r'schedule'] = schedule;
    if (startingDeadlineSeconds != null) {
      json[r'startingDeadlineSeconds'] = startingDeadlineSeconds;
    }
    if (successfulJobsHistoryLimit != null) {
      json[r'successfulJobsHistoryLimit'] = successfulJobsHistoryLimit;
    }
    if (suspend != null) {
      json[r'suspend'] = suspend;
    }
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1beta1CronJobSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1beta1CronJobSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1beta1CronJobSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1beta1CronJobSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1beta1CronJobSpec(
        concurrencyPolicy: mapValueOfType<String>(json, r'concurrencyPolicy'),
        failedJobsHistoryLimit:
            mapValueOfType<int>(json, r'failedJobsHistoryLimit'),
        jobTemplate:
            IoK8sApiBatchV1beta1JobTemplateSpec.fromJson(json[r'jobTemplate'])!,
        schedule: mapValueOfType<String>(json, r'schedule')!,
        startingDeadlineSeconds:
            mapValueOfType<int>(json, r'startingDeadlineSeconds'),
        successfulJobsHistoryLimit:
            mapValueOfType<int>(json, r'successfulJobsHistoryLimit'),
        suspend: mapValueOfType<bool>(json, r'suspend'),
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1beta1CronJobSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1beta1CronJobSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiBatchV1beta1CronJobSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1beta1CronJobSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiBatchV1beta1CronJobSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1beta1CronJobSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1beta1CronJobSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiBatchV1beta1CronJobSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiBatchV1beta1CronJobSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1beta1CronJobSpec.listFromJson(
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
    'jobTemplate',
    'schedule',
  };
}
