//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiAdmissionregistrationV1ValidatingWebhook {
  /// Returns a new [IoK8sApiAdmissionregistrationV1ValidatingWebhook] instance.
  IoK8sApiAdmissionregistrationV1ValidatingWebhook({
    this.admissionReviewVersions = const [],
    required this.clientConfig,
    this.failurePolicy,
    this.matchPolicy,
    required this.name,
    this.namespaceSelector,
    this.objectSelector,
    this.rules = const [],
    required this.sideEffects,
    this.timeoutSeconds,
  });

  /// AdmissionReviewVersions is an ordered list of preferred `AdmissionReview` versions the Webhook expects. API server will try to use first version in the list which it supports. If none of the versions specified in this list supported by API server, validation will fail for this object. If a persisted webhook configuration specifies allowed versions and does not include any versions known to the API Server, calls to the webhook will fail and be subject to the failure policy.
  List<String> admissionReviewVersions;

  IoK8sApiAdmissionregistrationV1WebhookClientConfig clientConfig;

  /// FailurePolicy defines how unrecognized errors from the admission endpoint are handled - allowed values are Ignore or Fail. Defaults to Fail.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? failurePolicy;

  /// matchPolicy defines how the \"rules\" list is used to match incoming requests. Allowed values are \"Exact\" or \"Equivalent\".  - Exact: match a request only if it exactly matches a specified rule. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but \"rules\" only included `apiGroups:[\"apps\"], apiVersions:[\"v1\"], resources: [\"deployments\"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to the webhook.  - Equivalent: match a request if modifies a resource listed in rules, even via another API group or version. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, and \"rules\" only included `apiGroups:[\"apps\"], apiVersions:[\"v1\"], resources: [\"deployments\"]`, a request to apps/v1beta1 or extensions/v1beta1 would be converted to apps/v1 and sent to the webhook.  Defaults to \"Equivalent\"
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? matchPolicy;

  /// The name of the admission webhook. Name should be fully qualified, e.g., imagepolicy.kubernetes.io, where \"imagepolicy\" is the name of the webhook, and kubernetes.io is the name of the organization. Required.
  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? namespaceSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? objectSelector;

  /// Rules describes what operations on what resources/subresources the webhook cares about. The webhook cares about an operation if it matches _any_ Rule. However, in order to prevent ValidatingAdmissionWebhooks and MutatingAdmissionWebhooks from putting the cluster in a state which cannot be recovered from without completely disabling the plugin, ValidatingAdmissionWebhooks and MutatingAdmissionWebhooks are never called on admission requests for ValidatingWebhookConfiguration and MutatingWebhookConfiguration objects.
  List<IoK8sApiAdmissionregistrationV1RuleWithOperations> rules;

  /// SideEffects states whether this webhook has side effects. Acceptable values are: None, NoneOnDryRun (webhooks created via v1beta1 may also specify Some or Unknown). Webhooks with side effects MUST implement a reconciliation system, since a request may be rejected by a future step in the admission chain and the side effects therefore need to be undone. Requests with the dryRun attribute will be auto-rejected if they match a webhook with sideEffects == Unknown or Some.
  String sideEffects;

  /// TimeoutSeconds specifies the timeout for this webhook. After the timeout passes, the webhook call will be ignored or the API call will fail based on the failure policy. The timeout value must be between 1 and 30 seconds. Default to 10 seconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? timeoutSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAdmissionregistrationV1ValidatingWebhook &&
          other.admissionReviewVersions == admissionReviewVersions &&
          other.clientConfig == clientConfig &&
          other.failurePolicy == failurePolicy &&
          other.matchPolicy == matchPolicy &&
          other.name == name &&
          other.namespaceSelector == namespaceSelector &&
          other.objectSelector == objectSelector &&
          other.rules == rules &&
          other.sideEffects == sideEffects &&
          other.timeoutSeconds == timeoutSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (admissionReviewVersions.hashCode) +
      (clientConfig.hashCode) +
      (failurePolicy == null ? 0 : failurePolicy!.hashCode) +
      (matchPolicy == null ? 0 : matchPolicy!.hashCode) +
      (name.hashCode) +
      (namespaceSelector == null ? 0 : namespaceSelector!.hashCode) +
      (objectSelector == null ? 0 : objectSelector!.hashCode) +
      (rules.hashCode) +
      (sideEffects.hashCode) +
      (timeoutSeconds == null ? 0 : timeoutSeconds!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAdmissionregistrationV1ValidatingWebhook[admissionReviewVersions=$admissionReviewVersions, clientConfig=$clientConfig, failurePolicy=$failurePolicy, matchPolicy=$matchPolicy, name=$name, namespaceSelector=$namespaceSelector, objectSelector=$objectSelector, rules=$rules, sideEffects=$sideEffects, timeoutSeconds=$timeoutSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'admissionReviewVersions'] = admissionReviewVersions;
    json[r'clientConfig'] = clientConfig;
    if (failurePolicy != null) {
      json[r'failurePolicy'] = failurePolicy;
    }
    if (matchPolicy != null) {
      json[r'matchPolicy'] = matchPolicy;
    }
    json[r'name'] = name;
    if (namespaceSelector != null) {
      json[r'namespaceSelector'] = namespaceSelector;
    }
    if (objectSelector != null) {
      json[r'objectSelector'] = objectSelector;
    }
    json[r'rules'] = rules;
    json[r'sideEffects'] = sideEffects;
    if (timeoutSeconds != null) {
      json[r'timeoutSeconds'] = timeoutSeconds;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAdmissionregistrationV1ValidatingWebhook] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAdmissionregistrationV1ValidatingWebhook? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAdmissionregistrationV1ValidatingWebhook[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAdmissionregistrationV1ValidatingWebhook[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAdmissionregistrationV1ValidatingWebhook(
        admissionReviewVersions: json[r'admissionReviewVersions'] is List
            ? (json[r'admissionReviewVersions'] as List).cast<String>()
            : const [],
        clientConfig:
            IoK8sApiAdmissionregistrationV1WebhookClientConfig.fromJson(
                json[r'clientConfig'])!,
        failurePolicy: mapValueOfType<String>(json, r'failurePolicy'),
        matchPolicy: mapValueOfType<String>(json, r'matchPolicy'),
        name: mapValueOfType<String>(json, r'name')!,
        namespaceSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'namespaceSelector']),
        objectSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'objectSelector']),
        rules: IoK8sApiAdmissionregistrationV1RuleWithOperations.listFromJson(
                json[r'rules']) ??
            const [],
        sideEffects: mapValueOfType<String>(json, r'sideEffects')!,
        timeoutSeconds: mapValueOfType<int>(json, r'timeoutSeconds'),
      );
    }
    return null;
  }

  static List<IoK8sApiAdmissionregistrationV1ValidatingWebhook>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAdmissionregistrationV1ValidatingWebhook>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAdmissionregistrationV1ValidatingWebhook.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAdmissionregistrationV1ValidatingWebhook>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAdmissionregistrationV1ValidatingWebhook>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAdmissionregistrationV1ValidatingWebhook.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAdmissionregistrationV1ValidatingWebhook-objects as value to a dart map
  static Map<String, List<IoK8sApiAdmissionregistrationV1ValidatingWebhook>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAdmissionregistrationV1ValidatingWebhook>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAdmissionregistrationV1ValidatingWebhook.listFromJson(
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
    'admissionReviewVersions',
    'clientConfig',
    'name',
    'sideEffects',
  };
}
