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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container_port.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_env_from_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_env_var.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_lifecycle.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_probe.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_resource_requirements.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_security_context.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_volume_device.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_volume_mount.dart';

class IoK8sApiCoreV1EphemeralContainer {
  /// Returns a new [IoK8sApiCoreV1EphemeralContainer] instance.
  IoK8sApiCoreV1EphemeralContainer({
    this.args = const [],
    this.command = const [],
    this.env = const [],
    this.envFrom = const [],
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    required this.name,
    this.ports = const [],
    this.readinessProbe,
    this.resources,
    this.securityContext,
    this.startupProbe,
    this.stdin,
    this.stdinOnce,
    this.targetContainerName,
    this.terminationMessagePath,
    this.terminationMessagePolicy,
    this.tty,
    this.volumeDevices = const [],
    this.volumeMounts = const [],
    this.workingDir,
  });

  /// Arguments to the entrypoint. The image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. \"$$(VAR_NAME)\" will produce the string literal \"$(VAR_NAME)\". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  List<String> args;

  /// Entrypoint array. Not executed within a shell. The image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. \"$$(VAR_NAME)\" will produce the string literal \"$(VAR_NAME)\". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  List<String> command;

  /// List of environment variables to set in the container. Cannot be updated.
  List<IoK8sApiCoreV1EnvVar> env;

  /// List of sources to populate environment variables in the container. The keys defined within a source must be a C_IDENTIFIER. All invalid keys will be reported as an event when the container is starting. When a key exists in multiple sources, the value associated with the last source will take precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be updated.
  List<IoK8sApiCoreV1EnvFromSource> envFrom;

  /// Container image name. More info: https://kubernetes.io/docs/concepts/containers/images
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? image;

  /// Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imagePullPolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Lifecycle? lifecycle;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Probe? livenessProbe;

  /// Name of the ephemeral container specified as a DNS_LABEL. This name must be unique among all containers, init containers and ephemeral containers.
  String name;

  /// Ports are not allowed for ephemeral containers.
  List<IoK8sApiCoreV1ContainerPort> ports;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Probe? readinessProbe;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ResourceRequirements? resources;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecurityContext? securityContext;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Probe? startupProbe;

  /// Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? stdin;

  /// Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF. Default is false
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? stdinOnce;

  /// If set, the name of the container from PodSpec that this ephemeral container targets. The ephemeral container will be run in the namespaces (IPC, PID, etc) of this container. If not set then the ephemeral container uses the namespaces configured in the Pod spec.  The container runtime must implement support for this feature. If the runtime does not support namespace targeting then the result of setting this field is undefined.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetContainerName;

  /// Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? terminationMessagePath;

  /// Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? terminationMessagePolicy;

  /// Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? tty;

  /// volumeDevices is the list of block devices to be used by the container.
  List<IoK8sApiCoreV1VolumeDevice> volumeDevices;

  /// Pod volumes to mount into the container's filesystem. Subpath mounts are not allowed for ephemeral containers. Cannot be updated.
  List<IoK8sApiCoreV1VolumeMount> volumeMounts;

