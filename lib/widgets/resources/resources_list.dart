import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_nodes.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';
import 'package:kubenav/widgets/shared/app_namespaces_widget.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// The [ResourcesListData] model is used for the data returned by the
/// `_fetchItems` function in the [ResourcesList] widget. The model contains the
/// [list] of items and the [metrics] of the resource.
///
/// This model is used to decode the list of items and metrics within one
/// isolate. Without it we would have to use two isolates, one for the list
/// items and one for the metrics.
class ResourcesListData {
  String list;
  String? metrics;

  ResourcesListData({
    required this.list,
    required this.metrics,
  });
}

/// The [ResourcesList] widget is used to display a list of [items] for a
/// provided [resource]. The [itemBuilder] function is used to generate the list
/// items for the provided [resource].
class ResourcesList extends StatefulWidget {
  const ResourcesList({
    super.key,
    required this.resource,
    required this.namespace,
    required this.selector,
    this.status = ResourceStatus.undefined,
  });

  final Resource resource;
  final String? namespace;
  final String? selector;
  final ResourceStatus status;

  @override
  State<ResourcesList> createState() => _ResourcesListState();
}

class _ResourcesListState extends State<ResourcesList> {
  late Future<List<ResourceItem>> _futureFetchItems;
  final _filterController = TextEditingController();
  ResourceStatus _status = ResourceStatus.undefined;

  /// [_fetchItems] is used to fetch the items for the provided [resource]. The
  /// function returns a list of [ResourceItem]s. If the resource is a `pod` or
  /// a `node` we also fetch the metrics for the resource.
  Future<List<ResourceItem>> _fetchItems() async {
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

    final listUrl = widget.resource.scope == ResourceScope.cluster
        ? '${widget.resource.path}/${widget.resource.resource}?${widget.selector} ?? '
            '}'
        : widget.namespace != null
            ? '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}?${widget.selector ?? ''}'
            : widget.selector != null &&
                    widget.selector!.startsWith('fieldSelector=spec.nodeName=')
                ? '${widget.resource.path}/${widget.resource.resource}?${widget.selector ?? ''}'
                : '${widget.resource.path}${cluster!.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/${widget.resource.resource}?${widget.selector ?? ''}';

    final listResult = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(listUrl);

    try {
      if ((widget.resource.resource == resourceNode.resource &&
              widget.resource.path == resourceNode.path) ||
          (widget.resource.resource == resourcePod.resource &&
              widget.resource.path == resourcePod.path)) {
        final metricsUrl = widget.resource.scope == ResourceScope.cluster
            ? '/apis/metrics.k8s.io/v1beta1/${widget.resource.resource}?${widget.selector ?? ''}'
            : widget.namespace != null
                ? '/apis/metrics.k8s.io/v1beta1/namespaces/${widget.namespace}/${widget.resource.resource}?${widget.selector ?? ''}'
                : '/apis/metrics.k8s.io/v1beta1${cluster.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/${widget.resource.resource}?${widget.selector ?? ''}';

        final metricsResult = await KubernetesService(
          cluster: cluster,
          proxy: appRepository.settings.proxy,
          timeout: appRepository.settings.timeout,
        ).getRequest(metricsUrl);

        return await compute(
          widget.resource.decodeListData,
          ResourcesListData(
            list: listResult,
            metrics: metricsResult,
          ),
        );
      }
    } catch (err) {
      Logger.log(
        'ResourcesList _fetchItems',
        'Failed to Load Metrics',
        err,
      );
    }

    return await compute(
      widget.resource.decodeListData,
      ResourcesListData(
        list: listResult,
        metrics: null,
      ),
    );
  }

