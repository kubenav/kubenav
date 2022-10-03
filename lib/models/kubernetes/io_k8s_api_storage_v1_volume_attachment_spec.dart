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
import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_volume_attachment_source.dart';

class IoK8sApiStorageV1VolumeAttachmentSpec {
  /// Returns a new [IoK8sApiStorageV1VolumeAttachmentSpec] instance.
  IoK8sApiStorageV1VolumeAttachmentSpec({
    required this.attacher,
    required this.nodeName,
    required this.source_,
  });

  /// Attacher indicates the name of the volume driver that MUST handle this request. This is the name returned by GetPluginName().
  String attacher;

  /// The node that the volume should be attached to.
  String nodeName;

  IoK8sApiStorageV1VolumeAttachmentSource source_;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1VolumeAttachmentSpec &&
          other.attacher == attacher &&
          other.nodeName == nodeName &&
          other.source_ == source_;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (attacher.hashCode) + (nodeName.hashCode) + (source_.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1VolumeAttachmentSpec[attacher=$attacher, nodeName=$nodeName, source_=$source_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'attacher'] = this.attacher;
    json[r'nodeName'] = this.nodeName;
    json[r'source'] = this.source_;
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1VolumeAttachmentSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1VolumeAttachmentSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1VolumeAttachmentSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1VolumeAttachmentSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1VolumeAttachmentSpec(
        attacher: mapValueOfType<String>(json, r'attacher')!,
        nodeName: mapValueOfType<String>(json, r'nodeName')!,
        source_:
            IoK8sApiStorageV1VolumeAttachmentSource.fromJson(json[r'source'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1VolumeAttachmentSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1VolumeAttachmentSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1VolumeAttachmentSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1VolumeAttachmentSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiStorageV1VolumeAttachmentSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiStorageV1VolumeAttachmentSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1VolumeAttachmentSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1VolumeAttachmentSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1VolumeAttachmentSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1VolumeAttachmentSpec.listFromJson(
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
    'attacher',
    'nodeName',
    'source',
  };
}
