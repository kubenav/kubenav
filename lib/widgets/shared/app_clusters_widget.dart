import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// [AppClustersWidget] is a widget which can be used to switch the active
/// Kubernetes cluster.
class AppClustersWidget extends StatefulWidget {
  const AppClustersWidget({super.key});

  @override
  State<AppClustersWidget> createState() => _AppClustersWidgetState();
}

class _AppClustersWidgetState extends State<AppClustersWidget> {
  Future<void> _setActiveCluster(String clusterId) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      await clustersRepository.setActiveCluster(clusterId);

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return AppBottomSheetWidget(
      title: 'Clusters',
      subtitle: 'Select the Active Cluster',
      icon: CustomIcons.clusters,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Close',
      actionPressed: () {
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder:
                (context, index) =>
                    const SizedBox(height: Constants.spacingMiddle),
            itemCount: clustersRepository.clusters.length,
            itemBuilder:
                (context, index) => AppListItem(
                  onTap: () {
                    _setActiveCluster(clustersRepository.clusters[index].id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        clustersRepository.clusters[index].id ==
                                clustersRepository.activeClusterId
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          clustersRepository.clusters[index].name,
                          style: normalTextStyle(context),
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
