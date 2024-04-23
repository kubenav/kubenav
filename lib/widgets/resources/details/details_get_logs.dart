import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

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

/// [sinceOptions] are the options for the since parameter to get the logs.
Map<String, int> sinceOptions = {
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

/// The [DetailsGetLogs] widget renders an modal bottom sheet to select the
/// parameters to get the logs. When the user selected the parameters and clicks
/// on the get logs action we make an API call to get the logs and open a
/// terminal with the retrieved logs.
class DetailsGetLogs extends StatefulWidget {
  const DetailsGetLogs({
    super.key,
    required this.names,
    required this.namespace,
    required this.item,
  });

  final String names;
  final String namespace;
  final dynamic item;

  @override
  State<DetailsGetLogs> createState() => _DetailsGetLogsState();
}

class _DetailsGetLogsState extends State<DetailsGetLogs> {
  final _logsFormKey = GlobalKey<FormState>();
  List<String> _containers = <String>[''];
  String _container = '';
  String _since = '5 Minutes';
  final _filterController = TextEditingController();
  bool _previous = false;
  bool _follow = false;
  bool _isLoading = false;

  /// [_getLogs] makes the Kubernetes API call to get the logs. If the API call
  /// returns the logs, we create a new terminal for the logs and open the
  /// terminals widget. If an error is returned during the API call we show a
  /// snackbar with the returned error message.
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
                'Could not create terminal',
                'The internal http server is unhealthy',
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
            sinceOptions[_since]!,
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
          'DetailsGetLogs _getLogs',
          'An error was returned while getting the logs',
          err,
        );
        if (mounted) {
          showSnackbar(
            context,
            'Could not get logs',
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
    if (widget.item['spec'] != null) {
      if (widget.item['spec']['initContainers'] != null) {
        for (var initContainer in widget.item['spec']['initContainers']) {
          tmpContainers.add(initContainer['name']);
        }
      }

      if (widget.item['spec']['containers'] != null) {
        for (var container in widget.item['spec']['containers']) {
          tmpContainers.add(container['name']);
        }
      }
    }

    if (tmpContainers.isNotEmpty) {
      _containers = tmpContainers;

      /// When the Pod contains a "kubectl.kubernetes.io/default-container"
      /// annotation we use this container as initial value for the [_container]
      /// state. If the annotation is not available we use the first container
      /// from the list.
      if (widget.item['metadata'].containsKey('annotations') &&
          widget.item['metadata']['annotations']
              .containsKey('kubectl.kubernetes.io/default-container') &&
          tmpContainers.contains(
            widget.item['metadata']['annotations']
                ['kubectl.kubernetes.io/default-container'],
          )) {
        _container = widget.item['metadata']['annotations']
            ['kubectl.kubernetes.io/default-container'];
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
      subtitle: widget.names,
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
                      items: [
                        '5 Minutes',
                        '15 Minutes',
                        '30 Minutes',
                        '1 Hour',
                        '3 Hours',
                        '6 Hours',
                        '12 Hours',
                        '1 Day',
                        '2 Days',
                        '7 Days',
                      ].map((value) {
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
