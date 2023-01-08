import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/list/default_list_item.dart';
import 'package:kubenav/widgets/resources/list/list_create_resource.dart';
import 'package:kubenav/widgets/shared/app_actions_header_widget.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_namespaces_widget.dart';

/// The [ResourcesListResult] model is the returns value for the [_fetchItems]
/// future. It contains the loaded items and metrics for Pods and Nodes.
class ResourcesListResult {
  List<dynamic> items = <dynamic>[];
  dynamic metrics;

  ResourcesListResult({
    required this.items,
    required this.metrics,
  });
}

/// The [ResourcesList] renders a list of resources. The resources which should
/// beloaded are defined via the following arguments:
/// - [title], [resource], [path] and [scope] allows us to uniquly identify the
///   Kubernetes resource which should be loaded.
/// - [namespace] and [selector] can be used to overwrite the currently selected
///   namespace of the active cluster and to spefiy the a label selector or
///   field selector to filter the resources (e.g. display all pods for a
///   deployment).
class ResourcesList extends StatefulWidget {
  const ResourcesList({
    super.key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.namespace,
    required this.selector,
  });

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  final String? namespace;
  final String? selector;

  @override
  State<ResourcesList> createState() => _ResourcesListState();
}

class _ResourcesListState extends State<ResourcesList> {
  late Future<ResourcesListResult> _futureFetchItems;
  String _filter = '';

  /// [_fetchItems] loads the items for the requested resource and the metrics
  /// when the requested resource is a Pod or Node. When we are able to load the
  /// items and metrics we return a [ResourcesListResult].
  Future<ResourcesListResult> _fetchItems() async {
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

    final resourcesListUrl = widget.scope == ResourceScope.cluster
        ? '${widget.path}/${widget.resource}?${widget.selector} ?? ' '}'
        : widget.namespace != null
            ? '${widget.path}/namespaces/${widget.namespace}/${widget.resource}?${widget.selector ?? ''}'
            : '${widget.path}${cluster!.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/${widget.resource}?${widget.selector ?? ''}';

    final resourcesList = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(resourcesListUrl);

    Logger.log(
      'ResourcesListRepository _init',
      '${resourcesList['items'].length} items were returned',
      'Request URL: $resourcesListUrl\nManifest: $resourcesList',
    );

    try {
      if ((widget.resource == Resources.map['pods']!.resource &&
              widget.path == Resources.map['pods']!.path) ||
          (widget.resource == Resources.map['nodes']!.resource &&
              widget.path == Resources.map['nodes']!.path)) {
        final metricsUrl = widget.scope == ResourceScope.cluster
            ? '/apis/metrics.k8s.io/v1beta1/${widget.resource}?${widget.selector ?? ''}'
            : widget.namespace != null
                ? '/apis/metrics.k8s.io/v1beta1/namespaces/${widget.namespace}/${widget.resource}?${widget.selector ?? ''}'
                : '/apis/metrics.k8s.io/v1beta1${cluster.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/${widget.resource}?${widget.selector ?? ''}';

        final metrics = await KubernetesService(
          cluster: cluster,
          proxy: appRepository.settings.proxy,
          timeout: appRepository.settings.timeout,
        ).getRequest(metricsUrl);

        return ResourcesListResult(
          items: resourcesList['items'],
          metrics: metrics,
        );
      }
    } catch (err) {
      Logger.log(
        'ResourcesListRepository _init',
        'Metrics were not loaded',
        err,
      );
    }

    return ResourcesListResult(
      items: resourcesList['items'],
      metrics: null,
    );
  }

  /// [_getFilteredItems] filters the given list of [items] by the setted
  /// [_filter]. When the [_filter] is not empty the name of an item must
  /// contain the filter keyword.
  List<dynamic> _getFilteredItems(List<dynamic> items) {
    return _filter == ''
        ? items
        : items
            .where((item) =>
                item['metadata'] != null &&
                item['metadata']['name'] != null &&
                item['metadata']['name'] is String &&
                item['metadata']['name'].contains(_filter.toLowerCase()))
            .toList();
  }

