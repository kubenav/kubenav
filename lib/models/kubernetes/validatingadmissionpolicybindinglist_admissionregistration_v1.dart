import 'package:json_annotation/json_annotation.dart';

part 'validatingadmissionpolicybindinglist_admissionregistration_v1.g.dart';

///ValidatingAdmissionPolicyBindingList is a list of ValidatingAdmissionPolicyBinding.
@JsonSerializable()
class ValidatingadmissionpolicybindinglistAdmissionregistrationV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of PolicyBinding.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ValidatingadmissionpolicybindinglistAdmissionregistrationV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata? metadata;

  ValidatingadmissionpolicybindinglistAdmissionregistrationV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ValidatingadmissionpolicybindinglistAdmissionregistrationV1.fromJson(
    Map<String, dynamic> json,
  ) => _$ValidatingadmissionpolicybindinglistAdmissionregistrationV1FromJson(
    json,
  );

  Map<String, dynamic> toJson() =>
      _$ValidatingadmissionpolicybindinglistAdmissionregistrationV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('admissionregistration.k8s.io/v1')
  ADMISSIONREGISTRATION_K8_S_IO_V1,
}

final apiVersionValues = EnumValues({
  'admissionregistration.k8s.io/v1':
      ApiVersion.ADMISSIONREGISTRATION_K8_S_IO_V1,
});

@JsonSerializable()
class Item {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ItemKind? kind;

  ///ObjectMeta is metadata that all persisted resources must have, which includes all objects
  ///users must create.
  @JsonKey(name: 'metadata')
  ItemMetadata? metadata;

  ///ValidatingAdmissionPolicyBindingSpec is the specification of the
  ///ValidatingAdmissionPolicyBinding.
  @JsonKey(name: 'spec')
  Spec? spec;

  Item({this.apiVersion, this.kind, this.metadata, this.spec});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('ValidatingAdmissionPolicyBinding')
  VALIDATING_ADMISSION_POLICY_BINDING,
}

final itemKindValues = EnumValues({
  'ValidatingAdmissionPolicyBinding':
      ItemKind.VALIDATING_ADMISSION_POLICY_BINDING,
});

@JsonSerializable()
class ItemMetadata {
  ///Annotations is an unstructured key value map stored with a resource that may be set by
  ///external tools to store and retrieve arbitrary metadata. They are not queryable and
  ///should be preserved when modifying objects. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'creationTimestamp')
  DateTime? creationTimestamp;

