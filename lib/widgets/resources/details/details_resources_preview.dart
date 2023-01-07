import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_cron_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources/cronjobs.dart' as cronjob_helpers;
import 'package:kubenav/utils/resources/deployments.dart' as deployment_helpers;
import 'package:kubenav/utils/resources/events.dart' as event_helpers;
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/resources/jobs.dart' as job_helpers;
import 'package:kubenav/utils/resources/pods.dart' as pod_helpers;
import 'package:kubenav/widgets/resources/resource_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_horizontal_list_cards_widget.dart';

import 'package:kubenav/utils/resources/statefulsets.dart'
    as statefulset_helpers;

/// The [DetailsResourcesPreview] widget can be used to display a preview of
/// a list of resources (e.g. display all related Pod or Events within the
/// Deployment details). The resources which should be displayed are defined via
/// the arguments [title], [resource], [path] and [scope]. It is also possible
/// to filter the list of resources by a [namespace], [selector] or custom
/// [filter] function.
class DetailsResourcesPreview extends StatefulWidget {
  const DetailsResourcesPreview({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.namespace,
    required this.selector,
    this.filter,
  }) : super(key: key);

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
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

    final resourcesListUrl = widget.namespace != null
        ? '${widget.path}/namespaces/${widget.namespace}/${widget.resource}?limit=5&${widget.selector}'
        : '${widget.path}/${widget.resource}?limit=5&${widget.selector}';

    final resourcesList = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(resourcesListUrl);

    if (widget.filter != null) {
      return widget.filter!(resourcesList['items']);
    }

    return resourcesList['items'];
  }

  /// [buildContainer] builds the container for the [DetailsResourcesPreview]
  /// content when the repository state is loading, error or the list of items
  /// in the repository is empty.
  Widget buildContainer(BuildContext context, Widget child) {
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
                  widget.title,
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

  /// [buildSubtitle] builds the subtitle in the card for the displayed list of
  /// resources. The subtitle is build based on the type of the resource.
  List<String> buildSubtitle(
    String title,
    String resource,
    String path,
    ResourceScope scope,
    dynamic item,
  ) {
    if (resource == Resources.map['cronjobs']!.resource &&
        path == Resources.map['cronjobs']!.path) {
      return cronjob_helpers
          .buildInfoText(IoK8sApiBatchV1CronJob.fromJson(item));
    }

    if (resource == Resources.map['deployments']!.resource &&
        path == Resources.map['deployments']!.path) {
      return deployment_helpers
          .buildInfoText(IoK8sApiAppsV1Deployment.fromJson(item));
    }

    if (resource == Resources.map['events']!.resource &&
        path == Resources.map['events']!.path) {
      return event_helpers.buildInfoText(IoK8sApiCoreV1Event.fromJson(item));
    }

    if (resource == Resources.map['jobs']!.resource &&
        path == Resources.map['jobs']!.path) {
      return job_helpers.buildInfoText(IoK8sApiBatchV1Job.fromJson(item));
    }

    if (resource == Resources.map['pods']!.resource &&
        path == Resources.map['pods']!.path) {
      return pod_helpers.buildInfoText(IoK8sApiCoreV1Pod.fromJson(item));
    }

    if (resource == Resources.map['statefulsets']!.resource &&
        path == Resources.map['statefulsets']!.path) {
      return statefulset_helpers
          .buildInfoText(IoK8sApiAppsV1StatefulSet.fromJson(item));
    }

    final age = getAge(item['metadata'] != null &&
            item['metadata']['creationTimestamp'] != null
        ? DateTime.parse(item['metadata']['creationTimestamp'])
        : null);

    return item['metadata']?['namespace'] != null
        ? ['Namespace: ${item['metadata']?['namespace']}', 'Age: $age']
        : ['Age: $age'];
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
              context,
              CircularProgressIndicator(
                color: theme(context).colorPrimary,
              ),
            );
          default:
            if (snapshot.hasError) {
              return buildContainer(
                context,
                AppErrorWidget(
                  message: 'Could not load ${widget.title}',
                  details: snapshot.error.toString(),
                  icon: Resources.map.containsKey(widget.resource) &&
                          Resources.map[widget.resource]!.path == widget.path
                      ? 'assets/resources/image108x108/${widget.resource}.png'
                      : null,
                ),
              );
            }

            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return buildContainer(
                context,
                AppErrorWidget(
                  message: 'No ${widget.title} found',
                  details: 'We could not found any ${widget.title}',
                  icon: Resources.map.containsKey(widget.resource) &&
                          Resources.map[widget.resource]!.path == widget.path
                      ? 'assets/resources/image108x108/${widget.resource}.png'
                      : null,
                ),
              );
            }

            return AppHorizontalListCardsWidget(
              title: widget.title,
              cards: List.generate(
                snapshot.data!.length,
                (index) => AppHorizontalListCardsModel(
                  title: snapshot.data![index]['metadata']?['name'] ?? '',
                  subtitle: buildSubtitle(
                    widget.title,
                    widget.resource,
                    widget.path,
                    widget.scope,
                    snapshot.data![index],
                  ),
                  image: 'assets/resources/image108x108/${widget.resource}.png',
                  imageFit: BoxFit.none,
                  onTap: () {
                    navigate(
                      context,
                      ResourcesDetails(
                        title: widget.title,
                        resource: widget.resource,
                        path: widget.path,
                        scope: widget.scope,
                        additionalPrinterColumns:
                            widget.additionalPrinterColumns,
                        name: snapshot.data![index]['metadata']?['name'],
                        namespace: snapshot.data![index]['metadata']
                            ?['namespace'],
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
                    title: widget.title,
                    resource: widget.resource,
                    path: widget.path,
                    scope: widget.scope,
                    additionalPrinterColumns: widget.additionalPrinterColumns,
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
