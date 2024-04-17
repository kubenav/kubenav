import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [HomeClusters] can be used to display a list of clusters when the app
/// is started and the user has selected the [isShowClustersOnStart] option
/// in the settings. When the user selected a cluster, this screen is not shown
/// again.
class HomeClusters extends StatefulWidget {
  const HomeClusters({super.key});

  @override
  State<HomeClusters> createState() => _HomeClustersState();
}

class _HomeClustersState extends State<HomeClusters> {
  /// [_setActiveCluster] sets the cluster with the provided [clusterId] as the
  /// active cluster and disabled the [showClusters] option in the app
  /// repository, to not show this screen again.
  Future<void> _setActiveCluster(String clusterId) async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      await clustersRepository.setActiveCluster(clusterId);
      await appRepository.disableShowClusters();
    } catch (_) {}
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
        title: const Text('Select Cluster'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Constants.spacingMiddle),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: Constants.spacingMiddle,
            ),
            itemCount: clustersRepository.clusters.length,
            itemBuilder: (context, index) => AppListItem(
              onTap: () {
                _setActiveCluster(clustersRepository.clusters[index].id);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.radio_button_unchecked,
                    size: 24,
                    color: theme(context).primary,
                  ),
                  const SizedBox(width: Constants.spacingSmall),
                  Expanded(
                    flex: 1,
                    child: Text(
                      clustersRepository.clusters[index].name,
                      style: noramlTextStyle(
                        context,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
