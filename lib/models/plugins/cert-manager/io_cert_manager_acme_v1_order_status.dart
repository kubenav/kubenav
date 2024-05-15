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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_order_status_authorizations_inner.dart';

class IoCertManagerAcmeV1OrderStatus {
  /// Returns a new [IoCertManagerAcmeV1OrderStatus] instance.
  IoCertManagerAcmeV1OrderStatus({
    this.authorizations = const [],
    this.certificate,
    this.failureTime,
    this.finalizeURL,
    this.reason,
    this.state,
    this.url,
  });

  /// Authorizations contains data returned from the ACME server on what authorizations must be completed in order to validate the DNS names specified on the Order.
  List<IoCertManagerAcmeV1OrderStatusAuthorizationsInner> authorizations;

  /// Certificate is a copy of the PEM encoded certificate for this Order. This field will be populated after the order has been successfully finalized with the ACME server, and the order has transitioned to the 'valid' state.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? certificate;

  /// FailureTime stores the time that this order failed. This is used to influence garbage collection and back-off.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? failureTime;

  /// FinalizeURL of the Order. This is used to obtain certificates for this order once it has been completed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? finalizeURL;

  /// Reason optionally provides more information about a why the order is in the current state.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// State contains the current state of this Order resource. States 'success' and 'expired' are 'final'
  IoCertManagerAcmeV1OrderStatusStateEnum? state;

  /// URL of the Order. This will initially be empty when the resource is first created. The Order controller will populate this field when the Order is first processed. This field will be immutable after it is initially set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1OrderStatus &&
          deepEquality.equals(other.authorizations, authorizations) &&
          other.certificate == certificate &&
          other.failureTime == failureTime &&
          other.finalizeURL == finalizeURL &&
          other.reason == reason &&
          other.state == state &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (authorizations.hashCode) +
      (certificate == null ? 0 : certificate!.hashCode) +
      (failureTime == null ? 0 : failureTime!.hashCode) +
      (finalizeURL == null ? 0 : finalizeURL!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (state == null ? 0 : state!.hashCode) +
      (url == null ? 0 : url!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1OrderStatus[authorizations=$authorizations, certificate=$certificate, failureTime=$failureTime, finalizeURL=$finalizeURL, reason=$reason, state=$state, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'authorizations'] = this.authorizations;
    if (this.certificate != null) {
      json[r'certificate'] = this.certificate;
    } else {
      json[r'certificate'] = null;
    }
    if (this.failureTime != null) {
      json[r'failureTime'] = this.failureTime!.toUtc().toIso8601String();
    } else {
      json[r'failureTime'] = null;
    }
    if (this.finalizeURL != null) {
      json[r'finalizeURL'] = this.finalizeURL;
    } else {
      json[r'finalizeURL'] = null;
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
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1OrderStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1OrderStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1OrderStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1OrderStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1OrderStatus(
        authorizations:
            IoCertManagerAcmeV1OrderStatusAuthorizationsInner.listFromJson(
                json[r'authorizations']),
        certificate: mapValueOfType<String>(json, r'certificate'),
        failureTime: mapDateTime(json, r'failureTime', r''),
        finalizeURL: mapValueOfType<String>(json, r'finalizeURL'),
        reason: mapValueOfType<String>(json, r'reason'),
        state: IoCertManagerAcmeV1OrderStatusStateEnum.fromJson(json[r'state']),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1OrderStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1OrderStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1OrderStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1OrderStatus> mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1OrderStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerAcmeV1OrderStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1OrderStatus-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1OrderStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoCertManagerAcmeV1OrderStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoCertManagerAcmeV1OrderStatus.listFromJson(
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

/// State contains the current state of this Order resource. States 'success' and 'expired' are 'final'
class IoCertManagerAcmeV1OrderStatusStateEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerAcmeV1OrderStatusStateEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const valid = IoCertManagerAcmeV1OrderStatusStateEnum._(r'valid');
  static const ready = IoCertManagerAcmeV1OrderStatusStateEnum._(r'ready');
  static const pending = IoCertManagerAcmeV1OrderStatusStateEnum._(r'pending');
  static const processing =
      IoCertManagerAcmeV1OrderStatusStateEnum._(r'processing');
  static const invalid = IoCertManagerAcmeV1OrderStatusStateEnum._(r'invalid');
  static const expired = IoCertManagerAcmeV1OrderStatusStateEnum._(r'expired');
  static const errored = IoCertManagerAcmeV1OrderStatusStateEnum._(r'errored');

  /// List of all possible values in this [enum][IoCertManagerAcmeV1OrderStatusStateEnum].
  static const values = <IoCertManagerAcmeV1OrderStatusStateEnum>[
    valid,
    ready,
    pending,
    processing,
    invalid,
    expired,
    errored,
  ];

  static IoCertManagerAcmeV1OrderStatusStateEnum? fromJson(dynamic value) =>
      IoCertManagerAcmeV1OrderStatusStateEnumTypeTransformer().decode(value);

  static List<IoCertManagerAcmeV1OrderStatusStateEnum> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1OrderStatusStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoCertManagerAcmeV1OrderStatusStateEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerAcmeV1OrderStatusStateEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerAcmeV1OrderStatusStateEnum].
class IoCertManagerAcmeV1OrderStatusStateEnumTypeTransformer {
  factory IoCertManagerAcmeV1OrderStatusStateEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerAcmeV1OrderStatusStateEnumTypeTransformer._();

  const IoCertManagerAcmeV1OrderStatusStateEnumTypeTransformer._();

  String encode(IoCertManagerAcmeV1OrderStatusStateEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerAcmeV1OrderStatusStateEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerAcmeV1OrderStatusStateEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'valid':
          return IoCertManagerAcmeV1OrderStatusStateEnum.valid;
        case r'ready':
          return IoCertManagerAcmeV1OrderStatusStateEnum.ready;
        case r'pending':
          return IoCertManagerAcmeV1OrderStatusStateEnum.pending;
        case r'processing':
          return IoCertManagerAcmeV1OrderStatusStateEnum.processing;
        case r'invalid':
          return IoCertManagerAcmeV1OrderStatusStateEnum.invalid;
        case r'expired':
          return IoCertManagerAcmeV1OrderStatusStateEnum.expired;
        case r'errored':
          return IoCertManagerAcmeV1OrderStatusStateEnum.errored;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerAcmeV1OrderStatusStateEnumTypeTransformer] instance.
  static IoCertManagerAcmeV1OrderStatusStateEnumTypeTransformer? _instance;
}
