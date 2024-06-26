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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_repository_spec_access_from.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_repository_spec_cert_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_image_v1beta1_image_repository_spec_secret_ref.dart';

class IoFluxcdToolkitImageV1beta1ImageRepositorySpec {
  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageRepositorySpec] instance.
  IoFluxcdToolkitImageV1beta1ImageRepositorySpec({
    this.accessFrom,
    this.certSecretRef,
    this.exclusionList = const [],
    this.image,
    this.interval,
    this.secretRef,
    this.serviceAccountName,
    this.suspend,
    this.timeout,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageRepositorySpecAccessFrom? accessFrom;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageRepositorySpecCertSecretRef? certSecretRef;

  /// ExclusionList is a list of regex strings used to exclude certain tags from being stored in the database.
  List<String> exclusionList;

  /// Image is the name of the image repository
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? image;

  /// Interval is the length of time to wait between scans of the image repository.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? interval;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitImageV1beta1ImageRepositorySpecSecretRef? secretRef;

  /// ServiceAccountName is the name of the Kubernetes ServiceAccount used to authenticate the image pull if the service account has attached pull secrets.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccountName;

  /// This flag tells the controller to suspend subsequent image scans. It does not apply to already started scans. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Timeout for image scanning. Defaults to 'Interval' duration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitImageV1beta1ImageRepositorySpec &&
          other.accessFrom == accessFrom &&
          other.certSecretRef == certSecretRef &&
          deepEquality.equals(other.exclusionList, exclusionList) &&
          other.image == image &&
          other.interval == interval &&
          other.secretRef == secretRef &&
          other.serviceAccountName == serviceAccountName &&
          other.suspend == suspend &&
          other.timeout == timeout;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessFrom == null ? 0 : accessFrom!.hashCode) +
      (certSecretRef == null ? 0 : certSecretRef!.hashCode) +
      (exclusionList.hashCode) +
      (image == null ? 0 : image!.hashCode) +
      (interval == null ? 0 : interval!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (serviceAccountName == null ? 0 : serviceAccountName!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitImageV1beta1ImageRepositorySpec[accessFrom=$accessFrom, certSecretRef=$certSecretRef, exclusionList=$exclusionList, image=$image, interval=$interval, secretRef=$secretRef, serviceAccountName=$serviceAccountName, suspend=$suspend, timeout=$timeout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessFrom != null) {
      json[r'accessFrom'] = this.accessFrom;
    } else {
      json[r'accessFrom'] = null;
    }
    if (this.certSecretRef != null) {
      json[r'certSecretRef'] = this.certSecretRef;
    } else {
      json[r'certSecretRef'] = null;
    }
    json[r'exclusionList'] = this.exclusionList;
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.interval != null) {
      json[r'interval'] = this.interval;
    } else {
      json[r'interval'] = null;
    }
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    if (this.serviceAccountName != null) {
      json[r'serviceAccountName'] = this.serviceAccountName;
    } else {
      json[r'serviceAccountName'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitImageV1beta1ImageRepositorySpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitImageV1beta1ImageRepositorySpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitImageV1beta1ImageRepositorySpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitImageV1beta1ImageRepositorySpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitImageV1beta1ImageRepositorySpec(
        accessFrom:
            IoFluxcdToolkitImageV1beta1ImageRepositorySpecAccessFrom.fromJson(
                json[r'accessFrom']),
        certSecretRef:
            IoFluxcdToolkitImageV1beta1ImageRepositorySpecCertSecretRef
                .fromJson(json[r'certSecretRef']),
        exclusionList: json[r'exclusionList'] is Iterable
            ? (json[r'exclusionList'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        image: mapValueOfType<String>(json, r'image'),
        interval: mapValueOfType<String>(json, r'interval'),
        secretRef:
            IoFluxcdToolkitImageV1beta1ImageRepositorySpecSecretRef.fromJson(
                json[r'secretRef']),
        serviceAccountName: mapValueOfType<String>(json, r'serviceAccountName'),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitImageV1beta1ImageRepositorySpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitImageV1beta1ImageRepositorySpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitImageV1beta1ImageRepositorySpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitImageV1beta1ImageRepositorySpec>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitImageV1beta1ImageRepositorySpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitImageV1beta1ImageRepositorySpec.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitImageV1beta1ImageRepositorySpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitImageV1beta1ImageRepositorySpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitImageV1beta1ImageRepositorySpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitImageV1beta1ImageRepositorySpec.listFromJson(
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
