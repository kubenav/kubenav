//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_volume_error.dart';

class IoK8sApiStorageV1VolumeAttachmentStatus {
  /// Returns a new [IoK8sApiStorageV1VolumeAttachmentStatus] instance.
  IoK8sApiStorageV1VolumeAttachmentStatus({
    this.attachError,
    required this.attached,
    this.attachmentMetadata = const {},
    this.detachError,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiStorageV1VolumeError? attachError;

  /// Indicates the volume is successfully attached. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
  bool attached;

  /// Upon successful attach, this field is populated with any information returned by the attach operation that must be passed into subsequent WaitForAttach or Mount calls. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
  Map<String, String> attachmentMetadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiStorageV1VolumeError? detachError;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1VolumeAttachmentStatus &&
          other.attachError == attachError &&
          other.attached == attached &&
          other.attachmentMetadata == attachmentMetadata &&
          other.detachError == detachError;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (attachError == null ? 0 : attachError!.hashCode) +
      (attached.hashCode) +
      (attachmentMetadata.hashCode) +
      (detachError == null ? 0 : detachError!.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1VolumeAttachmentStatus[attachError=$attachError, attached=$attached, attachmentMetadata=$attachmentMetadata, detachError=$detachError]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.attachError != null) {
      json[r'attachError'] = this.attachError;
    } else {
      json[r'attachError'] = null;
    }
    json[r'attached'] = this.attached;
    json[r'attachmentMetadata'] = this.attachmentMetadata;
    if (this.detachError != null) {
      json[r'detachError'] = this.detachError;
    } else {
      json[r'detachError'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1VolumeAttachmentStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1VolumeAttachmentStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1VolumeAttachmentStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1VolumeAttachmentStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1VolumeAttachmentStatus(
        attachError:
            IoK8sApiStorageV1VolumeError.fromJson(json[r'attachError']),
        attached: mapValueOfType<bool>(json, r'attached')!,
        attachmentMetadata:
            mapCastOfType<String, String>(json, r'attachmentMetadata') ??
                const {},
        detachError:
            IoK8sApiStorageV1VolumeError.fromJson(json[r'detachError']),
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1VolumeAttachmentStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1VolumeAttachmentStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1VolumeAttachmentStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1VolumeAttachmentStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiStorageV1VolumeAttachmentStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiStorageV1VolumeAttachmentStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1VolumeAttachmentStatus-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1VolumeAttachmentStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1VolumeAttachmentStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1VolumeAttachmentStatus.listFromJson(
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
    'attached',
  };
}
