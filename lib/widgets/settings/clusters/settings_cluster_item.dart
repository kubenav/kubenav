import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/clusters/settings_edit_cluster.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [SettingsClusterItem] widget is used to display a single cluster in the
/// [SettingsClusters] widget. The widget also makes an API call to the health
/// endpoint of each cluster, to indicate if we can reach the cluster.
class SettingsClusterItem extends StatefulWidget {
  const SettingsClusterItem({
    super.key,
    required this.index,
    required this.cluster,
    required this.isActiveCluster,
    required this.isSortable,
    this.onTap,
    this.onLongPress,
  });

  final int index;
  final Cluster cluster;
  final bool isActiveCluster;
  final bool isSortable;
  final void Function()? onTap;
  final void Function()? onLongPress;

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
        timeout: 5,
      ).checkHealth();
      Logger.log(
        'SettingsClusterItem getClusterStatus',
        'Cluster Status',
        result,
      );
      setState(() {
        statusOk = result;
      });
    } catch (err) {
      Logger.log(
        'SettingsClusterItem getClusterStatus',
        'Failed to Get Cluster Status',
        err,
      );
      setState(() {
        statusOk = false;
      });
    }
  }

  /// [_buildIcon] returns an icon widget, which indicates the status of the
  /// cluster. If the [sort] argument is `true`, we return a drag handle icon,
  /// which can be used to reorder the clusters.
  Widget _buildIcon() {
    if (widget.isSortable) {
      return ReorderableDragStartListener(
        index: widget.index,
        child: Icon(
          Icons.drag_handle,
          color: Theme.of(context)
              .extension<CustomColors>()!
              .textPrimary
              .withOpacity(Constants.opacityIcon),
        ),
      );
    }

    return Icon(
      widget.isActiveCluster
          ? Icons.radio_button_checked
          : Icons.radio_button_unchecked,
      size: 24,
      color: statusOk
          ? Theme.of(context).extension<CustomColors>()!.success
          : Theme.of(context).extension<CustomColors>()!.error,
    );
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
        bottom: Constants.spacingMiddle,
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      child: Slidable(
        key: Key(widget.cluster.id),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.4,
          children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                showModal(
                  context,
                  SettingsEditCluster(cluster: widget.cluster),
                );
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              icon: Icons.edit,
            ),
            SlidableAction(
              onPressed: (BuildContext context) async {
                ClustersRepository clustersRepository =
                    Provider.of<ClustersRepository>(
                  context,
                  listen: false,
                );
                BookmarksRepository bookmarksRepository =
                    Provider.of<BookmarksRepository>(
                  context,
                  listen: false,
                );

                try {
                  await clustersRepository.deleteCluster(widget.cluster.id);
                  await bookmarksRepository
                      .removeBookmarksForCluster(widget.cluster.id);
                  if (context.mounted) {
                    showSnackbar(
                      context,
                      'Cluster Deleted',
                      'The cluster ${widget.cluster.name} was deleted',
                    );
                  }
                } catch (err) {
                  if (context.mounted) {
                    showSnackbar(
                      context,
                      'Failed to Delete Cluster',
                      err.toString(),
                    );
                  }
                }
              },
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
              icon: Icons.delete,
            ),
          ],
        ),
        child: AppListItem(
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
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
                              .replaceAll(
                                Characters(''),
                                Characters('\u{200B}'),
                              )
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
                  _buildIcon(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
