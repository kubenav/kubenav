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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_affinity.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_ephemeral_container.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_host_alias.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_local_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_dns_config.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_os.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_readiness_gate.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_security_context.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_toleration.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_topology_spread_constraint.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_volume.dart';

class IoK8sApiCoreV1PodSpec {
  /// Returns a new [IoK8sApiCoreV1PodSpec] instance.
  IoK8sApiCoreV1PodSpec({
    this.activeDeadlineSeconds,
    this.affinity,
    this.automountServiceAccountToken,
    this.containers = const [],
    this.dnsConfig,
    this.dnsPolicy,
    this.enableServiceLinks,
    this.ephemeralContainers = const [],
    this.hostAliases = const [],
    this.hostIPC,
    this.hostNetwork,
    this.hostPID,
    this.hostname,
    this.imagePullSecrets = const [],
    this.initContainers = const [],
    this.nodeName,
    this.nodeSelector = const {},
    this.os,
    this.overhead = const {},
    this.preemptionPolicy,
    this.priority,
    this.priorityClassName,
    this.readinessGates = const [],
    this.restartPolicy,
    this.runtimeClassName,
    this.schedulerName,
    this.securityContext,
    this.serviceAccount,
    this.serviceAccountName,
    this.setHostnameAsFQDN,
    this.shareProcessNamespace,
    this.subdomain,
    this.terminationGracePeriodSeconds,
    this.tolerations = const [],
    this.topologySpreadConstraints = const [],
    this.volumes = const [],
  });

  /// Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? activeDeadlineSeconds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Affinity? affinity;

  /// AutomountServiceAccountToken indicates whether a service account token should be automatically mounted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? automountServiceAccountToken;

  /// List of containers belonging to the pod. Containers cannot currently be added or removed. There must be at least one container in a Pod. Cannot be updated.
  List<IoK8sApiCoreV1Container> containers;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PodDNSConfig? dnsConfig;

  /// Set DNS policy for the pod. Defaults to \"ClusterFirst\". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'.  Possible enum values:  - `\"ClusterFirst\"` indicates that the pod should use cluster DNS first unless hostNetwork is true, if it is available, then fall back on the default (as determined by kubelet) DNS settings.  - `\"ClusterFirstWithHostNet\"` indicates that the pod should use cluster DNS first, if it is available, then fall back on the default (as determined by kubelet) DNS settings.  - `\"Default\"` indicates that the pod should use the default (as determined by kubelet) DNS settings.  - `\"None\"` indicates that the pod should use empty DNS settings. DNS parameters such as nameservers and search paths should be defined via DNSConfig.
  IoK8sApiCoreV1PodSpecDnsPolicyEnum? dnsPolicy;

  /// EnableServiceLinks indicates whether information about services should be injected into pod's environment variables, matching the syntax of Docker links. Optional: Defaults to true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enableServiceLinks;

  /// List of ephemeral containers run in this pod. Ephemeral containers may be run in an existing pod to perform user-initiated actions such as debugging. This list cannot be specified when creating a pod, and it cannot be modified by updating the pod spec. In order to add an ephemeral container to an existing pod, use the pod's ephemeralcontainers subresource. This field is beta-level and available on clusters that haven't disabled the EphemeralContainers feature gate.
  List<IoK8sApiCoreV1EphemeralContainer> ephemeralContainers;

  /// HostAliases is an optional list of hosts and IPs that will be injected into the pod's hosts file if specified. This is only valid for non-hostNetwork pods.
  List<IoK8sApiCoreV1HostAlias> hostAliases;

  /// Use the host's ipc namespace. Optional: Default to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostIPC;

  /// Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified. Default to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostNetwork;

  /// Use the host's pid namespace. Optional: Default to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostPID;

  /// Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostname;

  /// ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec. If specified, these secrets will be passed to individual puller implementations for them to use. For example, in the case of docker, only DockerConfig type secrets are honored. More info: https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod
  List<IoK8sApiCoreV1LocalObjectReference> imagePullSecrets;

  /// List of initialization containers belonging to the pod. Init containers are executed in order prior to containers being started. If any init container fails, the pod is considered to have failed and is handled according to its restartPolicy. The name for an init container or normal container must be unique among all containers. Init containers may not have Lifecycle actions, Readiness probes, Liveness probes, or Startup probes. The resourceRequirements of an init container are taken into account during scheduling by finding the highest request/limit for each resource type, and then using the max of of that value or the sum of the normal containers. Limits are applied to init containers in a similar fashion. Init containers cannot currently be added or removed. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
  List<IoK8sApiCoreV1Container> initContainers;

