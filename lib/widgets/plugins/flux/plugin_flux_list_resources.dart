import 'package:flutter/material.dart';

import 'package:provider/provider.dart' as provider;

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_list_item_actions.dart';
import 'package:kubenav/widgets/plugins/flux/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';
import 'package:kubenav/widgets/shared/app_namespaces_widget.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

class PluginFluxListResources extends StatefulWidget {
  const PluginFluxListResources({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  State<PluginFluxListResources> createState() =>
      _PluginFluxListResourcesState();
}

class _PluginFluxListResourcesState extends State<PluginFluxListResources> {
  late Future<List<dynamic>> _futureFetchResources;

  /// [_fetchResources] fetches all the resources for the currently active
  /// cluster and namespace or all namespaces.
  Future<List<dynamic>> _fetchResources() async {
    ClustersRepository clustersRepository =
        provider.Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = provider.Provider.of<AppRepository>(
      context,
      listen: false,
    );

    final cluster = await clustersRepository.getClusterWithCredentials(
      clustersRepository.activeClusterId,
    );

    final url =
        '${widget.resource.path}${cluster!.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/${widget.resource.resource}';

    final data = await KubernetesService(
      cluster: cluster,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    return data['items'];
  }

  /// [_buildItem] builds the widget for a single resource shown in the list of
  /// resources. When the user clicks on the resource he will be redirected to
  /// the [PluginFluxDetails] screen.
  Widget _buildItem(dynamic manifest) {
    final listItem = widget.resource.buildListItem(manifest);

    return AppListItem(
      onTap: () {
        navigate(
          context,
          PluginFluxDetails(
            resource: widget.resource,
            name: listItem.name,
            namespace: listItem.namespace,
          ),
        );
      },
      onDoubleTap: () {
        showActions(
          context,
          PluginFluxListItemActions(
            resource: widget.resource,
            manifest: manifest,
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Characters(listItem.title)
                      .replaceAll(Characters(''), Characters('\u{200B}'))
                      .toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle(
                    context,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    listItem.data.length,
                    (index) {
                      return Text(
                        Characters(
                          '${listItem.data[index].key}: ${listItem.data[index].value}',
                        )
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchResources = _fetchResources();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider.Provider.of<AppRepository>(
      context,
      listen: true,
    );
    ClustersRepository clustersRepository =
        provider.Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.namespaces),
            onPressed: () {
              showModal(context, const AppNamespacesWidget());
            },
          ),
        ],
        title: Column(
          children: [
            Text(
              Characters(widget.resource.titlePlural)
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
              Characters(
                clustersRepository
                            .getCluster(
                              clustersRepository.activeClusterId,
                            )!
                            .namespace ==
                        ''
                    ? 'All Namespaces'
                    : clustersRepository
                        .getCluster(
                          clustersRepository.activeClusterId,
                        )!
                        .namespace,
              ).replaceAll(Characters(''), Characters('\u{200B}')).toString(),
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
                future: _futureFetchResources,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot,
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
                      if (snapshot.hasError) {
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
                                      'Could not load ${widget.resource.titlePlural}',
                                  details: snapshot.error.toString(),
                                  icon: 'assets/plugins/flux.svg',
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Wrap(
                        children: [
                          AppResourceActions(
                            mode: AppResourceActionsMode.header,
                            actions: [
                              AppResourceActionsModel(
                                title: 'Refresh',
                                icon: Icons.refresh,
                                onTap: () {
                                  setState(() {
                                    _futureFetchResources = _fetchResources();
                                  });
                                },
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: Constants.spacingMiddle,
                              bottom: Constants.spacingMiddle,
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(
                                right: Constants.spacingMiddle,
                                left: Constants.spacingMiddle,
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: Constants.spacingMiddle,
                              ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return _buildItem(snapshot.data![index]);
                              },
                            ),
                          ),
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
