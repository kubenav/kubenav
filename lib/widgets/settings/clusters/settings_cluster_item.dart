import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [SettingsClusterItem] widget is used to display a single cluster in the
/// [SettingsClusters] widget. The widget also makes an API call to the health
/// endpoint of each cluster, to indicate if we can reach the cluster.
class SettingsClusterItem extends StatefulWidget {
  const SettingsClusterItem({
    Key? key,
    required this.index,
    required this.cluster,
    required this.isActiveCluster,
    this.onTap,
    this.onDoubleTap,
  }) : super(key: key);

  final int index;
  final Cluster cluster;
  final bool isActiveCluster;
  final void Function()? onTap;
  final void Function()? onDoubleTap;

  @override
  State<SettingsClusterItem> createState() => _SettingsClusterItemState();
}

class _SettingsClusterItemState extends State<SettingsClusterItem> {
  bool statusOk = false;

  /// [_getClusterStatus] makes an request against the Kubernetes api of the
  /// given cluster. If the request returns a status code >= 200 and < 300 we
  /// set the [statusOk] variable to `true`. If the request fails with another
  /// status code, we set the [statusOk] variable to `false`.
  Future<void> _getClusterStatus() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      final cluster = await clustersRepository.getClusterWithCredentials(
        widget.cluster.id,
      );

      final result = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).checkHealth();
      Logger.log(
        'SettingsClusterItem getClusterStatus',
        'Cluster status was returned successfully',
        result,
      );
      setState(() {
        statusOk = result;
      });
    } catch (err) {
      Logger.log(
        'SettingsClusterItem getClusterStatus',
        'There was an error while returning the cluster status',
        err,
      );
      setState(() {
        statusOk = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getClusterStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: Constants.spacingSmall,
        bottom: Constants.spacingSmall,
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      child: AppListItem(
        onTap: widget.onTap,
        onDoubleTap: widget.onDoubleTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Characters(widget.cluster.name)
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        style: primaryTextStyle(
                          context,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        Characters(widget.cluster.clusterProviderType.title())
                            .replaceAll(
                              Characters(''),
                              Characters('\u{200B}'),
                            )
                            .toString(),
                        style: secondaryTextStyle(
                          context,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                ReorderableDragStartListener(
                  index: widget.index,
                  child: Icon(
                    widget.isActiveCluster
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 24,
                    color: statusOk
                        ? theme(context).colorSuccess
                        : theme(context).colorDanger,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