  /// NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nodeName;

  /// NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
  Map<String, String> nodeSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PodOS? os;

  /// Overhead represents the resource overhead associated with running a pod for a given RuntimeClass. This field will be autopopulated at admission time by the RuntimeClass admission controller. If the RuntimeClass admission controller is enabled, overhead must not be set in Pod create requests. The RuntimeClass admission controller will reject Pod create requests which have the overhead already set. If RuntimeClass is configured and selected in the PodSpec, Overhead will be set to the value defined in the corresponding RuntimeClass, otherwise it will remain unset and treated as zero. More info: https://git.k8s.io/enhancements/keps/sig-node/688-pod-overhead/README.md This field is beta-level as of Kubernetes v1.18, and is only honored by servers that enable the PodOverhead feature.
  Map<String, String> overhead;

  /// PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset. This field is beta-level, gated by the NonPreemptingPriority feature-gate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? preemptionPolicy;

  /// The priority value. Various system components use this field to find the priority of the pod. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? priority;

  /// If specified, indicates the pod's priority. \"system-node-critical\" and \"system-cluster-critical\" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? priorityClassName;

  /// If specified, all readiness gates will be evaluated for pod readiness. A pod is ready when all its containers are ready AND all conditions specified in the readiness gates have status equal to \"True\" More info: https://git.k8s.io/enhancements/keps/sig-network/580-pod-readiness-gates
  List<IoK8sApiCoreV1PodReadinessGate> readinessGates;

  /// Restart policy for all containers within the pod. One of Always, OnFailure, Never. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy  Possible enum values:  - `\"Always\"`  - `\"Never\"`  - `\"OnFailure\"`
  IoK8sApiCoreV1PodSpecRestartPolicyEnum? restartPolicy;

  /// RuntimeClassName refers to a RuntimeClass object in the node.k8s.io group, which should be used to run this pod.  If no RuntimeClass resource matches the named class, the pod will not be run. If unset or empty, the \"legacy\" RuntimeClass will be used, which is an implicit class with an empty definition that uses the default runtime handler. More info: https://git.k8s.io/enhancements/keps/sig-node/585-runtime-class This is a beta feature as of Kubernetes v1.14.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? runtimeClassName;

  /// If specified, the pod will be dispatched by specified scheduler. If not specified, the pod will be dispatched by default scheduler.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? schedulerName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1PodSecurityContext? securityContext;

  /// DeprecatedServiceAccount is a depreciated alias for ServiceAccountName. Deprecated: Use serviceAccountName instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccount;

  /// ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceAccountName;

  /// If true the pod's hostname will be configured as the pod's FQDN, rather than the leaf name (the default). In Linux containers, this means setting the FQDN in the hostname field of the kernel (the nodename field of struct utsname). In Windows containers, this means setting the registry value of hostname for the registry key HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters to FQDN. If a pod does not have FQDN, this has no effect. Default to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? setHostnameAsFQDN;

  /// Share a single process namespace between all of the containers in a pod. When this is set containers will be able to view and signal processes from other containers in the same pod, and the first process in each container will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be set. Optional: Default to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? shareProcessNamespace;

  /// If specified, the fully qualified Pod hostname will be \"<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>\". If not specified, the pod will not have a domainname at all.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subdomain;

  /// Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates stop immediately via the kill signal (no opportunity to shut down). If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. Defaults to 30 seconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? terminationGracePeriodSeconds;

  /// If specified, the pod's tolerations.
  List<IoK8sApiCoreV1Toleration> tolerations;

  /// TopologySpreadConstraints describes how a group of pods ought to spread across topology domains. Scheduler will schedule pods in a way which abides by the constraints. All topologySpreadConstraints are ANDed.
  List<IoK8sApiCoreV1TopologySpreadConstraint> topologySpreadConstraints;

