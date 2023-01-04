import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/home/overview/overview_events.dart';
import 'package:kubenav/widgets/home/overview/overview_metrics.dart';
import 'package:kubenav/widgets/plugins/plugins.dart';
import 'package:kubenav/widgets/resources/bookmarks/resources_bookmarks.dart';
import 'package:kubenav/widgets/resources/resources.dart';
import 'package:kubenav/widgets/settings/settings.dart';
import 'package:kubenav/widgets/settings/settings_clusters.dart';
import 'package:kubenav/widgets/shared/app_actions_header_widget.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_no_clusters_widget.dart';

class HomeOverview extends StatelessWidget {
  const HomeOverview({Key? key}) : super(key: key);

  List<Widget> buildContent(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    if (clustersRepository.clusters.isEmpty) {
      return [
        const SizedBox(height: Constants.spacingSmall),
        const AppNoClustersWidget(),
      ];
    }

    return [
      AppActionsHeaderWidget(
        actions: [
          AppActionsHeaderModel(
            title: 'Resources',
            icon: CustomIcons.kubernetes,
            onTap: () {
              navigate(
                context,
                const Resources(),
                Constants.pageIndexResources,
              );
            },
          ),
          AppActionsHeaderModel(
            title: 'Plugins',
            icon: Icons.extension,
            onTap: () {
              navigate(
                context,
                const Plugins(),
                Constants.pageIndexPlugins,
              );
            },
          ),
          AppActionsHeaderModel(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {
              navigate(
                context,
                const Settings(),
                Constants.pageIndexSettings,
              );
            },
          ),
          AppActionsHeaderModel(
            title: 'Clusters',
            icon: CustomIcons.clusters,
            onTap: () {
              navigate(
                context,
                const SettingsClusters(),
                Constants.pageIndexSettings,
              );
            },
          ),
          AppActionsHeaderModel(
            title: 'Bookmarks',
            icon: Icons.bookmark,
            onTap: () {
              navigate(
                context,
                const ResourcesBookmarks(),
                Constants.pageIndexResources,
              );
            },
          ),
          AppActionsHeaderModel(
            title: 'GitHub',
            icon: CustomIcons.github,
            onTap: () {
              openUrl('https://github.com/kubenav/kubenav');
            },
          ),
        ],
      ),
      const OverviewMetrics(
        nodeName: null,
      ),
      const SizedBox(height: Constants.spacingMiddle),
      const OverviewEvents(),
      const SizedBox(height: Constants.spacingSmall),
    ];
  }

  @override
  Widget build(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );
    final activeCluster = clustersRepository.getCluster(
      clustersRepository.activeClusterId,
    );

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(CustomIcons.clusters),
              onPressed: () {
                showModal(context, const AppClustersWidget());
              },
            ),
          ],
          leading: const Padding(
            padding: EdgeInsets.only(left: Constants.spacingMiddle),
            child: Icon(
              CustomIcons.kubenav,
              size: 42,
            ),
          ),
          title: Column(
            children: [
              const Text(
                'kubenav',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                Characters(activeCluster?.name ?? 'No Active Cluster')
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
          )),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: buildContent(context),
        ),
      ),
    );
  }
}