  ///Number of seconds allowed for this object to gracefully terminate before it will be
  ///removed from the system. Only set when deletionTimestamp is also set. May only be
  ///shortened. Read-only.
  @JsonKey(name: 'deletionGracePeriodSeconds')
  int? deletionGracePeriodSeconds;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'deletionTimestamp')
  DateTime? deletionTimestamp;

  ///Must be empty before the object is deleted from the registry. Each entry is an identifier
  ///for the responsible component that will remove the entry from the list. If the
  ///deletionTimestamp of the object is non-nil, entries in this list can only be removed.
  ///Finalizers may be processed and removed in any order.  Order is NOT enforced because it
  ///introduces significant risk of stuck finalizers. finalizers is a shared field, any actor
  ///with permission can reorder it. If the finalizer list is processed in order, then this
  ///can lead to a situation in which the component responsible for the first finalizer in the
  ///list is waiting for a signal (field value, external system, or other) produced by a
  ///component responsible for a finalizer later in the list, resulting in a deadlock. Without
  ///enforced ordering finalizers are free to order amongst themselves and are not vulnerable
  ///to ordering changes in the list.
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;

  ///GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF
  ///the Name field has not been provided. If this field is used, the name returned to the
  ///client will be different than the name passed. This value will also be combined with a
  ///unique suffix. The provided value has the same validation rules as the Name field, and
  ///may be truncated by the length of the suffix required to make the value unique on the
  ///server.
  ///
  ///If this field is specified and the generated name exists, the server will return a 409.
  ///
  ///Applied only if Name is not specified. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
  @JsonKey(name: 'generateName')
  String? generateName;

  ///A sequence number representing a specific generation of the desired state. Populated by
  ///the system. Read-only.
  @JsonKey(name: 'generation')
  int? generation;

  ///Map of string keys and values that can be used to organize and categorize (scope and
  ///select) objects. May match selectors of replication controllers and services. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/labels
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ///ManagedFields maps workflow-id and version to the set of fields that are managed by that
  ///workflow. This is mostly for internal housekeeping, and users typically shouldn't need to
  ///set or understand this field. A workflow can be the user's name, a controller's name, or
  ///the name of a specific apply path like "ci-cd". The set of fields is always in the
  ///version that the workflow used when modifying the object.
  @JsonKey(name: 'managedFields')
  List<ManagedField?>? managedFields;

  ///Name must be unique within a namespace. Is required when creating resources, although
  ///some resources may allow a client to request the generation of an appropriate name
  ///automatically. Name is primarily intended for creation idempotence and configuration
  ///definition. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
  @JsonKey(name: 'name')
  String? name;

  ///Namespace defines the space within which each name must be unique. An empty namespace is
  ///equivalent to the "default" namespace, but "default" is the canonical representation. Not
  ///all objects are required to be scoped to a namespace - the value of this field for those
  ///objects will be empty.
  ///
  ///Must be a DNS_LABEL. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces
  @JsonKey(name: 'namespace')
  String? namespace;

  ///List of objects depended by this object. If ALL objects in the list have been deleted,
  ///this object will be garbage collected. If this object is managed by a controller, then an
  ///entry in this list will point to this controller, with the controller field set to true.
  ///There cannot be more than one managing controller.
  @JsonKey(name: 'ownerReferences')
  List<OwnerReference?>? ownerReferences;

  ///An opaque value that represents the internal version of this object that can be used by
  ///clients to determine when objects have changed. May be used for optimistic concurrency,
  ///change detection, and the watch operation on a resource or set of resources. Clients must
  ///treat these values as opaque and passed unmodified back to the server. They may only be
  ///valid for a particular resource or set of resources.
  ///
  ///Populated by the system. Read-only. Value must be treated as opaque by clients and . More
  ///info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///Deprecated: selfLink is a legacy read-only field that is no longer populated by the
  ///system.
  @JsonKey(name: 'selfLink')
  String? selfLink;

  ///UID is the unique in time and space value for this object. It is typically generated by
  ///the server on successful creation of a resource and is not allowed to change on PUT
  ///operations.
  ///
  ///Populated by the system. Read-only. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#uids
  @JsonKey(name: 'uid')
  String? uid;

  ItemMetadata({
    this.annotations,
    this.creationTimestamp,
    this.deletionGracePeriodSeconds,
    this.deletionTimestamp,
    this.finalizers,
    this.generateName,
    this.generation,
    this.labels,
    this.managedFields,
    this.name,
    this.namespace,
    this.ownerReferences,
    this.resourceVersion,
    this.selfLink,
    this.uid,
  });

  factory ItemMetadata.fromJson(Map<String, dynamic> json) =>
      _$ItemMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMetadataToJson(this);
}

@JsonSerializable()
class ManagedField {
  ///APIVersion defines the version of this resource that this field set applies to. The
  ///format is "group/version" just like the top-level APIVersion field. It is necessary to
  ///track the version of a field set because it cannot be automatically converted.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///FieldsType is the discriminator for the different fields format and version. There is
  ///currently only one possible value: "FieldsV1"
  @JsonKey(name: 'fieldsType')
  String? fieldsType;

  ///FieldsV1 stores a set of fields in a data structure like a Trie, in JSON format.
  ///
  ///Each key is either a '.' representing the field itself, and will always map to an empty
  ///set, or a string representing a sub-field or item. The string will follow one of these
  ///four formats: 'f:<name>', where <name> is the name of a field in a struct, or key in a
  ///map 'v:<value>', where <value> is the exact json formatted value of a list item
  ///'i:<index>', where <index> is position of a item in a list 'k:<keys>', where <keys> is a
  ///map of  a list item's key fields to their unique values If a key maps to an empty Fields
  ///value, the field that key represents is part of the set.
  ///
  ///The exact format is defined in sigs.k8s.io/structured-merge-diff
  @JsonKey(name: 'fieldsV1')
  Map<String, dynamic>? fieldsV1;

  ///Manager is an identifier of the workflow managing these fields.
  @JsonKey(name: 'manager')
  String? manager;

  ///Operation is the type of operation which lead to this ManagedFieldsEntry being created.
  ///The only valid values for this field are 'Apply' and 'Update'.
  @JsonKey(name: 'operation')
  String? operation;

