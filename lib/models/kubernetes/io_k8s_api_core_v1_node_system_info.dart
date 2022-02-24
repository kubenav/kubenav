//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1NodeSystemInfo {
  /// Returns a new [IoK8sApiCoreV1NodeSystemInfo] instance.
  IoK8sApiCoreV1NodeSystemInfo({
    required this.architecture,
    required this.bootID,
    required this.containerRuntimeVersion,
    required this.kernelVersion,
    required this.kubeProxyVersion,
    required this.kubeletVersion,
    required this.machineID,
    required this.operatingSystem,
    required this.osImage,
    required this.systemUUID,
  });

  /// The Architecture reported by the node
  String architecture;

  /// Boot ID reported by the node.
  String bootID;

  /// ContainerRuntime Version reported by the node through runtime remote API (e.g. docker://1.5.0).
  String containerRuntimeVersion;

  /// Kernel Version reported by the node from 'uname -r' (e.g. 3.16.0-0.bpo.4-amd64).
  String kernelVersion;

  /// KubeProxy Version reported by the node.
  String kubeProxyVersion;

  /// Kubelet Version reported by the node.
  String kubeletVersion;

  /// MachineID reported by the node. For unique machine identification in the cluster this field is preferred. Learn more from man(5) machine-id: http://man7.org/linux/man-pages/man5/machine-id.5.html
  String machineID;

  /// The Operating System reported by the node
  String operatingSystem;

  /// OS Image reported by the node from /etc/os-release (e.g. Debian GNU/Linux 7 (wheezy)).
  String osImage;

  /// SystemUUID reported by the node. For unique machine identification MachineID is preferred. This field is specific to Red Hat hosts https://access.redhat.com/documentation/en-us/red_hat_subscription_management/1/html/rhsm/uuid
  String systemUUID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1NodeSystemInfo &&
          other.architecture == architecture &&
          other.bootID == bootID &&
          other.containerRuntimeVersion == containerRuntimeVersion &&
          other.kernelVersion == kernelVersion &&
          other.kubeProxyVersion == kubeProxyVersion &&
          other.kubeletVersion == kubeletVersion &&
          other.machineID == machineID &&
          other.operatingSystem == operatingSystem &&
          other.osImage == osImage &&
          other.systemUUID == systemUUID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (architecture.hashCode) +
      (bootID.hashCode) +
      (containerRuntimeVersion.hashCode) +
      (kernelVersion.hashCode) +
      (kubeProxyVersion.hashCode) +
      (kubeletVersion.hashCode) +
      (machineID.hashCode) +
      (operatingSystem.hashCode) +
      (osImage.hashCode) +
      (systemUUID.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1NodeSystemInfo[architecture=$architecture, bootID=$bootID, containerRuntimeVersion=$containerRuntimeVersion, kernelVersion=$kernelVersion, kubeProxyVersion=$kubeProxyVersion, kubeletVersion=$kubeletVersion, machineID=$machineID, operatingSystem=$operatingSystem, osImage=$osImage, systemUUID=$systemUUID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'architecture'] = architecture;
    json[r'bootID'] = bootID;
    json[r'containerRuntimeVersion'] = containerRuntimeVersion;
    json[r'kernelVersion'] = kernelVersion;
    json[r'kubeProxyVersion'] = kubeProxyVersion;
    json[r'kubeletVersion'] = kubeletVersion;
    json[r'machineID'] = machineID;
    json[r'operatingSystem'] = operatingSystem;
    json[r'osImage'] = osImage;
    json[r'systemUUID'] = systemUUID;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1NodeSystemInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1NodeSystemInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1NodeSystemInfo[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1NodeSystemInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1NodeSystemInfo(
        architecture: mapValueOfType<String>(json, r'architecture')!,
        bootID: mapValueOfType<String>(json, r'bootID')!,
        containerRuntimeVersion:
            mapValueOfType<String>(json, r'containerRuntimeVersion')!,
        kernelVersion: mapValueOfType<String>(json, r'kernelVersion')!,
        kubeProxyVersion: mapValueOfType<String>(json, r'kubeProxyVersion')!,
        kubeletVersion: mapValueOfType<String>(json, r'kubeletVersion')!,
        machineID: mapValueOfType<String>(json, r'machineID')!,
        operatingSystem: mapValueOfType<String>(json, r'operatingSystem')!,
        osImage: mapValueOfType<String>(json, r'osImage')!,
        systemUUID: mapValueOfType<String>(json, r'systemUUID')!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1NodeSystemInfo>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1NodeSystemInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1NodeSystemInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1NodeSystemInfo> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1NodeSystemInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeSystemInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1NodeSystemInfo-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1NodeSystemInfo>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1NodeSystemInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1NodeSystemInfo.listFromJson(
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
    'architecture',
    'bootID',
    'containerRuntimeVersion',
    'kernelVersion',
    'kubeProxyVersion',
    'kubeletVersion',
    'machineID',
    'operatingSystem',
    'osImage',
    'systemUUID',
  };
}
