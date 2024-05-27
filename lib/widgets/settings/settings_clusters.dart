import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_kubeconfig.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_manual.dart';
import 'package:kubenav/widgets/settings/clusters/settings_cluster_actions.dart';
import 'package:kubenav/widgets/settings/clusters/settings_cluster_item.dart';
import 'package:kubenav/widgets/settings/clusters/settings_reuse_provider_config_actions.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_horizontal_list_cards_widget.dart';

/// The [SettingsClusters] widget displays a list of all our supported providers
/// to configure a cluster. When the user clicks on one of the providers he can
/// add a new cluster using the provider.
///
/// Below the list of providers we display the users added clusters. We also add
/// the status to each cluster item, so a user sees if we are able to reach the
/// cluster.
class SettingsClusters extends StatefulWidget {
  const SettingsClusters({super.key});

  @override
  State<SettingsClusters> createState() => _SettingsClustersState();
}

class _SettingsClustersState extends State<SettingsClusters> {
  bool isSortable = false;

  /// [_proxyDecorator] is used to highlight the bookmark which is currently
  /// draged by the user.
  Widget _proxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 16,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 24,
              color: Colors.transparent,
            ),
          ),
          child,
        ],
      ),
    );
  }

  /// [_showAddClusterBottomSheet] shows a bottom sheed to add a new cluster.
  /// If the user selected the Kubeconfig or the manual option to add the
  /// cluster the add cluster modal bottom sheet is shown. If the user selected
  /// another provider we show him some option to use an existing provider
  /// configuration or to add a new one.
  void _showAddClusterBottomSheet(
    BuildContext context,
    ClusterProviderType clusterProviderType,
  ) {
    switch (clusterProviderType) {
      case ClusterProviderType.manual:
        showModal(
          context,
          const SettingsAddClusterManual(),
        );
        break;
      case ClusterProviderType.kubeconfig:
        showModal(
          context,
          const SettingsAddClusterKubeconfig(),
        );
        break;
      default:
        showActions(
          context,
          SettingsReuseProviderActions(
            providerType: clusterProviderType,
          ),
        );
        break;
    }
  }

  /// [buildProviders] is used to display a list with all providers. When the
  /// user clicks on one of the shown providers, we display a modal bottom
  /// sheet, which can be used to add a cluster using the selected provider.
  Widget buildProviders(BuildContext context) {
    return AppHorizontalListCardsWidget(
      title: 'Add Cluster',
      cards: List.generate(
        ClusterProviderType.values.length,
        (index) => AppHorizontalListCardsModel(
          title: ClusterProviderType.values[index].title(),
          subtitle: [ClusterProviderType.values[index].subtitle()],
          image: ClusterProviderType.values[index].icon(),
          onTap: () {
            _showAddClusterBottomSheet(
              context,
              ClusterProviderType.values[index],
            );
          },
        ),
      ),
    );
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
        title: const Text('Clusters'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildProviders(context),

              Padding(
                padding: const EdgeInsets.only(
                  top: Constants.spacingExtraLarge,
                  bottom: Constants.spacingMiddle,
                  left: Constants.spacingMiddle,
                  right: Constants.spacingMiddle,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Clusters',
                        style: primaryTextStyle(context, size: 18),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSortable = !isSortable;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.sort,
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                          ),
                          const SizedBox(width: Constants.spacingExtraSmall),
                          Text(
                            'Sort',
                            style: secondaryTextStyle(
                              context,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Display a list of all the users added clusters. The clusters are
              /// diplayed using the [SettingsClusterItem] widget, which also
              /// indicates the status of the current cluster. The list can also
              /// be used to reorder the clusters.
              ReorderableListView.builder(
                shrinkWrap: true,
                buildDefaultDragHandles: false,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (int start, int current) {
                  clustersRepository.reorderClusters(start, current);
                },
                proxyDecorator: (
                  Widget child,
                  int index,
                  Animation<double> animation,
                ) {
                  return _proxyDecorator(child, index, animation);
                },
                itemCount: clustersRepository.clusters.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return Container(
                    key: Key(
                      clustersRepository.clusters[index].id,
                    ),
                    child: SettingsClusterItem(
                      key: Key(clustersRepository.clusters[index].id),
                      index: index,
                      cluster: clustersRepository.clusters[index],
                      isActiveCluster: clustersRepository.clusters[index].id ==
                          clustersRepository.activeClusterId,
                      isSortable: isSortable,
                      onTap: isSortable
                          ? null
                          : () {
                              clustersRepository.setActiveCluster(
                                clustersRepository.clusters[index].id,
                              );
                            },
                      onLongPress: isSortable
                          ? null
                          : () {
                              hapticFeedback();

                              showActions(
                                context,
                                SettingsClusterActions(
                                  cluster: clustersRepository.clusters[index],
                                ),
                              );
                            },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
