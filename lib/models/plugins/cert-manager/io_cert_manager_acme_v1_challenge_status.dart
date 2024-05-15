//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoCertManagerAcmeV1ChallengeStatus {
  /// Returns a new [IoCertManagerAcmeV1ChallengeStatus] instance.
  IoCertManagerAcmeV1ChallengeStatus({
    this.presented,
    this.processing,
    this.reason,
    this.state,
  });

  /// presented will be set to true if the challenge values for this challenge are currently 'presented'. This *does not* imply the self check is passing. Only that the values have been 'submitted' for the appropriate challenge mechanism (i.e. the DNS01 TXT record has been presented, or the HTTP01 configuration has been configured).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? presented;

  /// Used to denote whether this challenge should be processed or not. This field will only be set to true by the 'scheduling' component. It will only be set to false by the 'challenges' controller, after the challenge has reached a final state or timed out. If this field is set to false, the challenge controller will not take any more action.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? processing;

  /// Contains human readable information on why the Challenge is in the current state.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Contains the current 'state' of the challenge. If not set, the state of the challenge is unknown.
  IoCertManagerAcmeV1ChallengeStatusStateEnum? state;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeStatus &&
          other.presented == presented &&
          other.processing == processing &&
          other.reason == reason &&
          other.state == state;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (presented == null ? 0 : presented!.hashCode) +
      (processing == null ? 0 : processing!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (state == null ? 0 : state!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeStatus[presented=$presented, processing=$processing, reason=$reason, state=$state]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.presented != null) {
      json[r'presented'] = this.presented;
    } else {
      json[r'presented'] = null;
    }
    if (this.processing != null) {
      json[r'processing'] = this.processing;
    } else {
      json[r'processing'] = null;
    }
    if (this.reason != null) {
      json[r'reason'] = this.reason;
    } else {
      json[r'reason'] = null;
    }
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
      json[r'state'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeStatus(
        presented: mapValueOfType<bool>(json, r'presented'),
        processing: mapValueOfType<bool>(json, r'processing'),
        reason: mapValueOfType<String>(json, r'reason'),
        state: IoCertManagerAcmeV1ChallengeStatusStateEnum.fromJson(
            json[r'state']),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1ChallengeStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerAcmeV1ChallengeStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeStatus-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerAcmeV1ChallengeStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerAcmeV1ChallengeStatus.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}

/// Contains the current 'state' of the challenge. If not set, the state of the challenge is unknown.
class IoCertManagerAcmeV1ChallengeStatusStateEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerAcmeV1ChallengeStatusStateEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const valid = IoCertManagerAcmeV1ChallengeStatusStateEnum._(r'valid');
  static const ready = IoCertManagerAcmeV1ChallengeStatusStateEnum._(r'ready');
  static const pending =
      IoCertManagerAcmeV1ChallengeStatusStateEnum._(r'pending');
  static const processing =
      IoCertManagerAcmeV1ChallengeStatusStateEnum._(r'processing');
  static const invalid =
      IoCertManagerAcmeV1ChallengeStatusStateEnum._(r'invalid');
  static const expired =
      IoCertManagerAcmeV1ChallengeStatusStateEnum._(r'expired');
  static const errored =
      IoCertManagerAcmeV1ChallengeStatusStateEnum._(r'errored');

  /// List of all possible values in this [enum][IoCertManagerAcmeV1ChallengeStatusStateEnum].
  static const values = <IoCertManagerAcmeV1ChallengeStatusStateEnum>[
    valid,
    ready,
    pending,
    processing,
    invalid,
    expired,
    errored,
  ];

  static IoCertManagerAcmeV1ChallengeStatusStateEnum? fromJson(dynamic value) =>
      IoCertManagerAcmeV1ChallengeStatusStateEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerAcmeV1ChallengeStatusStateEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeStatusStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1ChallengeStatusStateEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerAcmeV1ChallengeStatusStateEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerAcmeV1ChallengeStatusStateEnum].
class IoCertManagerAcmeV1ChallengeStatusStateEnumTypeTransformer {
  factory IoCertManagerAcmeV1ChallengeStatusStateEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerAcmeV1ChallengeStatusStateEnumTypeTransformer._();

  const IoCertManagerAcmeV1ChallengeStatusStateEnumTypeTransformer._();

  String encode(IoCertManagerAcmeV1ChallengeStatusStateEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerAcmeV1ChallengeStatusStateEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerAcmeV1ChallengeStatusStateEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'valid':
          return IoCertManagerAcmeV1ChallengeStatusStateEnum.valid;
        case r'ready':
          return IoCertManagerAcmeV1ChallengeStatusStateEnum.ready;
        case r'pending':
          return IoCertManagerAcmeV1ChallengeStatusStateEnum.pending;
        case r'processing':
          return IoCertManagerAcmeV1ChallengeStatusStateEnum.processing;
        case r'invalid':
          return IoCertManagerAcmeV1ChallengeStatusStateEnum.invalid;
        case r'expired':
          return IoCertManagerAcmeV1ChallengeStatusStateEnum.expired;
        case r'errored':
          return IoCertManagerAcmeV1ChallengeStatusStateEnum.errored;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerAcmeV1ChallengeStatusStateEnumTypeTransformer] instance.
  static IoCertManagerAcmeV1ChallengeStatusStateEnumTypeTransformer? _instance;
}
