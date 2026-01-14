import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:web_socket_channel/io.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
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

/// The [GetTerminal] widget can be used to get a terminal for a provided Pod.
/// The user can select the container and the shell for the terminal. The
/// terminal will be created via a WebSocket connection to the internal http
/// server.
class GetTerminal extends StatefulWidget {
  const GetTerminal({
    super.key,
    required this.name,
    required this.namespace,
    required this.pod,
  });

  final String name;
  final String namespace;
  final IoK8sApiCoreV1Pod pod;

  @override
  State<GetTerminal> createState() => _GetTerminalState();
}

class _GetTerminalState extends State<GetTerminal> {
  final _terminalFormKey = GlobalKey<FormState>();
  List<String> _containers = <String>[''];
  String _container = '';
  String _shell = 'sh';
  bool _isLoading = false;

  /// [_getTerminal] creates a terminal for the provided Pod. The terminal will
  /// be created via a WebSocket connection to the internal http server. The
  /// user gets a snackbar message if the terminal was created successfully or
  /// failed.
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
            'ws://localhost:14122/terminal?name=${widget.name}&namespace=${widget.namespace}&container=$_container&shell=$_shell',
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
              fullScreen: true,
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
      } catch (err) {
        Logger.log(
          'GetTerminal _getTerminal',
          'Failed to Create Terminal',
          err,
        );
        if (mounted) {
          showSnackbar(context, 'Failed to Create Terminal', err.toString());
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

    if (widget.pod.spec?.containers != null) {
      for (var container in widget.pod.spec!.containers) {
        tmpContainers.add(container.name);
      }
    }

    if (widget.pod.spec?.initContainers != null) {
      for (var initContainer in widget.pod.spec!.initContainers!) {
        tmpContainers.add(initContainer.name);
      }
    }

    if (widget.pod.spec?.ephemeralContainers != null) {
      for (var ephemeralContainer in widget.pod.spec!.ephemeralContainers!) {
        tmpContainers.add(ephemeralContainer.name);
      }
    }

    if (tmpContainers.isNotEmpty) {
      _containers = tmpContainers;

      /// When the Pod contains a "kubectl.kubernetes.io/default-container"
      /// annotation we use this container as initial value for the [_container]
      /// state. If the annotation is not available we use the first container
      /// from the list.
      if (widget.pod.metadata?.annotations != null &&
          widget.pod.metadata!.annotations!.containsKey(
            'kubectl.kubernetes.io/default-container',
          ) &&
          tmpContainers.contains(
            widget
                .pod
                .metadata!
                .annotations!['kubectl.kubernetes.io/default-container'],
          )) {
        _container = widget
            .pod
            .metadata!
            .annotations!['kubectl.kubernetes.io/default-container'];
      } else {
        _container = tmpContainers[0];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Terminal',
      subtitle: '${widget.namespace}/${widget.name}',
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
                              color: Theme.of(
                                context,
                              ).extension<CustomColors>()!.textPrimary,
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
                      items: ['sh', 'bash', 'pwsh', 'cmd'].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).extension<CustomColors>()!.textPrimary,
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
