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
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_pod_failure_policy.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_template_spec.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';

class IoK8sApiBatchV1JobSpec {
  /// Returns a new [IoK8sApiBatchV1JobSpec] instance.
  IoK8sApiBatchV1JobSpec({
    this.activeDeadlineSeconds,
    this.backoffLimit,
    this.completionMode,
    this.completions,
    this.manualSelector,
    this.parallelism,
    this.podFailurePolicy,
    this.selector,
    this.suspend,
    required this.template,
    this.ttlSecondsAfterFinished,
  });

  /// Specifies the duration in seconds relative to the startTime that the job may be continuously active before the system tries to terminate it; value must be positive integer. If a Job is suspended (at creation or through an update), this timer will effectively be stopped and reset when the Job is resumed again.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? activeDeadlineSeconds;

  /// Specifies the number of retries before marking this job failed. Defaults to 6
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? backoffLimit;

  /// CompletionMode specifies how Pod completions are tracked. It can be `NonIndexed` (default) or `Indexed`.  `NonIndexed` means that the Job is considered complete when there have been .spec.completions successfully completed Pods. Each Pod completion is homologous to each other.  `Indexed` means that the Pods of a Job get an associated completion index from 0 to (.spec.completions - 1), available in the annotation batch.kubernetes.io/job-completion-index. The Job is considered complete when there is one successfully completed Pod for each index. When value is `Indexed`, .spec.completions must be specified and `.spec.parallelism` must be less than or equal to 10^5. In addition, The Pod name takes the form `$(job-name)-$(index)-$(random-string)`, the Pod hostname takes the form `$(job-name)-$(index)`.  More completion modes can be added in the future. If the Job controller observes a mode that it doesn't recognize, which is possible during upgrades due to version skew, the controller skips updates for the Job.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? completionMode;

  /// Specifies the desired number of successfully finished pods the job should be run with.  Setting to nil means that the success of any pod signals the success of all pods, and allows parallelism to have any positive value.  Setting to 1 means that parallelism is limited to 1 and the success of that pod signals the success of the job. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? completions;

  /// manualSelector controls generation of pod labels and pod selectors. Leave `manualSelector` unset unless you are certain what you are doing. When false or unset, the system pick labels unique to this job and appends those labels to the pod template.  When true, the user is responsible for picking unique labels and specifying the selector.  Failure to pick a unique label may cause this and other jobs to not function correctly.  However, You may see `manualSelector=true` in jobs that were created with the old `extensions/v1beta1` API. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/#specifying-your-own-pod-selector
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? manualSelector;

  /// Specifies the maximum desired number of pods the job should run at any given time. The actual number of pods running in steady state will be less than this number when ((.spec.completions - .status.successful) < .spec.parallelism), i.e. when the work left to do is less than max parallelism. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? parallelism;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiBatchV1PodFailurePolicy? podFailurePolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? selector;

  /// Suspend specifies whether the Job controller should create Pods or not. If a Job is created with suspend set to true, no Pods are created by the Job controller. If a Job is suspended after creation (i.e. the flag goes from false to true), the Job controller will delete all active Pods associated with this Job. Users must design their workload to gracefully handle this. Suspending a Job will reset the StartTime field of the Job, effectively resetting the ActiveDeadlineSeconds timer too. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  IoK8sApiCoreV1PodTemplateSpec template;