  /// [_getFilteredItems] is a helper function to filter the provided [items]
  /// based on the [_filterController.text] and the [_status].
  List<ResourceItem> _getFilteredItems(List<ResourceItem> items) {
    if (_filterController.text.isEmpty && _status == ResourceStatus.undefined) {
      return items;
    }

    if (_filterController.text.isNotEmpty &&
        _status == ResourceStatus.undefined) {
      return items
          .where(
            (e) =>
                widget.resource
                    .getName(e.item)
                    .contains(_filterController.text.toLowerCase()) ==
                true,
          )
          .toList();
    }

    if (_filterController.text.isEmpty && _status != ResourceStatus.undefined) {
      return items.where((e) => e.status == _status).toList();
    }

    return items
        .where(
          (e) =>
              widget.resource
                      .getName(e.item)
                      .contains(_filterController.text.toLowerCase()) ==
                  true &&
              e.status == _status,
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();

    _filterController.addListener(() {
      setState(() {});
    });
    _status = widget.status;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchItems = _fetchItems();
    });
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        actions: widget.resource.scope == ResourceScope.namespaced &&
                widget.selector == null
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
        /// was specified within the selector. If the user didn't specified a
        /// namespace for the selector we also show 'All Namespaces' as the
        /// subtitle.
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
            widget.selector == null
                ? Text(
                    Characters(
                      clustersRepository
                                      .getCluster(
                                        clustersRepository.activeClusterId,
                                      )
                                      ?.namespace ==
                                  '' ||
                              (widget.resource.scope == ResourceScope.cluster)
                          ? 'All Namespaces'
                          : clustersRepository
                                  .getCluster(
                                    clustersRepository.activeClusterId,
                                  )
                                  ?.namespace ??
                              'All Namespaces',
                    )
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: _futureFetchItems,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<ResourceItem>> snapshot,
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
                                      'Failed to Load ${widget.resource.plural}',
                                  details: snapshot.error.toString(),
                                  icon:
                                      'assets/resources/${widget.resource.icon}.svg',
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      final filteredItems = _getFilteredItems(snapshot.data!);

                      return Wrap(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: Constants.spacingMiddle,
                              bottom: Constants.spacingSmall,
                              left: Constants.spacingMiddle,
                              right: Constants.spacingMiddle,
                            ),
                            color: Theme.of(context).colorScheme.primary,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _filterController,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    cursorColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    keyboardType: TextInputType.text,
                                    autocorrect: false,
                                    enableSuggestions: false,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          width: 0.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          width: 0.0,
                                        ),
                                      ),
                                      isDense: true,
                                      contentPadding: const EdgeInsets.all(8),
                                      hintStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                      hintText: 'Filter...',
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          _filterController.clear();
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ResourcesListStatus(
                                  items: snapshot.data!,
                                  status: _status,
                                  selectStatus: (ResourceStatus status) {
                                    setState(() {
                                      _status = status;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          ResourcesListActions(
                            resource: widget.resource,
                            refresh: () {
                              setState(() {
                                _futureFetchItems = _fetchItems();
                              });
                            },
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
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                return widget.resource.listItemBuilder(
                                  context,
                                  widget.resource,
                                  filteredItems[index],
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
      ),
    );
  }
}

/// The [ResourcesListActions] widget is used to render the actions for the
/// resources in the list view. The [ResourcesListActions] widget is used in the
/// [ResourcesList] widget.
class ResourcesListActions extends StatelessWidget {
  const ResourcesListActions({
    super.key,
    required this.resource,
    required this.refresh,
  });

  final Resource resource;
  final void Function() refresh;

  @override
  Widget build(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );
    BookmarksRepository bookmarksRepository = Provider.of<BookmarksRepository>(
      context,
      listen: true,
    );

    return AppResourceActions(
      mode: AppResourceActionsMode.header,
      actions: [
        AppResourceActionsModel(
          title: 'Create',
          icon: Icons.create,
          onTap: () {
            showModal(
              context,
              ResourcesListItemCreateResource(
                resource: resource,
              ),
            );
          },
        ),
        AppResourceActionsModel(
          title: 'Refresh',
          icon: Icons.refresh,
          onTap: refresh,
        ),
        AppResourceActionsModel(
          title: bookmarksRepository.isBookmarked(
                    BookmarkType.list,
                    clustersRepository.activeClusterId,
                    null,
                    clustersRepository
                        .getCluster(
                          clustersRepository.activeClusterId,
                        )
                        ?.namespace,
                    resource,
                  ) >
                  -1
              ? 'Remove Bookmark'
              : 'Add Bookmark',
          icon: bookmarksRepository.isBookmarked(
                    BookmarkType.list,
                    clustersRepository.activeClusterId,
                    null,
                    clustersRepository
                        .getCluster(
                          clustersRepository.activeClusterId,
                        )
                        ?.namespace,
                    resource,
                  ) >
                  -1
              ? Icons.bookmark
              : Icons.bookmark_border,
          onTap: () {
            final bookmarkIndex = bookmarksRepository.isBookmarked(
              BookmarkType.list,
              clustersRepository.activeClusterId,
              null,
              clustersRepository
                  .getCluster(
                    clustersRepository.activeClusterId,
                  )
                  ?.namespace,
              resource,
            );
            if (bookmarkIndex > -1) {
              bookmarksRepository.removeBookmark(bookmarkIndex);
            } else {
              bookmarksRepository.addBookmark(
                BookmarkType.list,
                clustersRepository.activeClusterId,
                null,
                clustersRepository
                    .getCluster(
                      clustersRepository.activeClusterId,
                    )
                    ?.namespace,
                resource,
              );
            }
          },
        ),
      ],
    );
  }
}

/// The [ResourcesListStatus] widget is used to display a popup menu button to
/// filter the [items] of the [ResourcesList] by their [status]. The widget
/// displays the count of items for each status.
class ResourcesListStatus extends StatelessWidget {
  const ResourcesListStatus({
    super.key,
    required this.items,
    required this.status,
    required this.selectStatus,
  });

  final List<ResourceItem> items;
  final ResourceStatus status;
  final Function(ResourceStatus) selectStatus;

  @override
  Widget build(BuildContext context) {
    final undefinedCount = items.length;
    final successCount =
        items.where((e) => e.status == ResourceStatus.success).length;
    final warningCount =
        items.where((e) => e.status == ResourceStatus.warning).length;
    final dangerCount =
        items.where((e) => e.status == ResourceStatus.danger).length;

    return PopupMenuButton<ResourceStatus>(
      initialValue: status,
      onSelected: selectStatus,
      icon: Icon(
        Icons.filter_list,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ResourceStatus>>[
        PopupMenuItem<ResourceStatus>(
          value: ResourceStatus.undefined,
          child: Text(
            '${ResourceStatus.undefined.toLocalizedString()} ($undefinedCount)',
          ),
        ),
        PopupMenuItem<ResourceStatus>(
          value: ResourceStatus.success,
          child: Text(
            '${ResourceStatus.success.toLocalizedString()} ($successCount)',
          ),
        ),
        PopupMenuItem<ResourceStatus>(
          value: ResourceStatus.warning,
          child: Text(
            '${ResourceStatus.warning.toLocalizedString()} ($warningCount)',
          ),
        ),
        PopupMenuItem<ResourceStatus>(
          value: ResourceStatus.danger,
          child: Text(
            '${ResourceStatus.danger.toLocalizedString()} ($dangerCount)',
          ),
        ),
      ],
    );
  }
}

/// The [ResourcesListItem] widget is used to display a single [item] in the
/// [ResourcesList]. The widget displays the [name], [namespace] and [details]
/// of the [item].
class ResourcesListItem extends StatelessWidget {
  const ResourcesListItem({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.item,
    required this.status,
    required this.details,
  });

  final String name;
  final String? namespace;
  final Resource resource;
  final dynamic item;
  final ResourceStatus status;
  final List<String> details;

  /// [_buildStatus] is a helper function to display the status of the resource.
  /// The status can be `success`, `danger` or `warning`. The function returns
  /// an icon with the color of the status. If the status is `undefined` the
  /// function returns an empty container.
  Widget _buildStatus(BuildContext context, ResourceStatus status) {
    if (status != ResourceStatus.undefined) {
      return Wrap(
        children: [
          const SizedBox(width: Constants.spacingSmall),
          Icon(
            Icons.radio_button_checked,
            size: 24,
            color: status == ResourceStatus.success
                ? Theme.of(context).extension<CustomColors>()!.success
                : status == ResourceStatus.danger
                    ? Theme.of(context).extension<CustomColors>()!.error
                    : Theme.of(context).extension<CustomColors>()!.warning,
          ),
        ],
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return AppListItem(
      onTap: () {
        navigate(
          context,
          ResourcesDetails(
            name: name,
            namespace: namespace,
            resource: resource,
          ),
        );
      },
      onLongPress: () {
        HapticFeedback.vibrate();

        showActions(
          context,
          ResourcesListItemActions(
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
          _buildStatus(context, status),
        ],
      ),
    );
  }
}

/// The [ResourcesListItemActions] widget is used to display the actions for a
/// [ResourcesListItem]. It reuses the [resourceDetailsActions] function to
/// generate the actions for the provided [item].
class ResourcesListItemActions extends StatelessWidget {
  const ResourcesListItemActions({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.item,
  });

  final String name;
  final String? namespace;
  final Resource resource;
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return AppResourceActions(
      mode: AppResourceActionsMode.actions,
      actions: resourceDetailsActions(
        context,
        name,
        namespace,
        resource,
        item,
        null,
      ),
    );
  }
}

/// [_createResourceJson] is a helper function to prettify the provided
/// [template] in the [ResourcesListItemCreateResource] widget, when the user
/// has enabled the `json` option in the settings.
String _createResourceJson(String template) {
  final parsedTemplate = json.decode(template);
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  return encoder.convert(parsedTemplate);
}

/// [_createResourceDecodeJson] is a helper function to decode the provided
/// [template] in the [ResourcesListItemCreateResource] widget, when the user
/// has enabled the `json` option in the settings.
///
/// This is required to run the `json.decode` function in an isolate.
dynamic _createResourceDecodeJson(String template) {
  return json.decode(template);
}

/// [_createResourceDecodeJson] is a helper function to decode the provided
/// [template] in the [ResourcesListItemCreateResource] widget, when the user
/// has enabled the `yaml` option in the settings.
///
/// This is required to run the `json.decode` function in an isolate.
dynamic _createResourceDecodeYaml(String template) {
  return loadYaml(template);
}

/// The [ResourcesListItemCreateResource] widget can be used to create a new
/// [resource]. The widget renders the provided [resource.template] in a code
/// editor, where the user can modify the template. The user can then create the
/// resource by pressing the action button.
class ResourcesListItemCreateResource extends StatefulWidget {
  const ResourcesListItemCreateResource({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  State<ResourcesListItemCreateResource> createState() =>
      _ResourcesListItemCreateResourceState();
}

class _ResourcesListItemCreateResourceState
    extends State<ResourcesListItemCreateResource> {
  CodeController _codeController = CodeController();
  bool _isLoading = false;

  /// [_init] is called when the widget is initialized. Within the [_init]
  /// function we prettify the provided [widget.resource.template] and convert
  /// it to either a json document or a yaml document depending on the users
  /// settings.
  Future<void> _init() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    _codeController = CodeController(
      text: '',
      language: appRepository.settings.editorFormat == 'json'
          ? highlight_json.json
          : highlight_yaml.yaml,
    );

    try {
      if (appRepository.settings.editorFormat == 'json') {
        _codeController.text = await compute(
          _createResourceJson,
          widget.resource.template,
        );
      } else {
        final data = await HelpersService().prettifyYAML(
          widget.resource.template,
        );
        _codeController.text = data;
      }
    } catch (err) {
      Logger.log(
        'ResourcesListItemCreateResource _init',
        'Encoding Failed',
        err,
      );
    }
  }

  /// [_createResource] creates the resources, which was defined by the user via
  /// the code editor. To create the resource we have to extract the name and
  /// namespace of the resource from the user input. Then we run a post request
  /// against the Kubernetes API to create the resource.
  Future<void> _createResource() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final manifest = appRepository.settings.editorFormat == 'json'
          ? await compute(_createResourceDecodeJson, _codeController.text)
          : await compute(_createResourceDecodeYaml, _codeController.text);
      final name =
          manifest['metadata'] != null && manifest['metadata']['name'] != null
              ? manifest['metadata']['name']
              : '';
      final namespace = manifest['metadata'] != null &&
              manifest['metadata']['namespace'] != null
          ? manifest['metadata']['namespace']
          : '';
      final url =
          '${widget.resource.path}${namespace != null && namespace != '' ? '/namespaces/$namespace' : ''}/${widget.resource.resource}';

      Logger.log(
        'ResourcesListItemCreateResource _createResource',
        'Create ${widget.resource.singular}',
        'Url: $url Manifest: $manifest',
      );

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).postRequest(url, jsonEncode(manifest));

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          '${widget.resource.singular} Created',
          namespace != null && namespace != ''
              ? 'The ${widget.resource.singular} $namespace/$name was created'
              : 'The ${widget.resource.singular} $name was created',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'ResourcesListItemCreateResource _createResource',
        'Creation Failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Creation Failed',
          err.toString(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Create',
      subtitle: widget.resource.singular,
      icon: Icons.create,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Create',
      actionPressed: () {
        _createResource();
      },
      actionIsLoading: _isLoading,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: CodeTheme(
            data: CodeThemeData(
              styles: Theme.of(context).extension<EditorColors>()!.getTheme(),
            ),
            child: CodeField(
              controller: _codeController,
              enabled: true,
              textStyle: TextStyle(
                fontSize: 14,
                fontFamily: getMonospaceFontFamily(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