  /// List of volumes that can be mounted by containers belonging to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes
  List<IoK8sApiCoreV1Volume> volumes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1PodSpec &&
          other.activeDeadlineSeconds == activeDeadlineSeconds &&
          other.affinity == affinity &&
          other.automountServiceAccountToken == automountServiceAccountToken &&
          other.containers == containers &&
          other.dnsConfig == dnsConfig &&
          other.dnsPolicy == dnsPolicy &&
          other.enableServiceLinks == enableServiceLinks &&
          other.ephemeralContainers == ephemeralContainers &&
          other.hostAliases == hostAliases &&
          other.hostIPC == hostIPC &&
          other.hostNetwork == hostNetwork &&
          other.hostPID == hostPID &&
          other.hostname == hostname &&
          other.imagePullSecrets == imagePullSecrets &&
          other.initContainers == initContainers &&
          other.nodeName == nodeName &&
          other.nodeSelector == nodeSelector &&
          other.os == os &&
          other.overhead == overhead &&
          other.preemptionPolicy == preemptionPolicy &&
          other.priority == priority &&
          other.priorityClassName == priorityClassName &&
          other.readinessGates == readinessGates &&
          other.restartPolicy == restartPolicy &&
          other.runtimeClassName == runtimeClassName &&
          other.schedulerName == schedulerName &&
          other.securityContext == securityContext &&
          other.serviceAccount == serviceAccount &&
          other.serviceAccountName == serviceAccountName &&
          other.setHostnameAsFQDN == setHostnameAsFQDN &&
          other.shareProcessNamespace == shareProcessNamespace &&
          other.subdomain == subdomain &&
          other.terminationGracePeriodSeconds ==
              terminationGracePeriodSeconds &&
          other.tolerations == tolerations &&
          other.topologySpreadConstraints == topologySpreadConstraints &&
          other.volumes == volumes;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (activeDeadlineSeconds == null ? 0 : activeDeadlineSeconds!.hashCode) +
      (affinity == null ? 0 : affinity!.hashCode) +
      (automountServiceAccountToken == null
          ? 0
          : automountServiceAccountToken!.hashCode) +
      (containers.hashCode) +
      (dnsConfig == null ? 0 : dnsConfig!.hashCode) +
      (dnsPolicy == null ? 0 : dnsPolicy!.hashCode) +
      (enableServiceLinks == null ? 0 : enableServiceLinks!.hashCode) +
      (ephemeralContainers.hashCode) +
      (hostAliases.hashCode) +
      (hostIPC == null ? 0 : hostIPC!.hashCode) +
      (hostNetwork == null ? 0 : hostNetwork!.hashCode) +
      (hostPID == null ? 0 : hostPID!.hashCode) +
      (hostname == null ? 0 : hostname!.hashCode) +
      (imagePullSecrets.hashCode) +
      (initContainers.hashCode) +
      (nodeName == null ? 0 : nodeName!.hashCode) +
      (nodeSelector.hashCode) +
      (os == null ? 0 : os!.hashCode) +
      (overhead.hashCode) +
      (preemptionPolicy == null ? 0 : preemptionPolicy!.hashCode) +
      (priority == null ? 0 : priority!.hashCode) +
      (priorityClassName == null ? 0 : priorityClassName!.hashCode) +
      (readinessGates.hashCode) +
      (restartPolicy == null ? 0 : restartPolicy!.hashCode) +
      (runtimeClassName == null ? 0 : runtimeClassName!.hashCode) +
      (schedulerName == null ? 0 : schedulerName!.hashCode) +
      (securityContext == null ? 0 : securityContext!.hashCode) +
      (serviceAccount == null ? 0 : serviceAccount!.hashCode) +
      (serviceAccountName == null ? 0 : serviceAccountName!.hashCode) +
      (setHostnameAsFQDN == null ? 0 : setHostnameAsFQDN!.hashCode) +
      (shareProcessNamespace == null ? 0 : shareProcessNamespace!.hashCode) +
      (subdomain == null ? 0 : subdomain!.hashCode) +
      (terminationGracePeriodSeconds == null
          ? 0
          : terminationGracePeriodSeconds!.hashCode) +
      (tolerations.hashCode) +
      (topologySpreadConstraints.hashCode) +
      (volumes.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1PodSpec[activeDeadlineSeconds=$activeDeadlineSeconds, affinity=$affinity, automountServiceAccountToken=$automountServiceAccountToken, containers=$containers, dnsConfig=$dnsConfig, dnsPolicy=$dnsPolicy, enableServiceLinks=$enableServiceLinks, ephemeralContainers=$ephemeralContainers, hostAliases=$hostAliases, hostIPC=$hostIPC, hostNetwork=$hostNetwork, hostPID=$hostPID, hostname=$hostname, imagePullSecrets=$imagePullSecrets, initContainers=$initContainers, nodeName=$nodeName, nodeSelector=$nodeSelector, os=$os, overhead=$overhead, preemptionPolicy=$preemptionPolicy, priority=$priority, priorityClassName=$priorityClassName, readinessGates=$readinessGates, restartPolicy=$restartPolicy, runtimeClassName=$runtimeClassName, schedulerName=$schedulerName, securityContext=$securityContext, serviceAccount=$serviceAccount, serviceAccountName=$serviceAccountName, setHostnameAsFQDN=$setHostnameAsFQDN, shareProcessNamespace=$shareProcessNamespace, subdomain=$subdomain, terminationGracePeriodSeconds=$terminationGracePeriodSeconds, tolerations=$tolerations, topologySpreadConstraints=$topologySpreadConstraints, volumes=$volumes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (activeDeadlineSeconds != null) {
      json[r'activeDeadlineSeconds'] = activeDeadlineSeconds;
    }
    if (affinity != null) {
      json[r'affinity'] = affinity;
    }
    if (automountServiceAccountToken != null) {
      json[r'automountServiceAccountToken'] = automountServiceAccountToken;
    }
    json[r'containers'] = containers;
    if (dnsConfig != null) {
      json[r'dnsConfig'] = dnsConfig;
    }
    if (dnsPolicy != null) {
      json[r'dnsPolicy'] = dnsPolicy;
    }
    if (enableServiceLinks != null) {
      json[r'enableServiceLinks'] = enableServiceLinks;
    }
    json[r'ephemeralContainers'] = ephemeralContainers;
    json[r'hostAliases'] = hostAliases;
    if (hostIPC != null) {
      json[r'hostIPC'] = hostIPC;
    }
    if (hostNetwork != null) {
      json[r'hostNetwork'] = hostNetwork;
    }
    if (hostPID != null) {
      json[r'hostPID'] = hostPID;
    }
    if (hostname != null) {
      json[r'hostname'] = hostname;
    }
    json[r'imagePullSecrets'] = imagePullSecrets;
    json[r'initContainers'] = initContainers;
    if (nodeName != null) {
      json[r'nodeName'] = nodeName;
    }
    json[r'nodeSelector'] = nodeSelector;
    if (os != null) {
      json[r'os'] = os;
    }
    json[r'overhead'] = overhead;
    if (preemptionPolicy != null) {
      json[r'preemptionPolicy'] = preemptionPolicy;
    }
    if (priority != null) {
      json[r'priority'] = priority;
    }
    if (priorityClassName != null) {
      json[r'priorityClassName'] = priorityClassName;
    }
    json[r'readinessGates'] = readinessGates;
    if (restartPolicy != null) {
      json[r'restartPolicy'] = restartPolicy;
    }
    if (runtimeClassName != null) {
      json[r'runtimeClassName'] = runtimeClassName;
    }
    if (schedulerName != null) {
      json[r'schedulerName'] = schedulerName;
    }
    if (securityContext != null) {
      json[r'securityContext'] = securityContext;
    }
    if (serviceAccount != null) {
      json[r'serviceAccount'] = serviceAccount;
    }
    if (serviceAccountName != null) {
      json[r'serviceAccountName'] = serviceAccountName;
    }
    if (setHostnameAsFQDN != null) {
      json[r'setHostnameAsFQDN'] = setHostnameAsFQDN;
    }
    if (shareProcessNamespace != null) {
      json[r'shareProcessNamespace'] = shareProcessNamespace;
    }
    if (subdomain != null) {
      json[r'subdomain'] = subdomain;
    }
    if (terminationGracePeriodSeconds != null) {
      json[r'terminationGracePeriodSeconds'] = terminationGracePeriodSeconds;
    }
    json[r'tolerations'] = tolerations;
    json[r'topologySpreadConstraints'] = topologySpreadConstraints;
    json[r'volumes'] = volumes;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1PodSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1PodSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1PodSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1PodSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1PodSpec(
        activeDeadlineSeconds:
            mapValueOfType<int>(json, r'activeDeadlineSeconds'),
        affinity: IoK8sApiCoreV1Affinity.fromJson(json[r'affinity']),
        automountServiceAccountToken:
            mapValueOfType<bool>(json, r'automountServiceAccountToken'),
        containers: IoK8sApiCoreV1Container.listFromJson(json[r'containers'])!,
        dnsConfig: IoK8sApiCoreV1PodDNSConfig.fromJson(json[r'dnsConfig']),
        dnsPolicy:
            IoK8sApiCoreV1PodSpecDnsPolicyEnum.fromJson(json[r'dnsPolicy']),
        enableServiceLinks: mapValueOfType<bool>(json, r'enableServiceLinks'),
        ephemeralContainers: IoK8sApiCoreV1EphemeralContainer.listFromJson(
                json[r'ephemeralContainers']) ??
            const [],
        hostAliases:
            IoK8sApiCoreV1HostAlias.listFromJson(json[r'hostAliases']) ??
                const [],
        hostIPC: mapValueOfType<bool>(json, r'hostIPC'),
        hostNetwork: mapValueOfType<bool>(json, r'hostNetwork'),
        hostPID: mapValueOfType<bool>(json, r'hostPID'),
        hostname: mapValueOfType<String>(json, r'hostname'),
        imagePullSecrets: IoK8sApiCoreV1LocalObjectReference.listFromJson(
                json[r'imagePullSecrets']) ??
            const [],
        initContainers:
            IoK8sApiCoreV1Container.listFromJson(json[r'initContainers']) ??
                const [],
        nodeName: mapValueOfType<String>(json, r'nodeName'),
        nodeSelector:
            mapCastOfType<String, String>(json, r'nodeSelector') ?? const {},
        os: IoK8sApiCoreV1PodOS.fromJson(json[r'os']),
        overhead: mapCastOfType<String, String>(json, r'overhead') ?? const {},
        preemptionPolicy: mapValueOfType<String>(json, r'preemptionPolicy'),
        priority: mapValueOfType<int>(json, r'priority'),
        priorityClassName: mapValueOfType<String>(json, r'priorityClassName'),
        readinessGates: IoK8sApiCoreV1PodReadinessGate.listFromJson(
                json[r'readinessGates']) ??
            const [],
        restartPolicy: IoK8sApiCoreV1PodSpecRestartPolicyEnum.fromJson(
            json[r'restartPolicy']),
        runtimeClassName: mapValueOfType<String>(json, r'runtimeClassName'),
        schedulerName: mapValueOfType<String>(json, r'schedulerName'),
        securityContext:
            IoK8sApiCoreV1PodSecurityContext.fromJson(json[r'securityContext']),
        serviceAccount: mapValueOfType<String>(json, r'serviceAccount'),
        serviceAccountName: mapValueOfType<String>(json, r'serviceAccountName'),
        setHostnameAsFQDN: mapValueOfType<bool>(json, r'setHostnameAsFQDN'),
        shareProcessNamespace:
            mapValueOfType<bool>(json, r'shareProcessNamespace'),
        subdomain: mapValueOfType<String>(json, r'subdomain'),
        terminationGracePeriodSeconds:
            mapValueOfType<int>(json, r'terminationGracePeriodSeconds'),
        tolerations:
            IoK8sApiCoreV1Toleration.listFromJson(json[r'tolerations']) ??
                const [],
        topologySpreadConstraints:
            IoK8sApiCoreV1TopologySpreadConstraint.listFromJson(
                    json[r'topologySpreadConstraints']) ??
                const [],
        volumes:
            IoK8sApiCoreV1Volume.listFromJson(json[r'volumes']) ?? const [],
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1PodSpec>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1PodSpec> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1PodSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1PodSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1PodSpec>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1PodSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1PodSpec.listFromJson(
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
    'containers',
  };
}

/// Set DNS policy for the pod. Defaults to \"ClusterFirst\". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'.  Possible enum values:  - `\"ClusterFirst\"` indicates that the pod should use cluster DNS first unless hostNetwork is true, if it is available, then fall back on the default (as determined by kubelet) DNS settings.  - `\"ClusterFirstWithHostNet\"` indicates that the pod should use cluster DNS first, if it is available, then fall back on the default (as determined by kubelet) DNS settings.  - `\"Default\"` indicates that the pod should use the default (as determined by kubelet) DNS settings.  - `\"None\"` indicates that the pod should use empty DNS settings. DNS parameters such as nameservers and search paths should be defined via DNSConfig.
class IoK8sApiCoreV1PodSpecDnsPolicyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PodSpecDnsPolicyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const clusterFirst =
      IoK8sApiCoreV1PodSpecDnsPolicyEnum._(r'ClusterFirst');
  static const clusterFirstWithHostNet =
      IoK8sApiCoreV1PodSpecDnsPolicyEnum._(r'ClusterFirstWithHostNet');
  static const default_ = IoK8sApiCoreV1PodSpecDnsPolicyEnum._(r'Default');
  static const none = IoK8sApiCoreV1PodSpecDnsPolicyEnum._(r'None');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PodSpecDnsPolicyEnum].
  static const values = <IoK8sApiCoreV1PodSpecDnsPolicyEnum>[
    clusterFirst,
    clusterFirstWithHostNet,
    default_,
    none,
  ];

  static IoK8sApiCoreV1PodSpecDnsPolicyEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1PodSpecDnsPolicyEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1PodSpecDnsPolicyEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodSpecDnsPolicyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodSpecDnsPolicyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PodSpecDnsPolicyEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PodSpecDnsPolicyEnum].
class IoK8sApiCoreV1PodSpecDnsPolicyEnumTypeTransformer {
  factory IoK8sApiCoreV1PodSpecDnsPolicyEnumTypeTransformer() =>
      _instance ??= const IoK8sApiCoreV1PodSpecDnsPolicyEnumTypeTransformer._();