  ///Subresource is the name of the subresource used to update that object, or empty string if
  ///the object was updated through the main resource. The value of this field is used to
  ///distinguish between managers, even if they share the same name. For example, a status
  ///update will be distinct from a regular update using the same manager name. Note that the
  ///APIVersion field is not related to the Subresource field and it always corresponds to the
  ///version of the main resource.
  @JsonKey(name: 'subresource')
  String? subresource;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'time')
  DateTime? time;

  ManagedField({
    this.apiVersion,
    this.fieldsType,
    this.fieldsV1,
    this.manager,
    this.operation,
    this.subresource,
    this.time,
  });

  factory ManagedField.fromJson(Map<String, dynamic> json) =>
      _$ManagedFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedFieldToJson(this);
}

@JsonSerializable()
class OwnerReference {
  ///API version of the referent.
  @JsonKey(name: 'apiVersion')
  String apiVersion;

  ///If true, AND if the owner has the "foregroundDeletion" finalizer, then the owner cannot
  ///be deleted from the key-value store until this reference is removed. See
  ///https://kubernetes.io/docs/concepts/architecture/garbage-collection/#foreground-deletion
  ///for how the garbage collector interacts with this field and enforces the foreground
  ///deletion. Defaults to false. To set this field, a user needs "delete" permission of the
  ///owner, otherwise 422 (Unprocessable Entity) will be returned.
  @JsonKey(name: 'blockOwnerDeletion')
  bool? blockOwnerDeletion;

  ///If true, this reference points to the managing controller.
  @JsonKey(name: 'controller')
  bool? controller;

  ///Kind of the referent. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String kind;

  ///Name of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
  @JsonKey(name: 'name')
  String name;

  ///UID of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#uids
  @JsonKey(name: 'uid')
  String uid;

  OwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });

  factory OwnerReference.fromJson(Map<String, dynamic> json) =>
      _$OwnerReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerReferenceToJson(this);
}

@JsonSerializable()
class Spec {
  ///MatchResources decides whether to run the admission control policy on an object based on
  ///whether it meets the match criteria. The exclude rules take precedence over include rules
  ///(if a resource matches both, it is excluded)
  @JsonKey(name: 'matchResources')
  MatchResources? matchResources;

  ///ParamRef describes how to locate the params to be used as input to expressions of rules
  ///applied by a policy binding.
  @JsonKey(name: 'paramRef')
  ParamRef? paramRef;

  ///PolicyName references a ValidatingAdmissionPolicy name which the
  ///ValidatingAdmissionPolicyBinding binds to. If the referenced resource does not exist,
  ///this binding is considered invalid and will be ignored Required.
  @JsonKey(name: 'policyName')
  String? policyName;

  ///validationActions declares how Validations of the referenced ValidatingAdmissionPolicy
  ///are enforced. If a validation evaluates to false it is always enforced according to these
  ///actions.
  ///
  ///Failures defined by the ValidatingAdmissionPolicy's FailurePolicy are enforced according
  ///to these actions only if the FailurePolicy is set to Fail, otherwise the failures are
  ///ignored. This includes compilation errors, runtime errors and misconfigurations of the
  ///policy.
  ///
  ///validationActions is declared as a set of action values. Order does not matter.
  ///validationActions may not contain duplicates of the same action.
  ///
  ///The supported actions values are:
  ///
  ///"Deny" specifies that a validation failure results in a denied request.
  ///
  ///"Warn" specifies that a validation failure is reported to the request client in HTTP
  ///Warning headers, with a warning code of 299. Warnings can be sent both for allowed or
  ///denied admission responses.
  ///
  ///"Audit" specifies that a validation failure is included in the published audit event for
  ///the request. The audit event will contain a
  ///`validation.policy.admission.k8s.io/validation_failure` audit annotation with a value
  ///containing the details of the validation failures, formatted as a JSON list of objects,
  ///each with the following fields: - message: The validation failure message string -
  ///policy: The resource name of the ValidatingAdmissionPolicy - binding: The resource name
  ///of the ValidatingAdmissionPolicyBinding - expressionIndex: The index of the failed
  ///validations in the ValidatingAdmissionPolicy - validationActions: The enforcement actions
  ///enacted for the validation failure Example audit annotation:
  ///`"validation.policy.admission.k8s.io/validation_failure": "[{\"message\": \"Invalid
  ///value\", {\"policy\": \"policy.example.com\", {\"binding\":
  ///\"policybinding.example.com\", {\"expressionIndex\": \"1\", {\"validationActions\":
  ///[\"Audit\"]}]"`
  ///
  ///Clients should expect to handle additional values by ignoring any values not recognized.
  ///
  ///"Deny" and "Warn" may not be used together since this combination needlessly duplicates
  ///the validation failure both in the API response body and the HTTP warning headers.
  ///
  ///Required.
  @JsonKey(name: 'validationActions')
  List<ValidationAction>? validationActions;

