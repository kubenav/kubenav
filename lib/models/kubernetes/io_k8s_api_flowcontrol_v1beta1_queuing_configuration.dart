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

class IoK8sApiFlowcontrolV1beta1QueuingConfiguration {
  /// Returns a new [IoK8sApiFlowcontrolV1beta1QueuingConfiguration] instance.
  IoK8sApiFlowcontrolV1beta1QueuingConfiguration({
    this.handSize,
    this.queueLengthLimit,
    this.queues,
  });

  /// `handSize` is a small positive number that configures the shuffle sharding of requests into queues.  When enqueuing a request at this priority level the request's flow identifier (a string pair) is hashed and the hash value is used to shuffle the list of queues and deal a hand of the size specified here.  The request is put into one of the shortest queues in that hand. `handSize` must be no larger than `queues`, and should be significantly smaller (so that a few heavy flows do not saturate most of the queues).  See the user-facing documentation for more extensive guidance on setting this field.  This field has a default value of 8.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? handSize;

  /// `queueLengthLimit` is the maximum number of requests allowed to be waiting in a given queue of this priority level at a time; excess requests are rejected.  This value must be positive.  If not specified, it will be defaulted to 50.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? queueLengthLimit;

  /// `queues` is the number of queues for this priority level. The queues exist independently at each apiserver. The value must be positive.  Setting it to 1 effectively precludes shufflesharding and thus makes the distinguisher method of associated flow schemas irrelevant.  This field has a default value of 64.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? queues;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta1QueuingConfiguration &&
          other.handSize == handSize &&
          other.queueLengthLimit == queueLengthLimit &&
          other.queues == queues;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (handSize == null ? 0 : handSize!.hashCode) +
      (queueLengthLimit == null ? 0 : queueLengthLimit!.hashCode) +
      (queues == null ? 0 : queues!.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta1QueuingConfiguration[handSize=$handSize, queueLengthLimit=$queueLengthLimit, queues=$queues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.handSize != null) {
      json[r'handSize'] = this.handSize;
    } else {
      json[r'handSize'] = null;
    }
    if (this.queueLengthLimit != null) {
      json[r'queueLengthLimit'] = this.queueLengthLimit;
    } else {
      json[r'queueLengthLimit'] = null;
    }
    if (this.queues != null) {
      json[r'queues'] = this.queues;
    } else {
      json[r'queues'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta1QueuingConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta1QueuingConfiguration? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta1QueuingConfiguration[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta1QueuingConfiguration[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta1QueuingConfiguration(
        handSize: mapValueOfType<int>(json, r'handSize'),
        queueLengthLimit: mapValueOfType<int>(json, r'queueLengthLimit'),
        queues: mapValueOfType<int>(json, r'queues'),
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta1QueuingConfiguration>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiFlowcontrolV1beta1QueuingConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta1QueuingConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiFlowcontrolV1beta1QueuingConfiguration>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiFlowcontrolV1beta1QueuingConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiFlowcontrolV1beta1QueuingConfiguration.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta1QueuingConfiguration-objects as value to a dart map
  static Map<String, List<IoK8sApiFlowcontrolV1beta1QueuingConfiguration>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiFlowcontrolV1beta1QueuingConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta1QueuingConfiguration.listFromJson(
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
