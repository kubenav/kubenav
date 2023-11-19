import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/home/overview/overview_actions.dart';
import 'package:kubenav/widgets/home/overview/overview_events.dart';
import 'package:kubenav/widgets/home/overview/overview_metrics.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_drawer.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_no_clusters_widget.dart';

class HomeOverview extends StatelessWidget {
  const HomeOverview({super.key});

  List<Widget> _buildContent(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
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

    if (appRepository.settings.classicMode) {
      return [
        const OverviewMetrics(
          nodeName: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        const OverviewEvents(),
        const SizedBox(height: Constants.spacingSmall),
      ];
    }

    return [
      const OverviewActions(),
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
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );
    final activeCluster = clustersRepository.getCluster(
      clustersRepository.activeClusterId,
    );

    return Scaffold(
      drawer: appRepository.settings.classicMode ? const AppDrawer() : null,
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
          leading: appRepository.settings.classicMode
              ? null
              : const Padding(
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
      bottomNavigationBar: appRepository.settings.classicMode
          ? null
          : const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: _buildContent(context),
          ),
        ),
      ),
    );
  }
}