  Spec({
    this.matchResources,
    this.paramRef,
    this.policyName,
    this.validationActions,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class MatchResources {
  ///ExcludeResourceRules describes what operations on what resources/subresources the
  ///ValidatingAdmissionPolicy should not care about. The exclude rules take precedence over
  ///include rules (if a resource matches both, it is excluded)
  @JsonKey(name: 'excludeResourceRules')
  List<ExcludeResourceRule?>? excludeResourceRules;

  ///matchPolicy defines how the "MatchResources" list is used to match incoming requests.
  ///Allowed values are "Exact" or "Equivalent".
  ///
  ///- Exact: match a request only if it exactly matches a specified rule. For example, if
  ///deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but
  ///"rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources:
  ///["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to
  ///the ValidatingAdmissionPolicy.
  ///
  ///- Equivalent: match a request if modifies a resource listed in rules, even via another
  ///API group or version. For example, if deployments can be modified via apps/v1,
  ///apps/v1beta1, and extensions/v1beta1, and "rules" only included `apiGroups:["apps"],
  ///apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or
  ///extensions/v1beta1 would be converted to apps/v1 and sent to the
  ///ValidatingAdmissionPolicy.
  ///
  ///Defaults to "Equivalent"
  ///
  ///Possible enum values:
  ///- `"Equivalent"` means requests should be sent to the webhook if they modify a resource
  ///listed in rules via another API group or version.
  ///- `"Exact"` means requests should only be sent to the webhook if they exactly match a
  ///given rule.
  @JsonKey(name: 'matchPolicy')
  MatchPolicy? matchPolicy;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  NamespaceSelector? namespaceSelector;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'objectSelector')
  ObjectSelector? objectSelector;

  ///ResourceRules describes what operations on what resources/subresources the
  ///ValidatingAdmissionPolicy matches. The policy cares about an operation if it matches
  ///_any_ Rule.
  @JsonKey(name: 'resourceRules')
  List<ResourceRule?>? resourceRules;

  MatchResources({
    this.excludeResourceRules,
    this.matchPolicy,
    this.namespaceSelector,
    this.objectSelector,
    this.resourceRules,
  });

  factory MatchResources.fromJson(Map<String, dynamic> json) =>
      _$MatchResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$MatchResourcesToJson(this);
}

@JsonSerializable()
class ExcludeResourceRule {
  ///APIGroups is the API groups the resources belong to. '*' is all groups. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiGroups')
  List<String?>? apiGroups;

  ///APIVersions is the API versions the resources belong to. '*' is all versions. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///Operations is the operations the admission hook cares about - CREATE, UPDATE, DELETE,
  ///CONNECT or * for all of those operations and any future admission operations that are
  ///added. If '*' is present, the length of the slice must be one. Required.
  @JsonKey(name: 'operations')
  List<Operation>? operations;

  ///ResourceNames is an optional white list of names that the rule applies to.  An empty set
  ///means that everything is allowed.
  @JsonKey(name: 'resourceNames')
  List<String?>? resourceNames;

  ///Resources is a list of resources this rule applies to.
  ///
  ///For example: 'pods' means pods. 'pods/log' means the log subresource of pods. '*' means
  ///all resources, but not subresources. 'pods/*' means all subresources of pods. '*/scale'
  ///means all scale subresources. '*/*' means all resources and their subresources.
  ///
  ///If wildcard is present, the validation rule will ensure resources do not overlap with
  ///each other.
  ///
  ///Depending on the enclosing object, subresources might not be allowed. Required.
  @JsonKey(name: 'resources')
  List<String?>? resources;

  ///scope specifies the scope of this rule. Valid values are "Cluster", "Namespaced", and "*"
  ///"Cluster" means that only cluster-scoped resources will match this rule. Namespace API
  ///objects are cluster-scoped. "Namespaced" means that only namespaced resources will match
  ///this rule. "*" means that there are no scope restrictions. Subresources match the scope
  ///of their parent resource. Default is "*".
  ///
  ///
  ///Possible enum values:
  ///- `"*"` means that all scopes are included.
  ///- `"Cluster"` means that scope is limited to cluster-scoped objects. Namespace objects
  ///are cluster-scoped.
  ///- `"Namespaced"` means that scope is limited to namespaced objects.
  @JsonKey(name: 'scope')
  Scope? scope;

  ExcludeResourceRule({
    this.apiGroups,
    this.apiVersions,
    this.operations,
    this.resourceNames,
    this.resources,
    this.scope,
  });

  factory ExcludeResourceRule.fromJson(Map<String, dynamic> json) =>
      _$ExcludeResourceRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ExcludeResourceRuleToJson(this);
}

enum Operation {
  @JsonValue('CONNECT')
  CONNECT,
  @JsonValue('CREATE')
  CREATE,
  @JsonValue('DELETE')
  DELETE,
  @JsonValue('*')
  EMPTY,
  @JsonValue('UPDATE')
  UPDATE,
}

final operationValues = EnumValues({
  'CONNECT': Operation.CONNECT,
  'CREATE': Operation.CREATE,
  'DELETE': Operation.DELETE,
  '*': Operation.EMPTY,
  'UPDATE': Operation.UPDATE,
});

///scope specifies the scope of this rule. Valid values are "Cluster", "Namespaced", and "*"
///"Cluster" means that only cluster-scoped resources will match this rule. Namespace API
///objects are cluster-scoped. "Namespaced" means that only namespaced resources will match
///this rule. "*" means that there are no scope restrictions. Subresources match the scope
///of their parent resource. Default is "*".
///
///
///Possible enum values:
///- `"*"` means that all scopes are included.
///- `"Cluster"` means that scope is limited to cluster-scoped objects. Namespace objects
///are cluster-scoped.
///- `"Namespaced"` means that scope is limited to namespaced objects.
enum Scope {
  @JsonValue('Cluster')
  CLUSTER,
  @JsonValue('*')
  EMPTY,
  @JsonValue('Namespaced')
  NAMESPACED,
}

final scopeValues = EnumValues({
  'Cluster': Scope.CLUSTER,
  '*': Scope.EMPTY,
  'Namespaced': Scope.NAMESPACED,
});

///matchPolicy defines how the "MatchResources" list is used to match incoming requests.
///Allowed values are "Exact" or "Equivalent".
///
///- Exact: match a request only if it exactly matches a specified rule. For example, if
///deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but
///"rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources:
///["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to
///the ValidatingAdmissionPolicy.
///
///- Equivalent: match a request if modifies a resource listed in rules, even via another
///API group or version. For example, if deployments can be modified via apps/v1,
///apps/v1beta1, and extensions/v1beta1, and "rules" only included `apiGroups:["apps"],
///apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or
///extensions/v1beta1 would be converted to apps/v1 and sent to the
///ValidatingAdmissionPolicy.
///
///Defaults to "Equivalent"
///
///Possible enum values:
///- `"Equivalent"` means requests should be sent to the webhook if they modify a resource
///listed in rules via another API group or version.
///- `"Exact"` means requests should only be sent to the webhook if they exactly match a
///given rule.
enum MatchPolicy {
  @JsonValue('Equivalent')
  EQUIVALENT,
  @JsonValue('Exact')
  EXACT,
}

final matchPolicyValues = EnumValues({
  'Equivalent': MatchPolicy.EQUIVALENT,
  'Exact': MatchPolicy.EXACT,
});

@JsonSerializable()
class NamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<NamespaceSelectorMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  NamespaceSelector({this.matchExpressions, this.matchLabels});

  factory NamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$NamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$NamespaceSelectorToJson(this);
}

@JsonSerializable()
class NamespaceSelectorMatchExpression {
  ///key is the label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///operator represents a key's relationship to a set of values. Valid operators are In,
  ///NotIn, Exists and DoesNotExist.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///values is an array of string values. If the operator is In or NotIn, the values array
  ///must be non-empty. If the operator is Exists or DoesNotExist, the values array must be
  ///empty. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  NamespaceSelectorMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory NamespaceSelectorMatchExpression.fromJson(
    Map<String, dynamic> json,
  ) => _$NamespaceSelectorMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NamespaceSelectorMatchExpressionToJson(this);
}

