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
import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_token_request.dart';

class IoK8sApiStorageV1CSIDriverSpec {
  /// Returns a new [IoK8sApiStorageV1CSIDriverSpec] instance.
  IoK8sApiStorageV1CSIDriverSpec({
    this.attachRequired,
    this.fsGroupPolicy,
    this.podInfoOnMount,
    this.requiresRepublish,
    this.seLinuxMount,
    this.storageCapacity,
    this.tokenRequests = const [],
    this.volumeLifecycleModes = const [],
  });

  /// attachRequired indicates this CSI volume driver requires an attach operation (because it implements the CSI ControllerPublishVolume() method), and that the Kubernetes attach detach controller should call the attach volume interface which checks the volumeattachment status and waits until the volume is attached before proceeding to mounting. The CSI external-attacher coordinates with CSI volume driver and updates the volumeattachment status when the attach operation is complete. If the CSIDriverRegistry feature gate is enabled and the value is specified to false, the attach operation will be skipped. Otherwise the attach operation will be called.  This field is immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? attachRequired;

  /// Defines if the underlying volume supports changing ownership and permission of the volume before being mounted. Refer to the specific FSGroupPolicy values for additional details.  This field is immutable.  Defaults to ReadWriteOnceWithFSType, which will examine each volume to determine if Kubernetes should modify ownership and permissions of the volume. With the default policy the defined fsGroup will only be applied if a fstype is defined and the volume's access mode contains ReadWriteOnce.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fsGroupPolicy;

  /// If set to true, podInfoOnMount indicates this CSI volume driver requires additional pod information (like podName, podUID, etc.) during mount operations. If set to false, pod information will not be passed on mount. Default is false. The CSI driver specifies podInfoOnMount as part of driver deployment. If true, Kubelet will pass pod information as VolumeContext in the CSI NodePublishVolume() calls. The CSI driver is responsible for parsing and validating the information passed in as VolumeContext. The following VolumeConext will be passed if podInfoOnMount is set to true. This list might grow, but the prefix will be used. \"csi.storage.k8s.io/pod.name\": pod.Name \"csi.storage.k8s.io/pod.namespace\": pod.Namespace \"csi.storage.k8s.io/pod.uid\": string(pod.UID) \"csi.storage.k8s.io/ephemeral\": \"true\" if the volume is an ephemeral inline volume                                 defined by a CSIVolumeSource, otherwise \"false\"  \"csi.storage.k8s.io/ephemeral\" is a new feature in Kubernetes 1.16. It is only required for drivers which support both the \"Persistent\" and \"Ephemeral\" VolumeLifecycleMode. Other drivers can leave pod info disabled and/or ignore this field. As Kubernetes 1.15 doesn't support this field, drivers can only support one mode when deployed on such a cluster and the deployment determines which mode that is, for example via a command line parameter of the driver.  This field is immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? podInfoOnMount;

  /// RequiresRepublish indicates the CSI driver wants `NodePublishVolume` being periodically called to reflect any possible change in the mounted volume. This field defaults to false.  Note: After a successful initial NodePublishVolume call, subsequent calls to NodePublishVolume should only update the contents of the volume. New mount points will not be seen by a running container.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? requiresRepublish;

  /// SELinuxMount specifies if the CSI driver supports \"-o context\" mount option.  When \"true\", the CSI driver must ensure that all volumes provided by this CSI driver can be mounted separately with different `-o context` options. This is typical for storage backends that provide volumes as filesystems on block devices or as independent shared volumes. Kubernetes will call NodeStage / NodePublish with \"-o context=xyz\" mount option when mounting a ReadWriteOncePod volume used in Pod that has explicitly set SELinux context. In the future, it may be expanded to other volume AccessModes. In any case, Kubernetes will ensure that the volume is mounted only with a single SELinux context.  When \"false\", Kubernetes won't pass any special SELinux mount options to the driver. This is typical for volumes that represent subdirectories of a bigger shared filesystem.  Default is \"false\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? seLinuxMount;

  /// If set to true, storageCapacity indicates that the CSI volume driver wants pod scheduling to consider the storage capacity that the driver deployment will report by creating CSIStorageCapacity objects with capacity information.  The check can be enabled immediately when deploying a driver. In that case, provisioning new volumes with late binding will pause until the driver deployment has published some suitable CSIStorageCapacity object.  Alternatively, the driver can be deployed with the field unset or false and it can be flipped later when storage capacity information has been published.  This field was immutable in Kubernetes <= 1.22 and now is mutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? storageCapacity;

  /// TokenRequests indicates the CSI driver needs pods' service account tokens it is mounting volume for to do necessary authentication. Kubelet will pass the tokens in VolumeContext in the CSI NodePublishVolume calls. The CSI driver should parse and validate the following VolumeContext: \"csi.storage.k8s.io/serviceAccount.tokens\": {   \"<audience>\": {     \"token\": <token>,     \"expirationTimestamp\": <expiration timestamp in RFC3339>,   },   ... }  Note: Audience in each TokenRequest should be different and at most one token is empty string. To receive a new token after expiry, RequiresRepublish can be used to trigger NodePublishVolume periodically.
  List<IoK8sApiStorageV1TokenRequest> tokenRequests;

