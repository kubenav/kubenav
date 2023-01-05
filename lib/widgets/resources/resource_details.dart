import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_create_job.dart';
import 'package:kubenav/widgets/resources/details/details_delete_resource.dart';
import 'package:kubenav/widgets/resources/details/details_edit_resource.dart';
import 'package:kubenav/widgets/resources/details/details_get_logs.dart';
import 'package:kubenav/widgets/resources/details/details_item_additional_printer_columns.dart';
import 'package:kubenav/widgets/resources/details/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/details/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/details/details_live_metrics_containers.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/details/details_restart_resource.dart';
import 'package:kubenav/widgets/resources/details/details_scale_resource.dart';
import 'package:kubenav/widgets/resources/details/details_show_yaml.dart';
import 'package:kubenav/widgets/resources/details/details_terminal.dart';
import 'package:kubenav/widgets/shared/app_actions_header_widget.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

/// The [ResourcesDetails] displays the details of a resource. To get the
/// resource the following arguments must be provided:
/// - [title], [resource], [path] and [scope] to determine the resource type
/// - [name] is the name of the resource
/// - For namespaced resources the [namespace] argument must be provided, for
///   cluster scoped resources the [namespace] must be `null`
class ResourcesDetails extends StatefulWidget {
  const ResourcesDetails({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.name,
    required this.namespace,
  }) : super(key: key);

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  final String name;
  final String? namespace;

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

    final resourcesDetailsUrl = widget.namespace == null
        ? '${widget.path}/${widget.resource}/${widget.name}'
        : '${widget.path}/namespaces/${widget.namespace}/${widget.resource}/${widget.name}';