  /// Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workingDir;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1EphemeralContainer &&
          other.args == args &&
          other.command == command &&
          other.env == env &&
          other.envFrom == envFrom &&
          other.image == image &&
          other.imagePullPolicy == imagePullPolicy &&
          other.lifecycle == lifecycle &&
          other.livenessProbe == livenessProbe &&
          other.name == name &&
          other.ports == ports &&
          other.readinessProbe == readinessProbe &&
          other.resources == resources &&
          other.securityContext == securityContext &&
          other.startupProbe == startupProbe &&
          other.stdin == stdin &&
          other.stdinOnce == stdinOnce &&
          other.targetContainerName == targetContainerName &&
          other.terminationMessagePath == terminationMessagePath &&
          other.terminationMessagePolicy == terminationMessagePolicy &&
          other.tty == tty &&
          other.volumeDevices == volumeDevices &&
          other.volumeMounts == volumeMounts &&
          other.workingDir == workingDir;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (args.hashCode) +
      (command.hashCode) +
      (env.hashCode) +
      (envFrom.hashCode) +
      (image == null ? 0 : image!.hashCode) +
      (imagePullPolicy == null ? 0 : imagePullPolicy!.hashCode) +
      (lifecycle == null ? 0 : lifecycle!.hashCode) +
      (livenessProbe == null ? 0 : livenessProbe!.hashCode) +
      (name.hashCode) +
      (ports.hashCode) +
      (readinessProbe == null ? 0 : readinessProbe!.hashCode) +
      (resources == null ? 0 : resources!.hashCode) +
      (securityContext == null ? 0 : securityContext!.hashCode) +
      (startupProbe == null ? 0 : startupProbe!.hashCode) +
      (stdin == null ? 0 : stdin!.hashCode) +
      (stdinOnce == null ? 0 : stdinOnce!.hashCode) +
      (targetContainerName == null ? 0 : targetContainerName!.hashCode) +
      (terminationMessagePath == null ? 0 : terminationMessagePath!.hashCode) +
      (terminationMessagePolicy == null
          ? 0
          : terminationMessagePolicy!.hashCode) +
      (tty == null ? 0 : tty!.hashCode) +
      (volumeDevices.hashCode) +
      (volumeMounts.hashCode) +
      (workingDir == null ? 0 : workingDir!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1EphemeralContainer[args=$args, command=$command, env=$env, envFrom=$envFrom, image=$image, imagePullPolicy=$imagePullPolicy, lifecycle=$lifecycle, livenessProbe=$livenessProbe, name=$name, ports=$ports, readinessProbe=$readinessProbe, resources=$resources, securityContext=$securityContext, startupProbe=$startupProbe, stdin=$stdin, stdinOnce=$stdinOnce, targetContainerName=$targetContainerName, terminationMessagePath=$terminationMessagePath, terminationMessagePolicy=$terminationMessagePolicy, tty=$tty, volumeDevices=$volumeDevices, volumeMounts=$volumeMounts, workingDir=$workingDir]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'args'] = this.args;
    json[r'command'] = this.command;
    json[r'env'] = this.env;
    json[r'envFrom'] = this.envFrom;
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.imagePullPolicy != null) {
      json[r'imagePullPolicy'] = this.imagePullPolicy;
    } else {
      json[r'imagePullPolicy'] = null;
    }
    if (this.lifecycle != null) {
      json[r'lifecycle'] = this.lifecycle;
    } else {
      json[r'lifecycle'] = null;
    }
    if (this.livenessProbe != null) {
      json[r'livenessProbe'] = this.livenessProbe;
    } else {
      json[r'livenessProbe'] = null;
    }
    json[r'name'] = this.name;
    json[r'ports'] = this.ports;
    if (this.readinessProbe != null) {
      json[r'readinessProbe'] = this.readinessProbe;
    } else {
      json[r'readinessProbe'] = null;
    }
    if (this.resources != null) {
      json[r'resources'] = this.resources;
    } else {
      json[r'resources'] = null;
    }
    if (this.securityContext != null) {
      json[r'securityContext'] = this.securityContext;
    } else {
      json[r'securityContext'] = null;
    }
    if (this.startupProbe != null) {
      json[r'startupProbe'] = this.startupProbe;
    } else {
      json[r'startupProbe'] = null;
    }
    if (this.stdin != null) {
      json[r'stdin'] = this.stdin;
    } else {
      json[r'stdin'] = null;
    }
    if (this.stdinOnce != null) {
      json[r'stdinOnce'] = this.stdinOnce;
    } else {
      json[r'stdinOnce'] = null;
    }
    if (this.targetContainerName != null) {
      json[r'targetContainerName'] = this.targetContainerName;
    } else {
      json[r'targetContainerName'] = null;
    }
    if (this.terminationMessagePath != null) {
      json[r'terminationMessagePath'] = this.terminationMessagePath;
    } else {
      json[r'terminationMessagePath'] = null;
    }
    if (this.terminationMessagePolicy != null) {
      json[r'terminationMessagePolicy'] = this.terminationMessagePolicy;
    } else {
      json[r'terminationMessagePolicy'] = null;
    }
    if (this.tty != null) {
      json[r'tty'] = this.tty;
    } else {
      json[r'tty'] = null;
    }
    json[r'volumeDevices'] = this.volumeDevices;
    json[r'volumeMounts'] = this.volumeMounts;
    if (this.workingDir != null) {
      json[r'workingDir'] = this.workingDir;
    } else {
      json[r'workingDir'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1EphemeralContainer] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1EphemeralContainer? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1EphemeralContainer[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1EphemeralContainer[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1EphemeralContainer(
        args: json[r'args'] is List
            ? (json[r'args'] as List).cast<String>()
            : const [],
        command: json[r'command'] is List
            ? (json[r'command'] as List).cast<String>()
            : const [],
        env: IoK8sApiCoreV1EnvVar.listFromJson(json[r'env']) ?? const [],
        envFrom: IoK8sApiCoreV1EnvFromSource.listFromJson(json[r'envFrom']) ??
            const [],
        image: mapValueOfType<String>(json, r'image'),
        imagePullPolicy: mapValueOfType<String>(json, r'imagePullPolicy'),
        lifecycle: IoK8sApiCoreV1Lifecycle.fromJson(json[r'lifecycle']),
        livenessProbe: IoK8sApiCoreV1Probe.fromJson(json[r'livenessProbe']),
        name: mapValueOfType<String>(json, r'name')!,
        ports: IoK8sApiCoreV1ContainerPort.listFromJson(json[r'ports']) ??
            const [],
        readinessProbe: IoK8sApiCoreV1Probe.fromJson(json[r'readinessProbe']),
        resources:
            IoK8sApiCoreV1ResourceRequirements.fromJson(json[r'resources']),
        securityContext:
            IoK8sApiCoreV1SecurityContext.fromJson(json[r'securityContext']),
        startupProbe: IoK8sApiCoreV1Probe.fromJson(json[r'startupProbe']),
        stdin: mapValueOfType<bool>(json, r'stdin'),
        stdinOnce: mapValueOfType<bool>(json, r'stdinOnce'),
        targetContainerName:
            mapValueOfType<String>(json, r'targetContainerName'),
        terminationMessagePath:
            mapValueOfType<String>(json, r'terminationMessagePath'),
        terminationMessagePolicy:
            mapValueOfType<String>(json, r'terminationMessagePolicy'),
        tty: mapValueOfType<bool>(json, r'tty'),
        volumeDevices:
            IoK8sApiCoreV1VolumeDevice.listFromJson(json[r'volumeDevices']) ??
                const [],
        volumeMounts:
            IoK8sApiCoreV1VolumeMount.listFromJson(json[r'volumeMounts']) ??
                const [],
        workingDir: mapValueOfType<String>(json, r'workingDir'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1EphemeralContainer>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EphemeralContainer>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EphemeralContainer.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1EphemeralContainer> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1EphemeralContainer>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EphemeralContainer.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1EphemeralContainer-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1EphemeralContainer>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1EphemeralContainer>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EphemeralContainer.listFromJson(
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
    'name',
  };
}