  const IoK8sApiCoreV1PodSpecDnsPolicyEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PodSpecDnsPolicyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PodSpecDnsPolicyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PodSpecDnsPolicyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'ClusterFirst':
          return IoK8sApiCoreV1PodSpecDnsPolicyEnum.clusterFirst;
        case r'ClusterFirstWithHostNet':
          return IoK8sApiCoreV1PodSpecDnsPolicyEnum.clusterFirstWithHostNet;
        case r'Default':
          return IoK8sApiCoreV1PodSpecDnsPolicyEnum.default_;
        case r'None':
          return IoK8sApiCoreV1PodSpecDnsPolicyEnum.none;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PodSpecDnsPolicyEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PodSpecDnsPolicyEnumTypeTransformer? _instance;
}

/// Restart policy for all containers within the pod. One of Always, OnFailure, Never. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy  Possible enum values:  - `\"Always\"`  - `\"Never\"`  - `\"OnFailure\"`
class IoK8sApiCoreV1PodSpecRestartPolicyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1PodSpecRestartPolicyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const always = IoK8sApiCoreV1PodSpecRestartPolicyEnum._(r'Always');
  static const never = IoK8sApiCoreV1PodSpecRestartPolicyEnum._(r'Never');
  static const onFailure =
      IoK8sApiCoreV1PodSpecRestartPolicyEnum._(r'OnFailure');

