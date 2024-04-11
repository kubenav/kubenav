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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_managed_fields_entry.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_owner_reference.dart';

class IoK8sApimachineryPkgApisMetaV1ObjectMeta {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1ObjectMeta] instance.
  IoK8sApimachineryPkgApisMetaV1ObjectMeta({
    this.annotations = const {},
    this.creationTimestamp,
    this.deletionGracePeriodSeconds,
    this.deletionTimestamp,
    this.finalizers = const [],
    this.generateName,
    this.generation,
    this.labels = const {},
    this.managedFields = const [],
    this.name,
    this.namespace,
    this.ownerReferences = const [],
    this.resourceVersion,
    this.selfLink,
    this.uid,
  });

  /// Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations
  Map<String, String> annotations;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? creationTimestamp;

  /// Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? deletionGracePeriodSeconds;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? deletionTimestamp;

  /// Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed. Finalizers may be processed and removed in any order.  Order is NOT enforced because it introduces significant risk of stuck finalizers. finalizers is a shared field, any actor with permission can reorder it. If the finalizer list is processed in order, then this can lead to a situation in which the component responsible for the first finalizer in the list is waiting for a signal (field value, external system, or other) produced by a component responsible for a finalizer later in the list, resulting in a deadlock. Without enforced ordering finalizers are free to order amongst themselves and are not vulnerable to ordering changes in the list.
  List<String> finalizers;

  /// GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.  If this field is specified and the generated name exists, the server will return a 409.  Applied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? generateName;

  /// A sequence number representing a specific generation of the desired state. Populated by the system. Read-only.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? generation;

  /// Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels
  Map<String, String> labels;

  /// ManagedFields maps workflow-id and version to the set of fields that are managed by that workflow. This is mostly for internal housekeeping, and users typically shouldn't need to set or understand this field. A workflow can be the user's name, a controller's name, or the name of a specific apply path like \"ci-cd\". The set of fields is always in the version that the workflow used when modifying the object.
  List<IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry> managedFields;

  /// Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Namespace defines the space within which each name must be unique. An empty namespace is equivalent to the \"default\" namespace, but \"default\" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.  Must be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? namespace;

  /// List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller.
  List<IoK8sApimachineryPkgApisMetaV1OwnerReference> ownerReferences;

  /// An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.  Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resourceVersion;

  /// Deprecated: selfLink is a legacy read-only field that is no longer populated by the system.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? selfLink;

  /// UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.  Populated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uid;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1ObjectMeta &&
          other.annotations == annotations &&
          other.creationTimestamp == creationTimestamp &&
          other.deletionGracePeriodSeconds == deletionGracePeriodSeconds &&
          other.deletionTimestamp == deletionTimestamp &&
          other.finalizers == finalizers &&
          other.generateName == generateName &&
          other.generation == generation &&
          other.labels == labels &&
          other.managedFields == managedFields &&
          other.name == name &&
          other.namespace == namespace &&
          other.ownerReferences == ownerReferences &&
          other.resourceVersion == resourceVersion &&
          other.selfLink == selfLink &&
          other.uid == uid;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (annotations.hashCode) +
      (creationTimestamp == null ? 0 : creationTimestamp!.hashCode) +
      (deletionGracePeriodSeconds == null
          ? 0
          : deletionGracePeriodSeconds!.hashCode) +
      (deletionTimestamp == null ? 0 : deletionTimestamp!.hashCode) +
      (finalizers.hashCode) +
      (generateName == null ? 0 : generateName!.hashCode) +
      (generation == null ? 0 : generation!.hashCode) +
      (labels.hashCode) +
      (managedFields.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (namespace == null ? 0 : namespace!.hashCode) +
      (ownerReferences.hashCode) +
      (resourceVersion == null ? 0 : resourceVersion!.hashCode) +
      (selfLink == null ? 0 : selfLink!.hashCode) +
      (uid == null ? 0 : uid!.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1ObjectMeta[annotations=$annotations, creationTimestamp=$creationTimestamp, deletionGracePeriodSeconds=$deletionGracePeriodSeconds, deletionTimestamp=$deletionTimestamp, finalizers=$finalizers, generateName=$generateName, generation=$generation, labels=$labels, managedFields=$managedFields, name=$name, namespace=$namespace, ownerReferences=$ownerReferences, resourceVersion=$resourceVersion, selfLink=$selfLink, uid=$uid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'annotations'] = this.annotations;
    if (this.creationTimestamp != null) {
      json[r'creationTimestamp'] =
          this.creationTimestamp!.toUtc().toIso8601String();
    } else {
      json[r'creationTimestamp'] = null;
    }
    if (this.deletionGracePeriodSeconds != null) {
      json[r'deletionGracePeriodSeconds'] = this.deletionGracePeriodSeconds;
    } else {
      json[r'deletionGracePeriodSeconds'] = null;
    }
    if (this.deletionTimestamp != null) {
      json[r'deletionTimestamp'] =
          this.deletionTimestamp!.toUtc().toIso8601String();
    } else {
      json[r'deletionTimestamp'] = null;
    }
    json[r'finalizers'] = this.finalizers;
    if (this.generateName != null) {
      json[r'generateName'] = this.generateName;
    } else {
      json[r'generateName'] = null;
    }
    if (this.generation != null) {
      json[r'generation'] = this.generation;
    } else {
      json[r'generation'] = null;
    }
    json[r'labels'] = this.labels;
    json[r'managedFields'] = this.managedFields;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.namespace != null) {
      json[r'namespace'] = this.namespace;
    } else {
      json[r'namespace'] = null;
    }
    json[r'ownerReferences'] = this.ownerReferences;
    if (this.resourceVersion != null) {
      json[r'resourceVersion'] = this.resourceVersion;
    } else {
      json[r'resourceVersion'] = null;
    }
    if (this.selfLink != null) {
      json[r'selfLink'] = this.selfLink;
    } else {
      json[r'selfLink'] = null;
    }
    if (this.uid != null) {
      json[r'uid'] = this.uid;
    } else {
      json[r'uid'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1ObjectMeta] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1ObjectMeta? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1ObjectMeta[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1ObjectMeta[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1ObjectMeta(
        annotations:
            mapCastOfType<String, String>(json, r'annotations') ?? const {},
        creationTimestamp: mapDateTime(json, r'creationTimestamp', ''),
        deletionGracePeriodSeconds:
            mapValueOfType<int>(json, r'deletionGracePeriodSeconds'),
        deletionTimestamp: mapDateTime(json, r'deletionTimestamp', ''),
        finalizers: json[r'finalizers'] is List
            ? (json[r'finalizers'] as List).cast<String>()
            : const [],
        generateName: mapValueOfType<String>(json, r'generateName'),
        generation: mapValueOfType<int>(json, r'generation'),
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        managedFields:
            IoK8sApimachineryPkgApisMetaV1ManagedFieldsEntry.listFromJson(
                    json[r'managedFields']) ??
                const [],
        name: mapValueOfType<String>(json, r'name'),
        namespace: mapValueOfType<String>(json, r'namespace'),
        ownerReferences:
            IoK8sApimachineryPkgApisMetaV1OwnerReference.listFromJson(
                    json[r'ownerReferences']) ??
                const [],
        resourceVersion: mapValueOfType<String>(json, r'resourceVersion'),
        selfLink: mapValueOfType<String>(json, r'selfLink'),
        uid: mapValueOfType<String>(json, r'uid'),
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1ObjectMeta>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1ObjectMeta>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1ObjectMeta> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1ObjectMeta>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1ObjectMeta-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1ObjectMeta>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1ObjectMeta>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1ObjectMeta.listFromJson(
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
  static const requiredKeys = <String>{};
}