@JsonSerializable()
class ObjectSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<ObjectSelectorMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  ObjectSelector({this.matchExpressions, this.matchLabels});

  factory ObjectSelector.fromJson(Map<String, dynamic> json) =>
      _$ObjectSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectSelectorToJson(this);
}

@JsonSerializable()
class ObjectSelectorMatchExpression {
  ///key is the label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///operator represents a key's relationship to a set of values. Valid operators are In,
  ///NotIn, Exists and DoesNotExist.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///values is an array of string values. If the operator is In or NotIn, the values array
  ///must be non-empty. If the operator is Exists or DoesNotExist, the values array must be
  ///empty. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  ObjectSelectorMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory ObjectSelectorMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$ObjectSelectorMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectSelectorMatchExpressionToJson(this);
}

@JsonSerializable()
class ResourceRule {
  ///APIGroups is the API groups the resources belong to. '*' is all groups. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiGroups')
  List<String?>? apiGroups;

  ///APIVersions is the API versions the resources belong to. '*' is all versions. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///Operations is the operations the admission hook cares about - CREATE, UPDATE, DELETE,
  ///CONNECT or * for all of those operations and any future admission operations that are
  ///added. If '*' is present, the length of the slice must be one. Required.
  @JsonKey(name: 'operations')
  List<Operation>? operations;

