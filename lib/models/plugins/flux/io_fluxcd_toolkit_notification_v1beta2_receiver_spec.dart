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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1_receiver_spec_resources_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1_receiver_spec_secret_ref.dart';

class IoFluxcdToolkitNotificationV1beta2ReceiverSpec {
  /// Returns a new [IoFluxcdToolkitNotificationV1beta2ReceiverSpec] instance.
  IoFluxcdToolkitNotificationV1beta2ReceiverSpec({
    this.events = const [],
    this.interval,
    this.resources = const [],
    this.secretRef,
    this.suspend,
    required this.type,
  });

  /// Events specifies the list of event types to handle, e.g. 'push' for GitHub or 'Push Hook' for GitLab.
  List<String> events;

  /// Interval at which to reconcile the Receiver with its Secret references.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? interval;

  /// A list of resources to be notified about changes.
  List<IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner> resources;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitNotificationV1ReceiverSpecSecretRef? secretRef;

  /// Suspend tells the controller to suspend subsequent events handling for this receiver.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Type of webhook sender, used to determine the validation procedure and payload deserialization.
  IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitNotificationV1beta2ReceiverSpec &&
          deepEquality.equals(other.events, events) &&
          other.interval == interval &&
          deepEquality.equals(other.resources, resources) &&
          other.secretRef == secretRef &&
          other.suspend == suspend &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (events.hashCode) +
      (interval == null ? 0 : interval!.hashCode) +
      (resources.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitNotificationV1beta2ReceiverSpec[events=$events, interval=$interval, resources=$resources, secretRef=$secretRef, suspend=$suspend, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'events'] = this.events;
    if (this.interval != null) {
      json[r'interval'] = this.interval;
    } else {
      json[r'interval'] = null;
    }
    json[r'resources'] = this.resources;
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitNotificationV1beta2ReceiverSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitNotificationV1beta2ReceiverSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitNotificationV1beta2ReceiverSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitNotificationV1beta2ReceiverSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitNotificationV1beta2ReceiverSpec(
        events: json[r'events'] is Iterable
            ? (json[r'events'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        interval: mapValueOfType<String>(json, r'interval'),
        resources: IoFluxcdToolkitNotificationV1ReceiverSpecResourcesInner
            .listFromJson(json[r'resources']),
        secretRef: IoFluxcdToolkitNotificationV1ReceiverSpecSecretRef.fromJson(
            json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        type: IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.fromJson(
            json[r'type'])!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitNotificationV1beta2ReceiverSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1beta2ReceiverSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1beta2ReceiverSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitNotificationV1beta2ReceiverSpec>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitNotificationV1beta2ReceiverSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitNotificationV1beta2ReceiverSpec.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitNotificationV1beta2ReceiverSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitNotificationV1beta2ReceiverSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitNotificationV1beta2ReceiverSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitNotificationV1beta2ReceiverSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'resources',
    'type',
  };
}

/// Type of webhook sender, used to determine the validation procedure and payload deserialization.
class IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const generic =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'generic');
  static const genericHmac =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'generic-hmac');
  static const github =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'github');
  static const gitlab =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'gitlab');
  static const bitbucket =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'bitbucket');
  static const harbor =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'harbor');
  static const dockerhub =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'dockerhub');
  static const quay =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'quay');
  static const gcr =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'gcr');
  static const nexus =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'nexus');
  static const acr =
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum._(r'acr');

  /// List of all possible values in this [enum][IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum].
  static const values =
      <IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum>[
    generic,
    genericHmac,
    github,
    gitlab,
    bitbucket,
    harbor,
    dockerhub,
    quay,
    gcr,
    nexus,
    acr,
  ];

  static IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum].
class IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnumTypeTransformer {
  factory IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnumTypeTransformer._();

  String encode(IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'generic':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.generic;
        case r'generic-hmac':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum
              .genericHmac;
        case r'github':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.github;
        case r'gitlab':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.gitlab;
        case r'bitbucket':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum
              .bitbucket;
        case r'harbor':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.harbor;
        case r'dockerhub':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum
              .dockerhub;
        case r'quay':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.quay;
        case r'gcr':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.gcr;
        case r'nexus':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.nexus;
        case r'acr':
          return IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnum.acr;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnumTypeTransformer] instance.
  static IoFluxcdToolkitNotificationV1beta2ReceiverSpecTypeEnumTypeTransformer?
      _instance;
}
