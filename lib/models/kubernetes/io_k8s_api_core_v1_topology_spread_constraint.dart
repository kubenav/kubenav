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
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';

class IoK8sApiCoreV1TopologySpreadConstraint {
  /// Returns a new [IoK8sApiCoreV1TopologySpreadConstraint] instance.
  IoK8sApiCoreV1TopologySpreadConstraint({
    this.labelSelector,
    required this.maxSkew,
    required this.topologyKey,
    required this.whenUnsatisfiable,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? labelSelector;

  /// MaxSkew describes the degree to which pods may be unevenly distributed. When `whenUnsatisfiable=DoNotSchedule`, it is the maximum permitted difference between the number of matching pods in the target topology and the global minimum. For example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector spread as 1/1/0: | zone1 | zone2 | zone3 | |   P   |   P   |       | - if MaxSkew is 1, incoming pod can only be scheduled to zone3 to become 1/1/1; scheduling it onto zone1(zone2) would make the ActualSkew(2-0) on zone1(zone2) violate MaxSkew(1). - if MaxSkew is 2, incoming pod can be scheduled onto any zone. When `whenUnsatisfiable=ScheduleAnyway`, it is used to give higher precedence to topologies that satisfy it. It's a required field. Default value is 1 and 0 is not allowed.
  int maxSkew;

  /// TopologyKey is the key of node labels. Nodes that have a label with this key and identical values are considered to be in the same topology. We consider each <key, value> as a \"bucket\", and try to put balanced number of pods into each bucket. It's a required field.
  String topologyKey;

  /// WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread constraint. - DoNotSchedule (default) tells the scheduler not to schedule it. - ScheduleAnyway tells the scheduler to schedule the pod in any location,   but giving higher precedence to topologies that would help reduce the   skew. A constraint is considered \"Unsatisfiable\" for an incoming pod if and only if every possible node assignment for that pod would violate \"MaxSkew\" on some topology. For example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector spread as 3/1/1: | zone1 | zone2 | zone3 | | P P P |   P   |   P   | If WhenUnsatisfiable is set to DoNotSchedule, incoming pod can only be scheduled to zone2(zone3) to become 3/2/1(3/1/2) as ActualSkew(2-1) on zone2(zone3) satisfies MaxSkew(1). In other words, the cluster can still be imbalanced, but scheduler won't make it *more* imbalanced. It's a required field.  Possible enum values:  - `\"DoNotSchedule\"` instructs the scheduler not to schedule the pod when constraints are not satisfied.  - `\"ScheduleAnyway\"` instructs the scheduler to schedule the pod even if constraints are not satisfied.
  IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum whenUnsatisfiable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1TopologySpreadConstraint &&
          other.labelSelector == labelSelector &&
          other.maxSkew == maxSkew &&
          other.topologyKey == topologyKey &&
          other.whenUnsatisfiable == whenUnsatisfiable;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (labelSelector == null ? 0 : labelSelector!.hashCode) +
      (maxSkew.hashCode) +
      (topologyKey.hashCode) +
      (whenUnsatisfiable.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1TopologySpreadConstraint[labelSelector=$labelSelector, maxSkew=$maxSkew, topologyKey=$topologyKey, whenUnsatisfiable=$whenUnsatisfiable]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (labelSelector != null) {
      json[r'labelSelector'] = labelSelector;
    }
    json[r'maxSkew'] = maxSkew;
    json[r'topologyKey'] = topologyKey;
    json[r'whenUnsatisfiable'] = whenUnsatisfiable;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1TopologySpreadConstraint] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1TopologySpreadConstraint? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1TopologySpreadConstraint[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1TopologySpreadConstraint[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1TopologySpreadConstraint(
        labelSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'labelSelector']),
        maxSkew: mapValueOfType<int>(json, r'maxSkew')!,
        topologyKey: mapValueOfType<String>(json, r'topologyKey')!,
        whenUnsatisfiable:
            IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum
                .fromJson(json[r'whenUnsatisfiable'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1TopologySpreadConstraint>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1TopologySpreadConstraint>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1TopologySpreadConstraint.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1TopologySpreadConstraint> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1TopologySpreadConstraint>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1TopologySpreadConstraint.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1TopologySpreadConstraint-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1TopologySpreadConstraint>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1TopologySpreadConstraint>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1TopologySpreadConstraint.listFromJson(
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
    'maxSkew',
    'topologyKey',
    'whenUnsatisfiable',
  };
}

/// WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread constraint. - DoNotSchedule (default) tells the scheduler not to schedule it. - ScheduleAnyway tells the scheduler to schedule the pod in any location,   but giving higher precedence to topologies that would help reduce the   skew. A constraint is considered \"Unsatisfiable\" for an incoming pod if and only if every possible node assignment for that pod would violate \"MaxSkew\" on some topology. For example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector spread as 3/1/1: | zone1 | zone2 | zone3 | | P P P |   P   |   P   | If WhenUnsatisfiable is set to DoNotSchedule, incoming pod can only be scheduled to zone2(zone3) to become 3/2/1(3/1/2) as ActualSkew(2-1) on zone2(zone3) satisfies MaxSkew(1). In other words, the cluster can still be imbalanced, but scheduler won't make it *more* imbalanced. It's a required field.  Possible enum values:  - `\"DoNotSchedule\"` instructs the scheduler not to schedule the pod when constraints are not satisfied.  - `\"ScheduleAnyway\"` instructs the scheduler to schedule the pod even if constraints are not satisfied.
class IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const doNotSchedule =
      IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum._(
          r'DoNotSchedule');
  static const scheduleAnyway =
      IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum._(
          r'ScheduleAnyway');

  /// List of all possible values in this [enum][IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum].
  static const values =
      <IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum>[
    doNotSchedule,
    scheduleAnyway,
  ];

  static IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum].
class IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnumTypeTransformer {
  factory IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnumTypeTransformer
              ._();

  const IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnumTypeTransformer._();

  String encode(
          IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'DoNotSchedule':
          return IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum
              .doNotSchedule;
        case r'ScheduleAnyway':
          return IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnum
              .scheduleAnyway;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnumTypeTransformer] instance.
  static IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiableEnumTypeTransformer?
      _instance;
}