  /// [buildListItem] is used to build the widget for a single resource item.
  /// When we know the resource, because it is present in the [Resources.map] we
  /// apply the `buildListItem` function for this resource. If we do not know
  /// the resource (e.g. a CRD or a standard resource which is not defined in
  /// the [Resources.map]) we use the [DefaultListItem] widget to display the
  /// item in the resources list.
  Widget buildListItem(
    String title,
    String resource,
    String path,
    ResourceScope scope,
    List<AdditionalPrinterColumns> additionalPrinterColumns,
    dynamic item,
    dynamic metrics,
  ) {
    if (Resources.map.containsKey(resource) &&
        Resources.map[resource]!.resource == resource &&
        Resources.map[resource]!.path == path &&
        Resources.map[resource]!.buildListItem != null) {
      return Resources.map[resource]!.buildListItem!(
        title,
        resource,
        path,
        scope,
        additionalPrinterColumns,
        item,
        metrics,
      );
    }

    return DefaultListItem(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      item: item,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchItems = _fetchItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        /// When the resource we should diplay has the namespaced scope and when
        /// the user doesn't provided a selector we shown an button where the
        /// user can change the active namespace of the cluster. If the resource
        /// is cluster scoped or when the user specified a selector (e.g. to
        /// view all Pods of a Deployment) we do not show the button.
        actions:
            widget.scope == ResourceScope.namespaced && widget.selector == null
                ? [
                    IconButton(
                      icon: const Icon(CustomIcons.namespaces),
                      onPressed: () {
                        showModal(context, const AppNamespacesWidget());
                      },
                    ),
                  ]
                : null,

        /// We always display the title of the resource as main title for the
        /// widget.
        /// If the user didn't set a selector we display the selected namespace
        /// of the currently active cluster or for cluster scoped resources we
        /// display 'All Namespaces' as subtitle.
        /// If the user has specified a selector we display the namespace which
        /// which was specified within the selector. If the user didn't
        /// specified a namespace for the selector we also show 'All Namespaces'
        /// as the subtitle.
        title: Column(
          children: [
            Text(
              Characters(
                widget.title,
              ).replaceAll(Characters(''), Characters('\u{200B}')).toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            widget.selector == null
                ? Text(
                    Characters(clustersRepository
                                        .getCluster(
                                          clustersRepository.activeClusterId,
                                        )!
                                        .namespace ==
                                    '' ||
                                (widget.scope == ResourceScope.cluster)
                            ? 'All Namespaces'
                            : clustersRepository
                                .getCluster(
                                  clustersRepository.activeClusterId,
                                )!
                                .namespace)
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : Text(
                    Characters(
                      widget.namespace ?? 'All Namespaces',
                    )
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
              future: _futureFetchItems,
              builder: (
                BuildContext context,
                AsyncSnapshot<ResourcesListResult> snapshot,
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
                            color: theme(context).colorPrimary,
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
                              padding:
                                  const EdgeInsets.all(Constants.spacingMiddle),
                              child: AppErrorWidget(
                                message: 'Could not load ${widget.title}',
                                details: snapshot.error.toString(),
                                icon: Resources.map
                                            .containsKey(widget.resource) &&
                                        Resources.map[widget.resource]!.path ==
                                            widget.path
                                    ? 'assets/resources/${widget.resource}.svg'
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

                    return Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: Constants.spacingMiddle,
                            bottom: Constants.spacingSmall,
                            left: Constants.spacingMiddle,
                            right: Constants.spacingMiddle,
                          ),
                          color: theme(context).colorPrimary,
                          child: TextField(
                            onSubmitted: (value) {
                              setState(() {
                                _filter = value;
                              });
                            },
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            enableSuggestions: false,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: 'Filter...',
                            ),
                          ),
                        ),
                        AppActionsHeaderWidget(
                          actions: [
                            AppActionsHeaderModel(
                              title: 'Create',
                              icon: Icons.create,
                              onTap: () {
                                if (Resources.map
                                        .containsKey(widget.resource) &&
                                    Resources.map[widget.resource]!.resource ==
                                        widget.resource &&
                                    Resources.map[widget.resource]!.path ==
                                        widget.path &&
                                    Resources.map[widget.resource]!.template !=
                                        '') {
                                  showModal(
                                    context,
                                    ListCreateResource(
                                      title: widget.title,
                                      resource: widget.resource,
                                      path: widget.path,
                                      template: Resources
                                          .map[widget.resource]!.template,
                                    ),
                                  );
                                } else {
                                  showModal(
                                    context,
                                    ListCreateResource(
                                      title: widget.title,
                                      resource: widget.resource,
                                      path: widget.path,
                                      template:
                                          '{"apiVersion":"","kind":"","metadata":{"name":"","namespace":""},"spec":{}}',
                                    ),
                                  );
                                }
                              },
                            ),
                            AppActionsHeaderModel(
                              title: 'Refresh',
                              icon: Icons.refresh,
                              onTap: () {
                                setState(() {
                                  _futureFetchItems = _fetchItems();
                                });
                              },
                            ),
                            AppActionsHeaderModel(
                              title: 'Bookmark',
                              icon: bookmarksRepository.isBookmarked(
                                        BookmarkType.list,
                                        clustersRepository.activeClusterId,
                                        widget.title,
                                        widget.resource,
                                        widget.path,
                                        widget.scope,
                                        null,
                                        clustersRepository
                                            .getCluster(
                                              clustersRepository
                                                  .activeClusterId,
                                            )!
                                            .namespace,
                                      ) >
                                      -1
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              onTap: () {
                                final bookmarkIndex =
                                    bookmarksRepository.isBookmarked(
                                  BookmarkType.list,
                                  clustersRepository.activeClusterId,
                                  widget.title,
                                  widget.resource,
                                  widget.path,
                                  widget.scope,
                                  null,
                                  clustersRepository
                                      .getCluster(
                                        clustersRepository.activeClusterId,
                                      )!
                                      .namespace,
                                );
                                if (bookmarkIndex > -1) {
                                  bookmarksRepository
                                      .removeBookmark(bookmarkIndex);
                                } else {
                                  bookmarksRepository.addBookmark(
                                    BookmarkType.list,
                                    clustersRepository.activeClusterId,
                                    widget.title,
                                    widget.resource,
                                    widget.path,
                                    widget.scope,
                                    widget.additionalPrinterColumns,
                                    null,
                                    clustersRepository
                                        .getCluster(
                                          clustersRepository.activeClusterId,
                                        )!
                                        .namespace,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: Constants.spacingMiddle,
                            bottom: Constants.spacingMiddle,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              right: Constants.spacingMiddle,
                              left: Constants.spacingMiddle,
                            ),
                            itemCount: _getFilteredItems(
                              snapshot.data!.items,
                            ).length,
                            itemBuilder: (context, index) {
                              return buildListItem(
                                widget.title,
                                widget.resource,
                                widget.path,
                                widget.scope,
                                widget.additionalPrinterColumns,
                                _getFilteredItems(snapshot.data!.items)[index],
                                snapshot.data!.metrics,
                              );
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
    );
  }
}