  /// ttlSecondsAfterFinished limits the lifetime of a Job that has finished execution (either Complete or Failed). If this field is set, ttlSecondsAfterFinished after the Job finishes, it is eligible to be automatically deleted. When the Job is being deleted, its lifecycle guarantees (e.g. finalizers) will be honored. If this field is unset, the Job won't be automatically deleted. If this field is set to zero, the Job becomes eligible to be deleted immediately after it finishes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? ttlSecondsAfterFinished;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiBatchV1JobSpec &&
          other.activeDeadlineSeconds == activeDeadlineSeconds &&
          other.backoffLimit == backoffLimit &&
          other.completionMode == completionMode &&
          other.completions == completions &&
          other.manualSelector == manualSelector &&
          other.parallelism == parallelism &&
          other.podFailurePolicy == podFailurePolicy &&
          other.selector == selector &&
          other.suspend == suspend &&
          other.template == template &&
          other.ttlSecondsAfterFinished == ttlSecondsAfterFinished;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (activeDeadlineSeconds == null ? 0 : activeDeadlineSeconds!.hashCode) +
      (backoffLimit == null ? 0 : backoffLimit!.hashCode) +
      (completionMode == null ? 0 : completionMode!.hashCode) +
      (completions == null ? 0 : completions!.hashCode) +
      (manualSelector == null ? 0 : manualSelector!.hashCode) +
      (parallelism == null ? 0 : parallelism!.hashCode) +
      (podFailurePolicy == null ? 0 : podFailurePolicy!.hashCode) +
      (selector == null ? 0 : selector!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (template.hashCode) +
      (ttlSecondsAfterFinished == null ? 0 : ttlSecondsAfterFinished!.hashCode);

  @override
  String toString() =>
      'IoK8sApiBatchV1JobSpec[activeDeadlineSeconds=$activeDeadlineSeconds, backoffLimit=$backoffLimit, completionMode=$completionMode, completions=$completions, manualSelector=$manualSelector, parallelism=$parallelism, podFailurePolicy=$podFailurePolicy, selector=$selector, suspend=$suspend, template=$template, ttlSecondsAfterFinished=$ttlSecondsAfterFinished]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.activeDeadlineSeconds != null) {
      json[r'activeDeadlineSeconds'] = this.activeDeadlineSeconds;
    } else {
      json[r'activeDeadlineSeconds'] = null;
    }
    if (this.backoffLimit != null) {
      json[r'backoffLimit'] = this.backoffLimit;
    } else {
      json[r'backoffLimit'] = null;
    }
    if (this.completionMode != null) {
      json[r'completionMode'] = this.completionMode;
    } else {
      json[r'completionMode'] = null;
    }
    if (this.completions != null) {
      json[r'completions'] = this.completions;
    } else {
      json[r'completions'] = null;
    }
    if (this.manualSelector != null) {
      json[r'manualSelector'] = this.manualSelector;
    } else {
      json[r'manualSelector'] = null;
    }
    if (this.parallelism != null) {
      json[r'parallelism'] = this.parallelism;
    } else {
      json[r'parallelism'] = null;
    }
    if (this.podFailurePolicy != null) {
      json[r'podFailurePolicy'] = this.podFailurePolicy;
    } else {
      json[r'podFailurePolicy'] = null;
    }
    if (this.selector != null) {
      json[r'selector'] = this.selector;
    } else {
      json[r'selector'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    json[r'template'] = this.template;
    if (this.ttlSecondsAfterFinished != null) {
      json[r'ttlSecondsAfterFinished'] = this.ttlSecondsAfterFinished;
    } else {
      json[r'ttlSecondsAfterFinished'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiBatchV1JobSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiBatchV1JobSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiBatchV1JobSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiBatchV1JobSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiBatchV1JobSpec(
        activeDeadlineSeconds:
            mapValueOfType<int>(json, r'activeDeadlineSeconds'),
        backoffLimit: mapValueOfType<int>(json, r'backoffLimit'),
        completionMode: mapValueOfType<String>(json, r'completionMode'),
        completions: mapValueOfType<int>(json, r'completions'),
        manualSelector: mapValueOfType<bool>(json, r'manualSelector'),
        parallelism: mapValueOfType<int>(json, r'parallelism'),
        podFailurePolicy:
            IoK8sApiBatchV1PodFailurePolicy.fromJson(json[r'podFailurePolicy']),
        selector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'selector']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        template: IoK8sApiCoreV1PodTemplateSpec.fromJson(json[r'template'])!,
        ttlSecondsAfterFinished:
            mapValueOfType<int>(json, r'ttlSecondsAfterFinished'),
      );
    }
    return null;
  }

  static List<IoK8sApiBatchV1JobSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiBatchV1JobSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiBatchV1JobSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiBatchV1JobSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiBatchV1JobSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1JobSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiBatchV1JobSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiBatchV1JobSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiBatchV1JobSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiBatchV1JobSpec.listFromJson(
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
    'template',
  };
}