  ///ResourceNames is an optional white list of names that the rule applies to.  An empty set
  ///means that everything is allowed.
  @JsonKey(name: 'resourceNames')
  List<String?>? resourceNames;

  ///Resources is a list of resources this rule applies to.
  ///
  ///For example: 'pods' means pods. 'pods/log' means the log subresource of pods. '*' means
  ///all resources, but not subresources. 'pods/*' means all subresources of pods. '*/scale'
  ///means all scale subresources. '*/*' means all resources and their subresources.
  ///
  ///If wildcard is present, the validation rule will ensure resources do not overlap with
  ///each other.
  ///
  ///Depending on the enclosing object, subresources might not be allowed. Required.
  @JsonKey(name: 'resources')
  List<String?>? resources;

  ///scope specifies the scope of this rule. Valid values are "Cluster", "Namespaced", and "*"
  ///"Cluster" means that only cluster-scoped resources will match this rule. Namespace API
  ///objects are cluster-scoped. "Namespaced" means that only namespaced resources will match
  ///this rule. "*" means that there are no scope restrictions. Subresources match the scope
  ///of their parent resource. Default is "*".
  ///
  ///
  ///Possible enum values:
  ///- `"*"` means that all scopes are included.
  ///- `"Cluster"` means that scope is limited to cluster-scoped objects. Namespace objects
  ///are cluster-scoped.
  ///- `"Namespaced"` means that scope is limited to namespaced objects.
  @JsonKey(name: 'scope')
  Scope? scope;

  ResourceRule({
    this.apiGroups,
    this.apiVersions,
    this.operations,
    this.resourceNames,
    this.resources,
    this.scope,
  });

  factory ResourceRule.fromJson(Map<String, dynamic> json) =>
      _$ResourceRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceRuleToJson(this);
}

@JsonSerializable()
class ParamRef {
  ///name is the name of the resource being referenced.
  ///
  ///One of `name` or `selector` must be set, but `name` and `selector` are mutually exclusive
  ///properties. If one is set, the other must be unset.
  ///
  ///A single parameter used for all admission requests can be configured by setting the
  ///`name` field, leaving `selector` blank, and setting namespace if `paramKind` is
  ///namespace-scoped.
  @JsonKey(name: 'name')
  String? name;

  ///namespace is the namespace of the referenced resource. Allows limiting the search for
  ///params to a specific namespace. Applies to both `name` and `selector` fields.
  ///
  ///A per-namespace parameter may be used by specifying a namespace-scoped `paramKind` in the
  ///policy and leaving this field empty.
  ///
  ///- If `paramKind` is cluster-scoped, this field MUST be unset. Setting this field results
  ///in a configuration error.
  ///
  ///- If `paramKind` is namespace-scoped, the namespace of the object being evaluated for
  ///admission will be used when this field is left unset. Take care that if this is left
  ///empty the binding must not match any cluster-scoped resources, which will result in an
  ///error.
  @JsonKey(name: 'namespace')
  String? namespace;

