import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition_list.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [ResourcesListCRDs] widget can be used to view a list of all CRDs in a
/// cluster. When the user selects a CRD we redirect him to the [ResourcesList]
/// widget and show a list of all CRs which are related to the Custom Resource
/// Definition.
class ResourcesListCRDs extends StatefulWidget {
  const ResourcesListCRDs({super.key});

  @override
  State<ResourcesListCRDs> createState() => _ResourcesListCRDsState();
}

class _ResourcesListCRDsState extends State<ResourcesListCRDs> {
  late Future<List<Resource>> _futureFetchItems;
  String _filter = '';

  Future<List<Resource>> _fetchItems() async {
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

    final resourcesListUrl =
        '${Resources.map['customresourcedefinitions']!.path}/${Resources.map['customresourcedefinitions']!.resource}';

    final resourcesList = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(resourcesListUrl);

    Logger.log(
      'ResourcesListCRDsRepository _fetchItems',
      '${resourcesList['items'].length} items were returned',
      'Request URL: $resourcesListUrl\nManifest: $resourcesList',
    );

    final crds =
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionList
            .fromJson(
      resourcesList,
    );
    if (crds != null) {
      final List<Resource> resources = [];
      for (final crd in crds.items) {
        for (final version in crd.spec.versions) {
          resources.add(
            Resource(
              resourceType: ResourceType.cluster,
              title: crd.spec.names.kind,
              description: '${crd.spec.group}/${version.name}',
              resource: crd.spec.names.plural,
              path: '/apis/${crd.spec.group}/${version.name}',
              scope: getResourceScopeFromString(crd.spec.scope),
              template: '',
              additionalPrinterColumns: version.additionalPrinterColumns
                  .where((e) => e.priority == null || e.priority == 0)
                  .map(
                    (e) => AdditionalPrinterColumns(
                      description: e.description ?? '',
                      jsonPath: e.jsonPath,
                      name: e.name,
                      type: e.type,
                    ),
                  )
                  .toList(),
            ),
          );
        }
      }
      return resources;
    }

    return [];
  }

  /// [_getFilteredItems] filters the given list of [items] by the setted
  /// [_filter]. When the [_filter] is not empty the title of an item must
  /// contain the filter keyword.
  List<dynamic> _getFilteredItems(List<Resource> items) {
    return _filter == ''
        ? items
        : items
            .where(
              (item) =>
                  item.title.toLowerCase().contains(_filter.toLowerCase()),
            )
            .toList();
  }

  /// [buildListItem] builds the widget for a single CRD in the CRDs list. When
  /// the user clicks on the item he is redirect to the [ResourcesList] view
  /// where he can see all CRs which are related to the CRD.
  Widget buildListItem(
    BuildContext context,
    Resource resource,
  ) {
    return AppListItem(
      onTap: () {
        navigate(
          context,
          ResourcesList(
            title: resource.title,
            resource: resource.resource,
            path: resource.path,
            scope: resource.scope,
            namespace: null,
            selector: null,
            additionalPrinterColumns: resource.additionalPrinterColumns,
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
                  Characters(resource.title)
                      .replaceAll(Characters(''), Characters('\u{200B}'))
                      .toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: primaryTextStyle(
                    context,
                  ),
                ),
                Text(
                  Characters(resource.description)
                      .replaceAll(Characters(''), Characters('\u{200B}'))
                      .toString(),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: secondaryTextStyle(
                    context,
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
      _futureFetchItems = _fetchItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
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
              Characters('CustomResourceDefinitions')
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
              Characters('All Namespaces')
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
                  AsyncSnapshot<List<Resource>> snapshot,
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
                              color: theme(context).primary,
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
                                      'Could not load CustomResourceDefinitions',
                                  details: snapshot.error.toString(),
                                  icon:
                                      'assets/resources/customresourcedefinitions.svg',
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
                              bottom: Constants.spacingMiddle,
                              left: Constants.spacingMiddle,
                              right: Constants.spacingMiddle,
                            ),
                            color: theme(context).primary,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  _filter = value;
                                });
                              },
                              style: TextStyle(
                                color: theme(context).onPrimary,
                              ),
                              cursorColor: theme(context).onPrimary,
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                              enableSuggestions: false,
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: theme(context).onPrimary,
                                    width: 0.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: theme(context).onPrimary,
                                    width: 0.0,
                                  ),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle: TextStyle(
                                  color: theme(context).onPrimary,
                                ),
                                hintText: 'Filter...',
                              ),
                            ),
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
                                return buildListItem(
                                  context,
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
