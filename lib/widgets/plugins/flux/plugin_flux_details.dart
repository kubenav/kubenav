import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/actions/plugin_flux_reconcile.dart';
import 'package:kubenav/widgets/plugins/flux/actions/plugin_flux_resume.dart';
import 'package:kubenav/widgets/plugins/flux/actions/plugin_flux_suspend.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/actions/show_yaml.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// [fluxDetailsActions] is a helper function to create the actions for the
/// details view and list items of a Flux resource. At the moment all supported
/// resources have the same actions, but this can be changed in the future. The
/// function returns a list of [AppResourceActionsModel] with the actions.
List<AppResourceActionsModel> fluxDetailsActions<T>(
  BuildContext context,
  String name,
  String namespace,
  FluxResource resource,
  T item,
  List<AppResourceActionsModel> additionalActions,
) {
  AppRepository appRepository = Provider.of<AppRepository>(
    context,
    listen: false,
  );

  return [
    AppResourceActionsModel(
      title: appRepository.settings.editorFormat == 'json' ? 'Json' : 'Yaml',
      icon: Icons.description,
      onTap: () {
        showModal(
          context,
          ShowYaml(
            name: name,
            namespace: namespace,
            item: item,
            encodeItem: resource.encodeItem,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Reconcile',
      icon: Icons.restart_alt,
      onTap: () {
        showModal(
          context,
          PluginFluxReconcile(
            name: name,
            namespace: namespace,
            resource: resource,
            item: item,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Suspend',
      icon: Icons.pause,
      onTap: () {
        showModal(
          context,
          PluginFluxSuspend(
            name: name,
            namespace: namespace,
            resource: resource,
            item: item,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Resume',
      icon: Icons.play_arrow,
      onTap: () {
        showModal(
          context,
          PluginFluxResume(
            name: name,
            namespace: namespace,
            resource: resource,
            item: item,
          ),
        );
      },
    ),
    ...additionalActions,
  ];
}

/// The [PluginFluxDetails] widget is used to show the user the details of the
/// provided Flux resource. The widget fetches the resource from the Kubernetes
/// API and decodes the item with the `resource.decodeItem` function. The
/// [itemBuilder] function is used to build the details view of the resource.
class PluginFluxDetails<T> extends StatefulWidget {
  const PluginFluxDetails({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.itemBuilder,
  });

  final String name;
  final String namespace;
  final FluxResource resource;
  final Function(T item) itemBuilder;

  @override
  State<PluginFluxDetails> createState() => _PluginFluxDetailsState<T>();
}

class _PluginFluxDetailsState<T> extends State<PluginFluxDetails> {
  late Future<T?> _futureFetchResource;

  Future<T?> _fetchResource() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    final cluster = await clustersRepository.getClusterWithCredentials(
      clustersRepository.activeClusterId,
    );

    final url =
        '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}';

    final result = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    return compute(widget.resource.decodeItem as T? Function(String), result);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchResource = _fetchResource();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppRepository>(
      context,
      listen: false,
    );
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              Characters(widget.name)
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              Characters(widget.namespace)
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: _futureFetchResource,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<T?> snapshot,
                ) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(
                              Constants.spacingMiddle,
                            ),
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      );
                    default:
                      if (snapshot.hasError || snapshot.data == null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  Constants.spacingMiddle,
                                ),
                                child: AppErrorWidget(
                                  message:
                                      'Failed to Load ${widget.resource.singular} ${widget.namespace}/${widget.name}',
                                  details: snapshot.error.toString(),
                                  icon: 'assets/plugins/flux.svg',
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          AppResourceActions(
                            mode: AppResourceActionsMode.header,
                            actions: fluxDetailsActions(
                              context,
                              widget.name,
                              widget.namespace,
                              widget.resource,
                              snapshot.data,
                              [
                                AppResourceActionsModel(
                                  title: 'Refresh',
                                  icon: Icons.refresh,
                                  onTap: () {
                                    setState(() {
                                      _futureFetchResource = _fetchResource();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          widget.itemBuilder(snapshot.data),
                        ],
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
