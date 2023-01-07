import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// [AppClustersWidget] is a widget which can be used to switch the active
/// Kubernetes cluster.
class AppClustersWidget extends StatefulWidget {
  const AppClustersWidget({Key? key}) : super(key: key);

  @override
  State<AppClustersWidget> createState() => _AppClustersWidgetState();
}

class _AppClustersWidgetState extends State<AppClustersWidget> {
  Future<void> setActiveCluster(BuildContext context, String clusterId) async {
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
      subtitle: 'Select the active cluster',
      icon: CustomIcons.clusters,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Close',
      actionPressed: () {
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: ListView(
        children: List.generate(
          clustersRepository.clusters.length,
          (index) => Container(
            margin: const EdgeInsets.only(
              top: Constants.spacingSmall,
              bottom: Constants.spacingSmall,
              left: Constants.spacingExtraSmall,
              right: Constants.spacingExtraSmall,
            ),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: theme(context).colorShadow,
                  blurRadius: Constants.sizeBorderBlurRadius,
                  spreadRadius: Constants.sizeBorderSpreadRadius,
                  offset: const Offset(0.0, 0.0),
                ),
              ],
              color: theme(context).colorCard,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constants.sizeBorderRadius),
              ),
            ),
            child: InkWell(
              onTap: () {
                setActiveCluster(
                  context,
                  clustersRepository.clusters[index].id,
                );
              },
              child: Row(
                children: [
                  Icon(
                    clustersRepository.clusters[index].id ==
                            clustersRepository.activeClusterId
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 24,
                    color: theme(context).colorPrimary,
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
