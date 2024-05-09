import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/actions/create_debug_container.dart';
import 'package:kubenav/widgets/resources/actions/create_job.dart';
import 'package:kubenav/widgets/resources/actions/delete_resource.dart';
import 'package:kubenav/widgets/resources/actions/edit_resource.dart';
import 'package:kubenav/widgets/resources/actions/get_logs.dart';
import 'package:kubenav/widgets/resources/actions/get_logs_pods.dart';
import 'package:kubenav/widgets/resources/actions/get_terminal.dart';
import 'package:kubenav/widgets/resources/actions/live_metrics.dart';
import 'package:kubenav/widgets/resources/actions/restart_resource.dart';
import 'package:kubenav/widgets/resources/actions/scale_resource.dart';
import 'package:kubenav/widgets/resources/actions/show_yaml.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_cronjobs.dart';
import 'package:kubenav/widgets/resources/resources/resources_daemonsets.dart';
import 'package:kubenav/widgets/resources/resources/resources_deployments.dart';
import 'package:kubenav/widgets/resources/resources/resources_namespaces.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources/resources_statefulsets.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// [resourceDetailsActions] defines all the actions for the resources in the
/// details view. If the [refresh] function is defined we add an additional
/// refresh button, which should not be available when the actions are rendered
/// as actions sheet in the list view.
List<AppResourceActionsModel> resourceDetailsActions(
  BuildContext context,
  String name,
  String? namespace,
  Resource resource,
  dynamic item,
  void Function()? refresh,
) {
  AppRepository appRepository = Provider.of<AppRepository>(
    context,
    listen: false,
  );
  ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
    context,
    listen: false,
  );
  BookmarksRepository bookmarksRepository = Provider.of<BookmarksRepository>(
    context,
    listen: false,
  );

  final actions = [
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
      title: 'Edit',
      icon: Icons.edit,
      onTap: () {
        showModal(
          context,
          EditResource(
            name: name,
            namespace: namespace,
            item: item,
            resource: resource,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Delete',
      icon: Icons.delete,
      onTap: () {
        showModal(
          context,
          DeleteResource(
            name: name,
            namespace: namespace,
            resource: resource,
          ),
        );
      },
    ),
  ];

  if (refresh != null) {
    actions.add(
      AppResourceActionsModel(
        title: 'Refresh',
        icon: Icons.refresh,
        onTap: refresh,
      ),
    );
  }

  actions.add(
    AppResourceActionsModel(
      title: bookmarksRepository.isBookmarked(
                BookmarkType.details,
                clustersRepository.activeClusterId,
                name,
                namespace,
                resource,
              ) >
              -1
          ? 'Remove Bookmark'
          : 'Add Bookmark',
      icon: bookmarksRepository.isBookmarked(
                BookmarkType.details,
                clustersRepository.activeClusterId,
                name,
                namespace,
                resource,
              ) >
              -1
          ? Icons.bookmark
          : Icons.bookmark_border,
      onTap: () {
        final bookmarkIndex = bookmarksRepository.isBookmarked(
          BookmarkType.details,
          clustersRepository.activeClusterId,
          name,
          namespace,
          resource,
        );
        if (bookmarkIndex > -1) {
          bookmarksRepository.removeBookmark(bookmarkIndex);
        } else {
          bookmarksRepository.addBookmark(
            BookmarkType.details,
            clustersRepository.activeClusterId,
            name,
            namespace,
            resource,
          );
        }
      },
    ),
  );

  if ((resource.resource == resourceDeployment.resource &&
          resource.path == resourceDeployment.path) ||
      (resource.resource == resourceStatefulSet.resource &&
          resource.path == resourceStatefulSet.path)) {
    actions.add(
      AppResourceActionsModel(
        title: 'Scale',
        icon: Icons.difference,
        onTap: () {
          showModal(
            context,
            ScaleResource(
              name: name,
              namespace: namespace ?? 'default',
              item: item,
              resource: resource,
            ),
          );
        },
      ),
    );
  }

  if ((resource.resource == resourceDeployment.resource &&
          resource.path == resourceDeployment.path) ||
      (resource.resource == resourceStatefulSet.resource &&
          resource.path == resourceStatefulSet.path) ||
      (resource.resource == resourceDaemonSet.resource &&
          resource.path == resourceDaemonSet.path)) {
    actions.add(
      AppResourceActionsModel(
        title: 'Restart',
        icon: Icons.restart_alt,
        onTap: () {
          showModal(
            context,
            RestartResource(
              name: name,
              namespace: namespace ?? 'default',
              item: item,
              resource: resource,
            ),
          );
        },
      ),
    );
  }

  if (resource.resource == resourceCronJob.resource &&
      resource.path == resourceCronJob.path) {
    actions.add(
      AppResourceActionsModel(
        title: 'Create Job',
        icon: Icons.play_arrow,
        onTap: () {
          showModal(
            context,
            CreateJob(
              name: name,
              namespace: namespace ?? 'default',
              cronJob: item,
            ),
          );
        },
      ),
    );
  }

  if (resource.resource == resourcePod.resource &&
      resource.path == resourcePod.path) {
    actions.add(
      AppResourceActionsModel(
        title: 'Logs',
        icon: Icons.subject,
        onTap: () {
          showModal(
            context,
            GetLogs(
              names: name,
              namespace: namespace ?? 'default',
              pod: item,
            ),
          );
        },
      ),
    );
  }

  if ((resource.resource == resourceDeployment.resource &&
          resource.path == resourceDeployment.path) ||
      (resource.resource == resourceStatefulSet.resource &&
          resource.path == resourceStatefulSet.path) ||
      (resource.resource == resourceDaemonSet.resource &&
          resource.path == resourceDaemonSet.path)) {
    actions.add(
      AppResourceActionsModel(
        title: 'Logs',
        icon: Icons.subject,
        onTap: () {
          showModal(
            context,
            GetLogsPods(
              name: name,
              namespace: namespace ?? 'default',
              item: item,
            ),
          );
        },
      ),
    );
  }

  if (resource.resource == resourcePod.resource &&
      resource.path == resourcePod.path) {
    actions.add(
      AppResourceActionsModel(
        title: 'Terminal',
        icon: Icons.terminal,
        onTap: () {
          showModal(
            context,
            GetTerminal(
              name: name,
              namespace: namespace ?? 'default',
              pod: item,
            ),
          );
        },
      ),
    );
  }

  if (resource.resource == resourcePod.resource &&
      resource.path == resourcePod.path) {
    actions.add(
      AppResourceActionsModel(
        title: 'Debug',
        icon: Icons.bug_report,
        onTap: () {
          showModal(
            context,
            CreateDebugContainer(
              name: name,
              namespace: namespace ?? 'default',
              pod: item,
            ),
          );
        },
      ),
    );
  }

  if (resource.resource == resourcePod.resource &&
      resource.path == resourcePod.path) {
    actions.add(
      AppResourceActionsModel(
        title: 'Live Metrics',
        icon: Icons.insights,
        onTap: () {
          showActions(
            context,
            LiveMetricsContainers(
              name: name,
              namespace: namespace ?? 'default',
              pod: item,
            ),
          );
        },
      ),
    );
  }

  if (resource.resource == resourceNamespace.resource &&
      resource.path == resourceNamespace.path) {
    actions.add(
      AppResourceActionsModel(
        title: 'Favorite',
        icon: appRepository.settings.namespaces
                .where((e) => e == name)
                .toList()
                .isEmpty
            ? Icons.star_outline
            : Icons.star,
        onTap: () {
          if (appRepository.settings.namespaces
              .where((e) => e == name)
              .toList()
              .isEmpty) {
            appRepository.addNamespace(name);
          } else {
            appRepository.deleteNamespace(name);
          }
        },
      ),
    );
  }

  actions.addAll(
    fluxResourceActions(
      context,
      name,
      namespace,
      resource,
      item,
    ),
  );

  return actions;
}

class ResourcesDetails extends StatefulWidget {
  const ResourcesDetails({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
  });

  final String name;
  final String? namespace;
  final Resource resource;

  @override
  State<ResourcesDetails> createState() => _ResourcesDetailsState();
}

class _ResourcesDetailsState extends State<ResourcesDetails> {
  late Future<dynamic> _futureFetchItem;

  Future<dynamic> _fetchItem() async {
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

    final url = widget.namespace == null
        ? '${widget.resource.path}/${widget.resource.resource}/${widget.name}'
        : '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}';

    final result = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    return compute(widget.resource.decodeItem, result);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchItem = _fetchItem();
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Characters(widget.namespace ?? 'No Namespace')
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
                future: _futureFetchItem,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<dynamic> snapshot,
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
                                      'Failed to Load ${widget.resource.singular}',
                                  details: snapshot.error.toString(),
                                  icon:
                                      'assets/resources/${widget.resource.icon}.svg',
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          ResourcesDetailsActions(
                            name: widget.name,
                            namespace: widget.namespace,
                            resource: widget.resource,
                            item: snapshot.data,
                            refresh: () {
                              setState(() {
                                _futureFetchItem = _fetchItem();
                              });
                            },
                          ),
                          widget.resource.detailsItemBuilder(
                            context,
                            widget.resource,
                            snapshot.data,
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

/// The [ResourcesDetailsActions] widget is used to render the actions for the
/// resources in the details view. The [ResourcesDetailsActions] widget is used
/// in the [ResourcesDetails] widget.
class ResourcesDetailsActions extends StatelessWidget {
  const ResourcesDetailsActions({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.item,
    required this.refresh,
  });

  final String name;
  final String? namespace;
  final Resource resource;
  final dynamic item;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    Provider.of<AppRepository>(
      context,
      listen: true,
    );
    Provider.of<BookmarksRepository>(
      context,
      listen: true,
    );

    return AppResourceActions(
      mode: AppResourceActionsMode.header,
      actions: resourceDetailsActions(
        context,
        name,
        namespace,
        resource,
        item,
        refresh,
      ),
    );
  }
}