  ///`parameterNotFoundAction` controls the behavior of the binding when the resource exists,
  ///and name or selector is valid, but there are no parameters matched by the binding. If the
  ///value is set to `Allow`, then no matched parameters will be treated as successful
  ///validation by the binding. If set to `Deny`, then no matched parameters will be subject
  ///to the `failurePolicy` of the policy.
  ///
  ///Allowed values are `Allow` or `Deny`
  ///
  ///Required
  @JsonKey(name: 'parameterNotFoundAction')
  String? parameterNotFoundAction;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'selector')
  Selector? selector;

  ParamRef({
    this.name,
    this.namespace,
    this.parameterNotFoundAction,
    this.selector,
  });

  factory ParamRef.fromJson(Map<String, dynamic> json) =>
      _$ParamRefFromJson(json);

  Map<String, dynamic> toJson() => _$ParamRefToJson(this);
}

@JsonSerializable()
class Selector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<SelectorMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  Selector({this.matchExpressions, this.matchLabels});

  factory Selector.fromJson(Map<String, dynamic> json) =>
      _$SelectorFromJson(json);

  Map<String, dynamic> toJson() => _$SelectorToJson(this);
}

@JsonSerializable()
class SelectorMatchExpression {
  ///key is the label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///operator represents a key's relationship to a set of values. Valid operators are In,
  ///NotIn, Exists and DoesNotExist.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///values is an array of string values. If the operator is In or NotIn, the values array
  ///must be non-empty. If the operator is Exists or DoesNotExist, the values array must be
  ///empty. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  SelectorMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory SelectorMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$SelectorMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$SelectorMatchExpressionToJson(this);
}

enum ValidationAction {
  @JsonValue('Audit')
  AUDIT,
  @JsonValue('Deny')
  DENY,
  @JsonValue('Warn')
  WARN,
}

final validationActionValues = EnumValues({
  'Audit': ValidationAction.AUDIT,
  'Deny': ValidationAction.DENY,
  'Warn': ValidationAction.WARN,
});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ValidatingadmissionpolicybindinglistAdmissionregistrationV1Kind {
  @JsonValue('ValidatingAdmissionPolicyBindingList')
  VALIDATING_ADMISSION_POLICY_BINDING_LIST,
}

final validatingadmissionpolicybindinglistAdmissionregistrationV1KindValues =
    EnumValues({
      'ValidatingAdmissionPolicyBindingList':
          ValidatingadmissionpolicybindinglistAdmissionregistrationV1Kind
              .VALIDATING_ADMISSION_POLICY_BINDING_LIST,
    });

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata {
  ///continue may be set if the user set a limit on the number of items returned, and
  ///indicates that the server has more data available. The value is opaque and may be used to
  ///issue another request to the endpoint that served this list to retrieve the next set of
  ///available objects. Continuing a consistent list may not be possible if the server
  ///configuration has changed or more than a few minutes have passed. The resourceVersion
  ///field returned when using this continue value will be identical to the value in the first
  ///response, unless you have received this token from an error message.
  @JsonKey(name: 'continue')
  String? metadataContinue;

  ///remainingItemCount is the number of subsequent items in the list which are not included
  ///in this list response. If the list request contained label or field selectors, then the
  ///number of remaining items is unknown and the field will be left unset and omitted during
  ///serialization. If the list is complete (either because it is not chunking or because this
  ///is the last chunk), then there are no more remaining items and this field will be left
  ///unset and omitted during serialization. Servers older than v1.15 do not set this field.
  ///The intended use of the remainingItemCount is *estimating* the size of a collection.
  ///Clients should not rely on the remainingItemCount to be set or to be exact.
  @JsonKey(name: 'remainingItemCount')
  int? remainingItemCount;

  ///String that identifies the server's internal version of this object that can be used by
  ///clients to determine when objects have changed. Value must be treated as opaque by
  ///clients and passed unmodified back to the server. Populated by the system. Read-only.
  ///More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///Deprecated: selfLink is a legacy read-only field that is no longer populated by the
  ///system.
  @JsonKey(name: 'selfLink')
  String? selfLink;

  ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ValidatingadmissionpolicybindinglistAdmissionregistrationV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ValidatingadmissionpolicybindinglistAdmissionregistrationV1MetadataFromJson(
        json,
      );

  Map<String, dynamic> toJson() =>
      _$ValidatingadmissionpolicybindinglistAdmissionregistrationV1MetadataToJson(
        this,
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
