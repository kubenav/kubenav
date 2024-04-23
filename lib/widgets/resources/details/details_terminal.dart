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

class DetailsTerminal extends StatefulWidget {
  const DetailsTerminal({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
  });

  final String name;
  final String namespace;
  final dynamic item;

  @override
  State<DetailsTerminal> createState() => _DetailsTerminalState();
}

class _DetailsTerminalState extends State<DetailsTerminal> {
  final _terminalFormKey = GlobalKey<FormState>();
  List<String> _containers = <String>[''];
  String _container = '';
  String _shell = 'sh';
  bool _isLoading = false;

  Future<void> _getTerminal() async {
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

    if (_terminalFormKey.currentState != null &&
        _terminalFormKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        final cluster = await clustersRepository.getClusterWithCredentials(
          clustersRepository.activeClusterId,
        );

        final isStarted = await KubernetesService(
          cluster: cluster!,
          proxy: appRepository.settings.proxy,
          timeout: appRepository.settings.timeout,
        ).startServer();

        if (isStarted) {
          final channel = IOWebSocketChannel.connect(
            'ws://localhost:14122/terminal?name=${widget.item['metadata']['name']}&namespace=${widget.item['metadata']['namespace']}&container=$_container&shell=$_shell',
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
            TerminalType.exec,
            _container,
            null,
            null,
            TerminalBackend(channel),
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
      } catch (err) {
        Logger.log(
          'DetailsTerminal _getTerminal',
          'An error was returned while creating the terminal',
          err,
        );
        if (mounted) {
          showSnackbar(
            context,
            'Could not get create terminal',
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

      if (widget.item['spec']['ephemeralContainers'] != null) {
        for (var ephemeralContainer in widget.item['spec']
            ['ephemeralContainers']) {
          tmpContainers.add(ephemeralContainer['name']);
        }
      }
    }

    if (tmpContainers.isNotEmpty) {
      _containers = tmpContainers;
      _container = tmpContainers[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Terminal',
      subtitle: widget.name,
      icon: Icons.terminal,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Get Terminal',
      actionPressed: () {
        _getTerminal();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _terminalFormKey,
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
                    const Text('Shell'),
                    DropdownButton(
                      value: _shell,
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _shell = value ?? 'sh';
                        });
                      },
                      items: [
                        'sh',
                        'bash',
                        'pwsh',
                        'cmd',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