  /// volumeLifecycleModes defines what kind of volumes this CSI volume driver supports. The default if the list is empty is \"Persistent\", which is the usage defined by the CSI specification and implemented in Kubernetes via the usual PV/PVC mechanism. The other mode is \"Ephemeral\". In this mode, volumes are defined inline inside the pod spec with CSIVolumeSource and their lifecycle is tied to the lifecycle of that pod. A driver has to be aware of this because it is only going to get a NodePublishVolume call for such a volume. For more information about implementing this mode, see https://kubernetes-csi.github.io/docs/ephemeral-local-volumes.html A driver can support one or more of these modes and more modes may be added in the future. This field is beta.  This field is immutable.
  List<String> volumeLifecycleModes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1CSIDriverSpec &&
          other.attachRequired == attachRequired &&
          other.fsGroupPolicy == fsGroupPolicy &&
          other.podInfoOnMount == podInfoOnMount &&
          other.requiresRepublish == requiresRepublish &&
          other.seLinuxMount == seLinuxMount &&
          other.storageCapacity == storageCapacity &&
          other.tokenRequests == tokenRequests &&
          other.volumeLifecycleModes == volumeLifecycleModes;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (attachRequired == null ? 0 : attachRequired!.hashCode) +
      (fsGroupPolicy == null ? 0 : fsGroupPolicy!.hashCode) +
      (podInfoOnMount == null ? 0 : podInfoOnMount!.hashCode) +
      (requiresRepublish == null ? 0 : requiresRepublish!.hashCode) +
      (seLinuxMount == null ? 0 : seLinuxMount!.hashCode) +
      (storageCapacity == null ? 0 : storageCapacity!.hashCode) +
      (tokenRequests.hashCode) +
      (volumeLifecycleModes.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1CSIDriverSpec[attachRequired=$attachRequired, fsGroupPolicy=$fsGroupPolicy, podInfoOnMount=$podInfoOnMount, requiresRepublish=$requiresRepublish, seLinuxMount=$seLinuxMount, storageCapacity=$storageCapacity, tokenRequests=$tokenRequests, volumeLifecycleModes=$volumeLifecycleModes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.attachRequired != null) {
      json[r'attachRequired'] = this.attachRequired;
    } else {
      json[r'attachRequired'] = null;
    }
    if (this.fsGroupPolicy != null) {
      json[r'fsGroupPolicy'] = this.fsGroupPolicy;
    } else {
      json[r'fsGroupPolicy'] = null;
    }
    if (this.podInfoOnMount != null) {
      json[r'podInfoOnMount'] = this.podInfoOnMount;
    } else {
      json[r'podInfoOnMount'] = null;
    }
    if (this.requiresRepublish != null) {
      json[r'requiresRepublish'] = this.requiresRepublish;
    } else {
      json[r'requiresRepublish'] = null;
    }
    if (this.seLinuxMount != null) {
      json[r'seLinuxMount'] = this.seLinuxMount;
    } else {
      json[r'seLinuxMount'] = null;
    }
    if (this.storageCapacity != null) {
      json[r'storageCapacity'] = this.storageCapacity;
    } else {
      json[r'storageCapacity'] = null;
    }
    json[r'tokenRequests'] = this.tokenRequests;
    json[r'volumeLifecycleModes'] = this.volumeLifecycleModes;
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1CSIDriverSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1CSIDriverSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1CSIDriverSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1CSIDriverSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1CSIDriverSpec(
        attachRequired: mapValueOfType<bool>(json, r'attachRequired'),
        fsGroupPolicy: mapValueOfType<String>(json, r'fsGroupPolicy'),
        podInfoOnMount: mapValueOfType<bool>(json, r'podInfoOnMount'),
        requiresRepublish: mapValueOfType<bool>(json, r'requiresRepublish'),
        seLinuxMount: mapValueOfType<bool>(json, r'seLinuxMount'),
        storageCapacity: mapValueOfType<bool>(json, r'storageCapacity'),
        tokenRequests: IoK8sApiStorageV1TokenRequest.listFromJson(
                json[r'tokenRequests']) ??
            const [],
        volumeLifecycleModes: json[r'volumeLifecycleModes'] is List
            ? (json[r'volumeLifecycleModes'] as List).cast<String>()
            : const [],
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1CSIDriverSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1CSIDriverSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1CSIDriverSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1CSIDriverSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiStorageV1CSIDriverSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1CSIDriverSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1CSIDriverSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1CSIDriverSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1CSIDriverSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1CSIDriverSpec.listFromJson(
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
