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
import 'package:kubenav/widgets/plugins/argo/plugin_argo.dart';
import 'package:kubenav/widgets/plugins/cert-manager/plugin_cert_manager.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_list.dart';
import 'package:kubenav/widgets/plugins/prometheus/plugin_prometheus_list.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_no_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

class Plugin {
  String title;
  String description;
  String icon;
  Widget widget;

  Plugin({
    required this.title,
    required this.description,
    required this.icon,
    required this.widget,
  });
}

final _plugins = [
  Plugin(
    title: 'Argo',
    description: 'Declarative GitOps CD for Kubernetes',
    icon: 'assets/plugins/argo.svg',
    widget: const PluginArgo(),
  ),
  Plugin(
    title: 'cert-manager',
    description:
        'cert-manager is a powerful and extensible X.509 certificate controller for Kubernetes and OpenShift workloads',
    icon: 'assets/plugins/cert-manager.svg',
    widget: const PluginCertManager(),
  ),
  Plugin(
    title: 'Flux',
    description: 'The GitOps family of projects',
    icon: 'assets/plugins/flux.svg',
    widget: const PluginFlux(),
  ),
  Plugin(
    title: 'Helm',
    description: 'The package manager for Kubernetes',
    icon: 'assets/plugins/helm.svg',
    widget: const PluginHelmList(),
  ),
  Plugin(
    title: 'Prometheus',
    description:
        'From metrics to insight: Power your metrics and alerting with the leading open-source monitoring solution',
    icon: 'assets/plugins/prometheus.svg',
    widget: const PluginPrometheusList(),
  ),
];

class Plugins extends StatelessWidget {
  const Plugins({super.key});

  List<Widget> buildContent(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
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

    return [
      AppVerticalListSimpleWidget(
        title: 'Plugins',
        items: List.generate(
          _plugins.length,
          (index) {
            return AppVerticalListSimpleModel(
              onTap: () {
                navigate(context, _plugins[index].widget);
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
                  child: SvgPicture.asset(_plugins[index].icon),
                ),
                const SizedBox(width: Constants.spacingSmall),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _plugins[index].title,
                        style: primaryTextStyle(
                          context,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _plugins[index].description,
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
            );
          },
        ),
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
