import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_list.dart';
import 'package:kubenav/widgets/plugins/prometheus/plugin_prometheus_list.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_no_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

class Plugins extends StatelessWidget {
  const Plugins({super.key});

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
      const SizedBox(height: Constants.spacingSmall),
      AppVertialListSimpleWidget(
        title: 'Plugins',
        items: [
          AppVertialListSimpleModel(
            onTap: () {
              navigate(context, const PluginHelmList());
            },
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
                child: SvgPicture.asset('assets/plugins/helm.svg'),
              ),
              const SizedBox(width: Constants.spacingSmall),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Helm',
                      style: primaryTextStyle(
                        context,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'The package manager for Kubernetes',
                      style: secondaryTextStyle(
                        context,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Constants.spacingSmall),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context)
                    .extension<CustomColors>()!
                    .textSecondary
                    .withOpacity(Constants.opacityIcon),
                size: 24,
              ),
            ],
          ),
          AppVertialListSimpleModel(
            onTap: () {
              navigate(context, const PluginPrometheusList());
            },
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
                padding: const EdgeInsets.all(Constants.spacingIcon54x54),
                child: SvgPicture.asset('assets/plugins/prometheus.svg'),
              ),
              const SizedBox(width: Constants.spacingSmall),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prometheus',
                      style: primaryTextStyle(
                        context,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'From metrics to insight: Power your metrics and alerting with the leading open-source monitoring solution.',
                      style: secondaryTextStyle(
                        context,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Constants.spacingSmall),
              Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context)
                    .extension<CustomColors>()!
                    .textSecondary
                    .withOpacity(Constants.opacityIcon),
                size: 24,
              ),
            ],
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppRepository>(
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
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            const Text(
              'Plugins',
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
            children: buildContent(context),
          ),
        ),
      ),
    );
  }
}