    return await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(resourcesDetailsUrl);
  }

  /// [buildDetailsItem] is responsible for showing the correct details item for
  /// the selected resource. If we do not have a dedicated item for a resource
  /// (e.g. Custom Resources) we are showing the events for the resource.
  List<Widget> buildDetailsItem(
    String title,
    String resource,
    String path,
    ResourceScope scope,
    String name,
    String? namespace,
    dynamic item,
  ) {
    if (Resources.map.containsKey(resource) &&
        Resources.map[resource]!.resource == resource &&
        Resources.map[resource]!.path == path &&
        Resources.map[resource]!.buildDetailsItem != null) {
      return [Resources.map[resource]!.buildDetailsItem!(item)];
    }

    return [
      DetailsResourcesPreview(
        title: Resources.map['events']!.title,
        resource: Resources.map['events']!.resource,
        path: Resources.map['events']!.path,
        scope: Resources.map['events']!.scope,
        additionalPrinterColumns:
            Resources.map['events']!.additionalPrinterColumns,
        namespace: item['metadata']['namespace'],
        selector:
            'fieldSelector=involvedObject.name=${item['metadata']['name']}',
      ),
      const SizedBox(height: Constants.spacingMiddle),
      AppPrometheusChartsWidget(
        manifest: item,
        defaultCharts: const [],
      ),
    ];
  }

  /// [buildAdditionalActions] returns an additianal list of
  /// [AppActionsHeaderModel]. The list if created based on the [resource] and
  /// [path] (e.g. for CronJobs we add an additional action to create a new Job
  /// from the CronJob specs.)
  List<AppActionsHeaderModel> buildAdditionalActions(
    BuildContext context,
    String resource,
    String path,
    String name,
    String? namespace,
    dynamic item,
  ) {
    final List<AppActionsHeaderModel> additionalActions = [];

    if ((Resources.map['deployments']!.resource == resource &&
            Resources.map['deployments']!.path == path) ||
        (Resources.map['statefulsets']!.resource == resource &&
            Resources.map['statefulsets']!.path == path)) {
      additionalActions.add(
        AppActionsHeaderModel(
          title: 'Scale',
          icon: Icons.difference,
          onTap: () {
            showModal(
              context,
              DetailsScaleResource(
                resource: resource,
                path: path,
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if ((Resources.map['deployments']!.resource == resource &&
            Resources.map['deployments']!.path == path) ||
        (Resources.map['statefulsets']!.resource == resource &&
            Resources.map['statefulsets']!.path == path) ||
        (Resources.map['daemonsets']!.resource == resource &&
            Resources.map['daemonsets']!.path == path)) {
      additionalActions.add(
        AppActionsHeaderModel(
          title: 'Restart',
          icon: Icons.restart_alt,
          onTap: () {
            showModal(
              context,
              DetailsRestartResource(
                resource: resource,
                path: path,
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['cronjobs']!.resource == resource &&
        Resources.map['cronjobs']!.path == path) {
      additionalActions.add(
        AppActionsHeaderModel(
          title: 'Create Job',
          icon: Icons.play_arrow,
          onTap: () {
            showModal(
              context,
              DetailsCreateJob(
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['pods']!.resource == resource &&
        Resources.map['pods']!.path == path) {
      additionalActions.add(
        AppActionsHeaderModel(
          title: 'Logs',
          icon: Icons.subject,
          onTap: () {
            showModal(
              context,
              DetailsGetLogs(
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['pods']!.resource == resource &&
        Resources.map['pods']!.path == path) {
      additionalActions.add(
        AppActionsHeaderModel(
          title: 'Terminal',
          icon: Icons.terminal,
          onTap: () {
            showModal(
              context,
              DetailsTerminal(
                name: name,
                namespace: namespace ?? '',
                item: item,
              ),
            );
          },
        ),
      );
    }

    if (Resources.map['pods']!.resource == resource &&
        Resources.map['pods']!.path == path) {
      additionalActions.add(
        AppActionsHeaderModel(
          title: 'Live Metrics',
          icon: Icons.insights,
          onTap: () {
            showActions(
              context,
              DetailsLiveMetricsContainers(
                name: name,
                namespace: namespace ?? '',
                pod: IoK8sApiCoreV1Pod.fromJson(item)!,
              ),
            );
          },
        ),
      );
    }

    return additionalActions;
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
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
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
      body: SingleChildScrollView(
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(Constants.spacingMiddle),
                          child: CircularProgressIndicator(
                              color: Constants.colorPrimary),
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
                              padding:
                                  const EdgeInsets.all(Constants.spacingMiddle),
                              child: AppErrorWidget(
                                message: 'Could not load ${widget.title}',
                                details: snapshot.error.toString(),
                                icon: Resources.map.containsKey(widget.resource)
                                    ? 'assets/resources/image108x108/${widget.resource}.png'
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    BookmarksRepository bookmarksRepository =
                        Provider.of<BookmarksRepository>(
                      context,
                      listen: true,
                    );

                    return Column(
                      children: [
                        AppActionsHeaderWidget(
                          actions: [
                            AppActionsHeaderModel(
                              title:
                                  appRepository.settings.editorFormat == 'json'
                                      ? 'Json'
                                      : 'Yaml',
                              icon: Icons.description,
                              onTap: () {
                                showModal(
                                  context,
                                  DetailsShowYaml(
                                    item: snapshot.data,
                                  ),
                                );
                              },
                            ),
                            AppActionsHeaderModel(
                              title: 'Edit',
                              icon: Icons.edit,
                              onTap: () {
                                showModal(
                                  context,
                                  DetailsEditResource(
                                    resource: widget.resource,
                                    path: widget.path,
                                    name: widget.name,
                                    namespace: widget.namespace,
                                    item: snapshot.data,
                                  ),
                                );
                              },
                            ),
                            AppActionsHeaderModel(
                              title: 'Delete',
                              icon: Icons.delete,
                              onTap: () {
                                showModal(
                                  context,
                                  DetailsDeleteResource(
                                    resource: widget.resource,
                                    path: widget.path,
                                    name: widget.name,
                                    namespace: widget.namespace,
                                  ),
                                );
                              },
                            ),
                            AppActionsHeaderModel(
                              title: 'Refresh',
                              icon: Icons.refresh,
                              onTap: () {
                                setState(() {
                                  _futureFetchItem = _fetchItem();
                                });
                              },
                            ),
                            AppActionsHeaderModel(
                              title: 'Bookmark',
                              icon: bookmarksRepository.isBookmarked(
                                        BookmarkType.details,
                                        clustersRepository.activeClusterId,
                                        widget.title,
                                        widget.resource,
                                        widget.path,
                                        widget.scope,
                                        widget.name,
                                        widget.namespace,
                                      ) >
                                      -1
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              onTap: () {
                                final bookmarkIndex =
                                    bookmarksRepository.isBookmarked(
                                  BookmarkType.details,
                                  clustersRepository.activeClusterId,
                                  widget.title,
                                  widget.resource,
                                  widget.path,
                                  widget.scope,
                                  widget.name,
                                  widget.namespace,
                                );
                                if (bookmarkIndex > -1) {
                                  bookmarksRepository
                                      .removeBookmark(bookmarkIndex);
                                } else {
                                  bookmarksRepository.addBookmark(
                                    BookmarkType.details,
                                    clustersRepository.activeClusterId,
                                    widget.title,
                                    widget.resource,
                                    widget.path,
                                    widget.scope,
                                    widget.additionalPrinterColumns,
                                    widget.name,
                                    widget.namespace,
                                  );
                                }
                              },
                            ),
                            ...buildAdditionalActions(
                              context,
                              widget.resource,
                              widget.path,
                              widget.name,
                              widget.namespace,
                              snapshot.data,
                            ),
                          ],
                        ),
                        DetailsItemMetadata(
                          item: snapshot.data,
                        ),
                        DetailsItemAdditionalPrinterColumns(
                          additionalPrinterColumns:
                              widget.additionalPrinterColumns,
                          item: snapshot.data,
                        ),
                        DetailsItemConditions(
                          item: snapshot.data,
                        ),
                        const SizedBox(height: Constants.spacingMiddle),
                        ...buildDetailsItem(
                          widget.title,
                          widget.resource,
                          widget.path,
                          widget.scope,
                          widget.name,
                          widget.namespace,
                          snapshot.data,
                        ),
                        const SizedBox(height: Constants.spacingExtraLarge),
                      ],
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
