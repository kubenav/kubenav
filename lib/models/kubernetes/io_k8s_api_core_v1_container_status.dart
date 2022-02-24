//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1ContainerStatus {
  /// Returns a new [IoK8sApiCoreV1ContainerStatus] instance.
  IoK8sApiCoreV1ContainerStatus({
    this.containerID,
    required this.image,
    required this.imageID,
    this.lastState,
    required this.name,
    required this.ready,
    required this.restartCount,
    this.started,
    this.state,
  });

  /// Container's ID in the format 'docker://<container_id>'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? containerID;

  /// The image the container is running. More info: https://kubernetes.io/docs/concepts/containers/images.
  String image;

  /// ImageID of the container's image.
  String imageID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ContainerState? lastState;

  /// This must be a DNS_LABEL. Each container in a pod must have a unique name. Cannot be updated.
  String name;

  /// Specifies whether the container has passed its readiness probe.
  bool ready;

  /// The number of times the container has been restarted.
  int restartCount;

  /// Specifies whether the container has passed its startup probe. Initialized as false, becomes true after startupProbe is considered successful. Resets to false when the container is restarted, or if kubelet loses state temporarily. Is always true when no startupProbe is defined.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? started;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ContainerState? state;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1ContainerStatus &&
          other.containerID == containerID &&
          other.image == image &&
          other.imageID == imageID &&
          other.lastState == lastState &&
          other.name == name &&
          other.ready == ready &&
          other.restartCount == restartCount &&
          other.started == started &&
          other.state == state;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (containerID == null ? 0 : containerID!.hashCode) +
      (image.hashCode) +
      (imageID.hashCode) +
      (lastState == null ? 0 : lastState!.hashCode) +
      (name.hashCode) +
      (ready.hashCode) +
      (restartCount.hashCode) +
      (started == null ? 0 : started!.hashCode) +
      (state == null ? 0 : state!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1ContainerStatus[containerID=$containerID, image=$image, imageID=$imageID, lastState=$lastState, name=$name, ready=$ready, restartCount=$restartCount, started=$started, state=$state]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (containerID != null) {
      json[r'containerID'] = containerID;
    }
    json[r'image'] = image;
    json[r'imageID'] = imageID;
    if (lastState != null) {
      json[r'lastState'] = lastState;
    }
    json[r'name'] = name;
    json[r'ready'] = ready;
    json[r'restartCount'] = restartCount;
    if (started != null) {
      json[r'started'] = started;
    }
    if (state != null) {
      json[r'state'] = state;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1ContainerStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1ContainerStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1ContainerStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1ContainerStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1ContainerStatus(
        containerID: mapValueOfType<String>(json, r'containerID'),
        image: mapValueOfType<String>(json, r'image')!,
        imageID: mapValueOfType<String>(json, r'imageID')!,
        lastState: IoK8sApiCoreV1ContainerState.fromJson(json[r'lastState']),
        name: mapValueOfType<String>(json, r'name')!,
        ready: mapValueOfType<bool>(json, r'ready')!,
        restartCount: mapValueOfType<int>(json, r'restartCount')!,
        started: mapValueOfType<bool>(json, r'started'),
        state: IoK8sApiCoreV1ContainerState.fromJson(json[r'state']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1ContainerStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ContainerStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ContainerStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1ContainerStatus> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1ContainerStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ContainerStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1ContainerStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1ContainerStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1ContainerStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1ContainerStatus.listFromJson(
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
    'image',
    'imageID',
    'name',
    'ready',
    'restartCount',
  };
}
