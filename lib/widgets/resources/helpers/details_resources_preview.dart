import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_horizontal_list_cards_widget.dart';

class DetailsResourcesPreview extends StatefulWidget {
  const DetailsResourcesPreview({
    super.key,
    required this.resource,
    required this.namespace,
    required this.selector,
    required this.filter,
  });

  final Resource resource;
  final String? namespace;
  final String selector;
  final List<dynamic> Function(List<dynamic> items)? filter;

  @override
  State<DetailsResourcesPreview> createState() =>
      _DetailsResourcesPreviewState();
}

class _DetailsResourcesPreviewState extends State<DetailsResourcesPreview> {
  late Future<List<dynamic>> _futureFetchItems;

  Future<List<dynamic>> _fetchItems() async {
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

    final url = widget.namespace != null
        ? '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}?limit=5&${widget.selector}'
        : '${widget.resource.path}/${widget.resource.resource}?limit=5&${widget.selector}';

    final result = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    final items = await compute(
      widget.resource.decodeList,
      result,
    );

    if (widget.filter != null) {
      return widget.filter!(items);
    }

    return items;
  }

  /// [buildContainer] builds the container for the [DetailsResourcesPreview]
  /// content when the repository state is loading, error or the list of items
  /// in the repository is empty.
  Widget buildContainer(Widget child) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
            bottom: Constants.spacingSmall,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.resource.plural,
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            right: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
          ),
          child: child,
        ),
      ],
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
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return FutureBuilder(
      future: _futureFetchItems,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<dynamic>> snapshot,
      ) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return buildContainer(
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          default:
            if (snapshot.hasError) {
              return buildContainer(
                AppErrorWidget(
                  message: 'Failed to Load ${widget.resource.plural}',
                  details: snapshot.error.toString(),
                  icon: 'assets/resources/${widget.resource.icon}.svg',
                ),
              );
            }

            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return buildContainer(
                AppErrorWidget(
                  message: 'No ${widget.resource.plural} Found',
                  details:
                      'No ${widget.resource.plural} were found for the provided filter',
                  icon: 'assets/resources/${widget.resource.icon}.svg',
                ),
              );
            }

            return AppHorizontalListCardsWidget(
              title: widget.resource.plural,
              cards: List.generate(
                snapshot.data!.length,
                (index) => AppHorizontalListCardsModel(
                  title: widget.resource.getName(snapshot.data![index]),
                  subtitle: widget.resource.previewItemBuilder(
                    snapshot.data![index],
                  ),
                  image: 'assets/resources/${widget.resource.icon}.svg',
                  imageFit: BoxFit.none,
                  onTap: () {
                    navigate(
                      context,
                      ResourcesDetails(
                        name: widget.resource.getName(snapshot.data![index]),
                        namespace:
                            widget.resource.getNamespace(snapshot.data![index]),
                        resource: widget.resource,
                      ),
                    );
                  },
                ),
              ),
              moreText: snapshot.data!.length >= 5 && widget.filter == null
                  ? 'View all'
                  : null,
              moreIcon: snapshot.data!.length >= 5 && widget.filter == null
                  ? Icons.keyboard_arrow_right
                  : null,
              moreOnTap: () {
                navigate(
                  context,
                  ResourcesList(
                    resource: widget.resource,
                    namespace: widget.selector
                            .startsWith('fieldSelector=spec.nodeName=')
                        ? null
                        : widget.namespace,
                    selector: widget.selector,
                  ),
                );
              },
            );
        }
      },
    );
  }
}