  /// List of all possible values in this [enum][IoK8sApiCoreV1PodSpecRestartPolicyEnum].
  static const values = <IoK8sApiCoreV1PodSpecRestartPolicyEnum>[
    always,
    never,
    onFailure,
  ];

  static IoK8sApiCoreV1PodSpecRestartPolicyEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1PodSpecRestartPolicyEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1PodSpecRestartPolicyEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1PodSpecRestartPolicyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1PodSpecRestartPolicyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1PodSpecRestartPolicyEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1PodSpecRestartPolicyEnum].
class IoK8sApiCoreV1PodSpecRestartPolicyEnumTypeTransformer {
  factory IoK8sApiCoreV1PodSpecRestartPolicyEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1PodSpecRestartPolicyEnumTypeTransformer._();

  const IoK8sApiCoreV1PodSpecRestartPolicyEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1PodSpecRestartPolicyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1PodSpecRestartPolicyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1PodSpecRestartPolicyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Always':
          return IoK8sApiCoreV1PodSpecRestartPolicyEnum.always;
        case r'Never':
          return IoK8sApiCoreV1PodSpecRestartPolicyEnum.never;
        case r'OnFailure':
          return IoK8sApiCoreV1PodSpecRestartPolicyEnum.onFailure;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1PodSpecRestartPolicyEnumTypeTransformer] instance.
  static IoK8sApiCoreV1PodSpecRestartPolicyEnumTypeTransformer? _instance;
}
