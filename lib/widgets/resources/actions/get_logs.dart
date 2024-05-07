import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/terminal_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_terminals_widget.dart';

/// [_sinceOptions] are the options for the since parameter to get the logs.
Map<String, int> _sinceOptions = {
  '5 Minutes': 300,
  '15 Minutes': 900,
  '30 Minutes': 1800,
  '1 Hour': 3600,
  '3 Hours': 10800,
  '6 Hours': 21600,
  '12 Hours': 43200,
  '1 Day': 86400,
  '2 Days': 172800,
  '7 Days': 604800,
};

/// The [GetLogs] widget can be used to show the logs of one or more Pods, with
/// the provided [names] and [namespace]. The user can select the container, the
/// since parameter, a filter, if the previous logs should be shown and if the
/// logs should be streamed.
class GetLogs extends StatefulWidget {
  const GetLogs({
    super.key,
    required this.names,
    required this.namespace,
    required this.pod,
  });

  final String names;
  final String namespace;
  final IoK8sApiCoreV1Pod pod;

  @override
  State<GetLogs> createState() => _GetLogsState();
}

class _GetLogsState extends State<GetLogs> {
  final _logsFormKey = GlobalKey<FormState>();
  List<String> _containers = <String>[''];
  String _container = '';
  String _since = _sinceOptions.keys.first;
  final _filterController = TextEditingController();
  bool _previous = false;
  bool _follow = false;
  bool _isLoading = false;

  /// [_getLogs] gets the logs of the selected container. If the [_follow]
  /// parameter is set to true we will start a http server to stream the logs
  /// over a websocket connection. If the [_follow] parameter is set to false
  /// we will get the logs via the [getLogs] method of the [KubernetesService].
  Future<void> _getLogs() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: false,
    );

    if (_logsFormKey.currentState != null &&
        _logsFormKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        final cluster = await clustersRepository.getClusterWithCredentials(
          clustersRepository.activeClusterId,
        );

        /// If the user selected the [_follow] option we have to start a http
        /// server to stream the logs over a websocket connection.
        if (_follow) {
          final isStarted = await KubernetesService(
            cluster: cluster!,
            proxy: appRepository.settings.proxy,
            timeout: appRepository.settings.timeout,
          ).startServer();

          if (isStarted) {
            final channel = IOWebSocketChannel.connect(
              'ws://localhost:14122/logs?name=${widget.names}&namespace=${widget.namespace}&container=$_container&since=$_since',
              headers: <String, dynamic>{
                'X-CLUSTER-SERVER': cluster.clusterServer,
                'X-CLUSTER-CERTIFICATE-AUTHORITY-DATA':
                    cluster.clusterCertificateAuthorityData,
                'X-CLUSTER-INSECURE-SKIP-TLS-VERIFY':
                    '${cluster.clusterInsecureSkipTLSVerify}',
                'X-USER-CLIENT-CERTIFICATE-DATA':
                    cluster.userClientCertificateData,
                'X-USER-CLIENT-KEY-DATA': cluster.userClientKeyData,
                'X-USER-TOKEN': cluster.userToken,
                'X-USER-USERNAME': cluster.userUsername,
                'X-USER-PASSWORD': cluster.userPassword,
                'X-PROXY': appRepository.settings.proxy,
                'X-TIMEOUT': appRepository.settings.timeout,
              },
            );

            final terminalIndex = terminalRepository.addTerminal(
              TerminalType.logstream,
              _container,
              null,
              LogStreamBackend(channel),
              null,
            );

            setState(() {
              _isLoading = false;
            });
            if (mounted) {
              Navigator.pop(context);
              showModal(
                context,
                AppTerminalWidget(
                  terminalIndex: terminalIndex,
                ),
              );
            }
          } else {
            setState(() {
              showSnackbar(
                context,
                'Failed to Create Terminal',
                'The Internal HTTP Server is Unhealthy',
              );
              _isLoading = false;
            });
          }
        } else {
          /// If the user didn't select the [_follow] option we can get the logs
          /// via the [getLogs] method of the [KubernetesService] which uses
          /// platform channels to make the Kubernetes request. This has the
          /// advantage that we do not have to start a http server first.
          final logs = await KubernetesService(
            cluster: cluster!,
            proxy: appRepository.settings.proxy,
            timeout: appRepository.settings.timeout,
          ).getLogs(
            widget.names,
            widget.namespace,
            _container,
            _sinceOptions[_since]!,
            _filterController.text,
            _previous,
          );

          final terminalIndex = terminalRepository.addTerminal(
            TerminalType.log,
            _container,
            logs,
            null,
            null,
          );

          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            Navigator.pop(context);
            showModal(
              context,
              AppTerminalWidget(terminalIndex: terminalIndex),
            );
          }
        }
      } catch (err) {
        Logger.log(
          'GetLogs _getLogs',
          'Failed to Get Logs',
          err,
        );
        if (mounted) {
          showSnackbar(
            context,
            'Failed to Get Logs',
            err.toString(),
          );
        }
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    /// When the widget is initialized we have to create the list of containers
    /// from the provided manifest. When we are able to get the containers we
    /// set the [_containers] state and use the first container as initial value
    /// for the [_container] state.
    List<String> tmpContainers = [];

    if (widget.pod.spec?.initContainers != null) {
      for (var initContainer in widget.pod.spec!.initContainers) {
        tmpContainers.add(initContainer.name);
      }
    }

    if (widget.pod.spec?.containers != null) {
      for (var container in widget.pod.spec!.containers) {
        tmpContainers.add(container.name);
      }
    }

    if (tmpContainers.isNotEmpty) {
      _containers = tmpContainers;

      /// When the Pod contains a "kubectl.kubernetes.io/default-container"
      /// annotation we use this container as initial value for the [_container]
      /// state. If the annotation is not available we use the first container
      /// from the list.
      if (widget.pod.metadata?.annotations != null &&
          widget.pod.metadata!.annotations
              .containsKey('kubectl.kubernetes.io/default-container') &&
          tmpContainers.contains(
            widget.pod.metadata!
                .annotations['kubectl.kubernetes.io/default-container'],
          )) {
        _container = widget.pod.metadata!
            .annotations['kubectl.kubernetes.io/default-container']!;
      } else {
        _container = tmpContainers[0];
      }
    }
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Logs',
      subtitle: '${widget.namespace}/${widget.names}',
      icon: Icons.subject,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Get Logs',
      actionPressed: () {
        _getLogs();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _logsFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: Constants.spacingMiddle,
              bottom: Constants.spacingMiddle,
              left: Constants.spacingMiddle,
              right: Constants.spacingMiddle,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Container'),
                    DropdownButton(
                      value: _container,
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _container = value ?? '';
                        });
                      },
                      items: _containers.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .textPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Since'),
                    DropdownButton(
                      value: _since,
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _since = value ?? '';
                        });
                      },
                      items: _sinceOptions.keys.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .extension<CustomColors>()!
                                  .textPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _filterController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Filter',
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Previous'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: (value) {
                        setState(() {
                          _previous = !_previous;
                        });
                      },
                      value: _previous,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Follow'),
                    Switch(
                      activeColor: Theme.of(context).colorScheme.primary,
                      onChanged: widget.names.split(',').length > 1
                          ? null
                          : (value) {
                              setState(() {
                                _follow = !_follow;
                              });
                            },
                      value: _follow,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
