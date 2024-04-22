import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/home/overview/overview_actions.dart';
import 'package:kubenav/widgets/home/overview/overview_events.dart';
import 'package:kubenav/widgets/home/overview/overview_metrics.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_no_clusters_widget.dart';

class HomeOverview extends StatelessWidget {
  const HomeOverview({super.key});

  List<Widget> _buildContent(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    if (clustersRepository.clusters.isEmpty) {
      return [
        const Padding(
          padding: EdgeInsets.all(Constants.spacingMiddle),
          child: AppNoClustersWidget(),
        ),
      ];
    }

    final List<Widget> content = [
      const OverviewActions(),
    ];

    if (appRepository.settings.home.showMetrics) {
      content.add(const OverviewMetrics(nodeName: null));
      content.add(const SizedBox(height: Constants.spacingMiddle));
    }

    if (appRepository.settings.home.showWarnings) {
      content.add(const OverviewEvents());
      content.add(const SizedBox(height: Constants.spacingMiddle));
    }

    return content;
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
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
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
