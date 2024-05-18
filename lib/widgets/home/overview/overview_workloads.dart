import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_daemonsets.dart';
import 'package:kubenav/widgets/resources/resources/resources_deployments.dart';
import 'package:kubenav/widgets/resources/resources/resources_jobs.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources/resources_statefulsets.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// The [ResourceStatusCounts] class is used to store the counts for all
/// [ResourceStatus] types and is used as the return type for the [_fetchItems]
/// method in the [OverviewWorkload] widget.
class ResourceStatusCounts {
  final int all;
  final int success;
  final int warning;
  final int danger;

  const ResourceStatusCounts({
    required this.all,
    required this.success,
    required this.warning,
    required this.danger,
  });
}

/// The [OverviewWorkloads] widget is used to display the workloads on the
/// overview screen. Depending on the activated workloads in the settings, the
/// widget will show the pods, deployments, statefulsets, daemonsets and jobs.
class OverviewWorkloads extends StatelessWidget {
  const OverviewWorkloads({super.key});

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );

    final List<Resource> resources = [];
    if (appRepository.settings.home.showWorkloadPods) {
      resources.add(resourcePod);
    }
    if (appRepository.settings.home.showWorkloadDeployments) {
      resources.add(resourceDeployment);
    }
    if (appRepository.settings.home.showWorkloadStatefulSets) {
      resources.add(resourceStatefulSet);
    }
    if (appRepository.settings.home.showWorkloadDaemonSets) {
      resources.add(resourceDaemonSet);
    }
    if (appRepository.settings.home.showWorkloadJobs) {
      resources.add(resourceJob);
    }

    if (resources.isEmpty) {
      return Container();
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.spacingMiddle),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Workloads',
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 206,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            cacheExtent: 1024,
            crossAxisCount: 2,
            childAspectRatio: 0.30,
            children: List.generate(
              resources.length,
              (index) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: Constants.spacingSmall,
                    bottom: Constants.spacingSmall,
                    left: Constants.spacingMiddle,
                    right: Constants.spacingMiddle,
                  ),
                  child: OverviewWorkload(resource: resources[index]),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: Constants.spacingMiddle),
      ],
    );
  }
}

/// The [OverviewWorkload] widget is used to display the counts for a specific
/// workload on the overview screen. The widget will show the icon, the name of
/// the workload and the counts for all, healthy, warning and unhealthy
/// resources.
class OverviewWorkload extends StatefulWidget {
  const OverviewWorkload({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  State<OverviewWorkload> createState() => _OverviewWorkloadState();
}

class _OverviewWorkloadState extends State<OverviewWorkload> {
  late Future<ResourceStatusCounts> _futureFetchItems;

  Future<ResourceStatusCounts> _fetchItems() async {
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

    final url = appRepository.settings.home.useSelectedNamespace &&
            cluster!.namespace != ''
        ? '${widget.resource.path}/namespaces/${cluster.namespace}/${widget.resource.resource}'
        : '${widget.resource.path}/${widget.resource.resource}';

    final result = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    final data = await compute(
      widget.resource.decodeListData,
      ResourcesListData(
        list: result,
        metrics: null,
      ),
    );

    return ResourceStatusCounts(
      all: data.length,
      success: data.where((e) => e.status == ResourceStatus.success).length,
      warning: data.where((e) => e.status == ResourceStatus.warning).length,
      danger: data.where((e) => e.status == ResourceStatus.danger).length,
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

    return InkWell(
      onTap: () {
        showActions(
          context,
          OverviewWorkloadActions(
            resource: widget.resource,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(Constants.spacingListItemContent),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).extension<CustomColors>()!.shadow,
              blurRadius: Constants.sizeBorderBlurRadius,
              spreadRadius: Constants.sizeBorderSpreadRadius,
              offset: const Offset(0.0, 0.0),
            ),
          ],
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        child: FutureBuilder(
          future: _futureFetchItems,
          builder: (
            BuildContext context,
            AsyncSnapshot<ResourceStatusCounts> snapshot,
          ) {
            return Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Constants.sizeBorderRadius),
                    ),
                  ),
                  height: 54,
                  width: 54,
                  padding: const EdgeInsets.all(
                    Constants.spacingIcon54x54,
                  ),
                  child: SvgPicture.asset(
                    'assets/resources/${widget.resource.icon}.svg',
                  ),
                ),
                const SizedBox(width: Constants.spacingSmall),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.resource.plural,
                        style: primaryTextStyle(
                          context,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            'All: ${snapshot.data?.all ?? '-'}\nHealthy: ${snapshot.data?.success ?? '-'}',
                            style: secondaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: Constants.spacingMiddle),
                          Text(
                            'Warning: ${snapshot.data?.warning ?? '-'}\nUnhealthy: ${snapshot.data?.danger ?? '-'}',
                            style: secondaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// The [OverviewWorkloadActions] widget is used to display the actions for a
/// specific workload on the overview screen. The widget will show the actions
/// for all, healthy, warning and unhealthy resources. When an action is tapped,
/// the [ResourcesList] widget will be opened with the selected status.
class OverviewWorkloadActions extends StatelessWidget {
  const OverviewWorkloadActions({
    super.key,
    required this.resource,
  });

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return AppResourceActions(
      mode: AppResourceActionsMode.actions,
      actions: List.generate(
        ResourceStatus.values.length,
        (index) {
          return AppResourceActionsModel(
            title: ResourceStatus.values[index].toLocalizedString(),
            icon: Icons.list,
            onTap: () async {
              ClustersRepository clustersRepository =
                  Provider.of<ClustersRepository>(
                context,
                listen: false,
              );
              AppRepository appRepository = Provider.of<AppRepository>(
                context,
                listen: false,
              );

              try {
                if (!appRepository.settings.home.useSelectedNamespace) {
                  await clustersRepository.setNamespace(
                    clustersRepository.activeClusterId,
                    '',
                  );
                }
                if (context.mounted) {
                  navigate(
                    context,
                    ResourcesList(
                      resource: resource,
                      namespace: null,
                      selector: null,
                      status: ResourceStatus.values[index],
                    ),
                  );
                }
              } catch (_) {}
            },
          );
        },
      ),
    );
  }
}
