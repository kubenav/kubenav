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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_order_status_authorizations_inner_challenges_inner.dart';

class IoCertManagerAcmeV1OrderStatusAuthorizationsInner {
  /// Returns a new [IoCertManagerAcmeV1OrderStatusAuthorizationsInner] instance.
  IoCertManagerAcmeV1OrderStatusAuthorizationsInner({
    this.challenges = const [],
    this.identifier,
    this.initialState,
    required this.url,
    this.wildcard,
  });

  /// Challenges specifies the challenge types offered by the ACME server. One of these challenge types will be selected when validating the DNS name and an appropriate Challenge resource will be created to perform the ACME challenge process.
  List<IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner>
      challenges;

  /// Identifier is the DNS name to be validated as part of this authorization
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? identifier;

  /// InitialState is the initial state of the ACME authorization when first fetched from the ACME server. If an Authorization is already 'valid', the Order controller will not create a Challenge resource for the authorization. This will occur when working with an ACME server that enables 'authz reuse' (such as Let's Encrypt's production endpoint). If not set and 'identifier' is set, the state is assumed to be pending and a Challenge will be created.
  IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum?
      initialState;

  /// URL is the URL of the Authorization that must be completed
  String url;

  /// Wildcard will be true if this authorization is for a wildcard DNS name. If this is true, the identifier will be the *non-wildcard* version of the DNS name. For example, if '*.example.com' is the DNS name being validated, this field will be 'true' and the 'identifier' field will be 'example.com'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? wildcard;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1OrderStatusAuthorizationsInner &&
          deepEquality.equals(other.challenges, challenges) &&
          other.identifier == identifier &&
          other.initialState == initialState &&
          other.url == url &&
          other.wildcard == wildcard;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (challenges.hashCode) +
      (identifier == null ? 0 : identifier!.hashCode) +
      (initialState == null ? 0 : initialState!.hashCode) +
      (url.hashCode) +
      (wildcard == null ? 0 : wildcard!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1OrderStatusAuthorizationsInner[challenges=$challenges, identifier=$identifier, initialState=$initialState, url=$url, wildcard=$wildcard]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'challenges'] = this.challenges;
    if (this.identifier != null) {
      json[r'identifier'] = this.identifier;
    } else {
      json[r'identifier'] = null;
    }
    if (this.initialState != null) {
      json[r'initialState'] = this.initialState;
    } else {
      json[r'initialState'] = null;
    }
    json[r'url'] = this.url;
    if (this.wildcard != null) {
      json[r'wildcard'] = this.wildcard;
    } else {
      json[r'wildcard'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1OrderStatusAuthorizationsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1OrderStatusAuthorizationsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1OrderStatusAuthorizationsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1OrderStatusAuthorizationsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1OrderStatusAuthorizationsInner(
        challenges:
            IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner
                .listFromJson(json[r'challenges']),
        identifier: mapValueOfType<String>(json, r'identifier'),
        initialState:
            IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
                .fromJson(json[r'initialState']),
        url: mapValueOfType<String>(json, r'url')!,
        wildcard: mapValueOfType<bool>(json, r'wildcard'),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1OrderStatusAuthorizationsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1OrderStatusAuthorizationsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1OrderStatusAuthorizationsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1OrderStatusAuthorizationsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1OrderStatusAuthorizationsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1OrderStatusAuthorizationsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1OrderStatusAuthorizationsInner-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1OrderStatusAuthorizationsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1OrderStatusAuthorizationsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1OrderStatusAuthorizationsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'url',
  };
}

/// InitialState is the initial state of the ACME authorization when first fetched from the ACME server. If an Authorization is already 'valid', the Order controller will not create a Challenge resource for the authorization. This will occur when working with an ACME server that enables 'authz reuse' (such as Let's Encrypt's production endpoint). If not set and 'identifier' is set, the state is assumed to be pending and a Challenge will be created.
class IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const valid =
      IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
          r'valid');
  static const ready =
      IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
          r'ready');
  static const pending =
      IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
          r'pending');
  static const processing =
      IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
          r'processing');
  static const invalid =
      IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
          r'invalid');
  static const expired =
      IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
          r'expired');
  static const errored =
      IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum._(
          r'errored');

  /// List of all possible values in this [enum][IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum].
  static const values =
      <IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum>[
    valid,
    ready,
    pending,
    processing,
    invalid,
    expired,
    errored,
  ];

  static IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum?
      fromJson(dynamic value) =>
          IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnumTypeTransformer()
              .decode(value);

  static List<IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum].
class IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnumTypeTransformer {
  factory IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnumTypeTransformer
              ._();

  const IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnumTypeTransformer._();

  String encode(
          IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'valid':
          return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              .valid;
        case r'ready':
          return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              .ready;
        case r'pending':
          return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              .pending;
        case r'processing':
          return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              .processing;
        case r'invalid':
          return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              .invalid;
        case r'expired':
          return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              .expired;
        case r'errored':
          return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnum
              .errored;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnumTypeTransformer] instance.
  static IoCertManagerAcmeV1OrderStatusAuthorizationsInnerInitialStateEnumTypeTransformer?
      _instance;
}
