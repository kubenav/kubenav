import 'package:flutter/foundation.dart';
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
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';
import 'package:kubenav/widgets/shared/app_namespaces_widget.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// The [PluginFluxList] widget is used to show the user a list of the provided
/// [resource]. The [itemBuilder] function is used to generate the list items
/// for the provided [resource].
class PluginFluxList<T> extends StatefulWidget {
  const PluginFluxList({
    super.key,
    required this.resource,
    required this.itemBuilder,
  });

  final FluxResource resource;
  final Function(T item) itemBuilder;

  @override
  State<PluginFluxList> createState() => _PluginFluxListState<T>();
}

class _PluginFluxListState<T> extends State<PluginFluxList> {
  late Future<List<T>> _futureFetchResources;

  /// [_fetchResources] is used to fetch the resources for the provided
  /// [resource]. The function returns a list of [T] items, which is generated
  /// via the `resource.decodeList` function.
  Future<List<T>> _fetchResources() async {
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

    final result = await KubernetesService(
      cluster: cluster,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    return compute(
      widget.resource.decodeList as List<T> Function(String),
      result,
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
              Characters(widget.resource.plural)
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
                  AsyncSnapshot<List<T>> snapshot,
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
                                      'Failed to Load ${widget.resource.plural}',
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
                                return widget
                                    .itemBuilder(snapshot.data![index]);
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

/// The [PluginFluxListItem] widget is used to display a list item in the
/// [PluginFluxList]. For each item the name, namespace, resource, item and
/// details are provided via the `itemBuilder` function of the resources
/// `resource.detailsWidget`.
class PluginFluxListItem<T> extends StatelessWidget {
  const PluginFluxListItem({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.item,
    required this.details,
  });

  final String name;
  final String namespace;
  final FluxResource resource;
  final T item;
  final List<String> details;

  @override
  Widget build(BuildContext context) {
    return AppListItem(
      onTap: () {
        navigate(
          context,
          resource.detailsWidget(
            name,
            namespace,
          ),
        );
      },
      onDoubleTap: () {
        showActions(
          context,
          PluginFluxListItemActions(
            name: name,
            namespace: namespace,
            resource: resource,
            item: item,
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
                  Characters(name)
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
                    details.length,
                    (index) {
                      return Text(
                        Characters(
                          details[index],
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
}

/// The [PluginFluxListItemActions] widget is used to display the actions for a
/// [PluginFluxListItem]. It reuses the [fluxDetailsActions] function to
/// generate the actions for the provided [item].
class PluginFluxListItemActions<T> extends StatelessWidget {
  const PluginFluxListItemActions({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.item,
  });

  final String name;
  final String namespace;
  final FluxResource resource;
  final T item;

  @override
  Widget build(BuildContext context) {
    return AppResourceActions(
      mode: AppResourceActionsMode.actions,
      actions: fluxDetailsActions(
        context,
        name,
        namespace,
        resource,
        item,
        [],
      ),
    );
  }
}
