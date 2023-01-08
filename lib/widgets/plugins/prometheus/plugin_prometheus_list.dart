import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map_list.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/prometheus/plugin_prometheus_details.dart';
import 'package:kubenav/widgets/shared/app_actions_header_widget.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_namespaces_widget.dart';

/// The [PluginPrometheusList] widget is used to render a list of Prometheus
/// dashboards, which can be created by users via ConfigMaps with a
/// `kubenav.io/prometheus=dashboard` label. If a user then clicks on a
/// dashboard he will be redirected to the corresponding details page of the
/// dashboard.
class PluginPrometheusList extends StatefulWidget {
  const PluginPrometheusList({super.key});

  @override
  State<PluginPrometheusList> createState() => _PluginPrometheusListState();
}

class _PluginPrometheusListState extends State<PluginPrometheusList> {
  late Future<List<IoK8sApiCoreV1ConfigMap>> _futureFetchDashboards;

  /// [_fetchDashboards] fetches all Prometheus dashboards. Prometheus
  /// dashboards can be created via ConfigMaps and the
  /// "kubenav.io/prometheus=dashboard" label.
  Future<List<IoK8sApiCoreV1ConfigMap>> _fetchDashboards() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    final cluster = await clustersRepository.getClusterWithCredentials(
      clustersRepository.activeClusterId,
    );

    final url =
        '/api/v1${cluster!.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/configmaps?labelSelector=kubenav.io/prometheus=dashboard';

    final result = await KubernetesService(
      cluster: cluster,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    final configMapsList = IoK8sApiCoreV1ConfigMapList.fromJson(result);

    Logger.log(
      'PluginPrometheusListRepository fetchDashboards',
      '${configMapsList?.items.length} ConfigMaps were returned',
    );

    final List<IoK8sApiCoreV1ConfigMap> configMaps = [];
    if (configMapsList != null && configMapsList.items.isNotEmpty) {
      for (var item in configMapsList.items) {
        configMaps.add(item);
      }
    }

    return configMaps;
  }

  /// [buildItem] returns the widget for a single dashboard which is displayed
  /// in the list of dashboards.
  Widget buildItem(BuildContext context, IoK8sApiCoreV1ConfigMap configMap) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
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
          navigate(
            context,
            PluginPrometheusDetails(
              namespace: configMap.metadata?.namespace ?? '',
              name: configMap.metadata?.name ?? '',
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Characters(configMap.metadata?.name ?? '')
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle(
                      context,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Characters(
                          'Namespace: ${configMap.metadata?.namespace ?? ''}',
                        )
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                      Text(
                        Characters(
                          'Description: ${configMap.data.containsKey('description') ? configMap.data['description'] : ''}',
                        )
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchDashboards = _fetchDashboards();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.namespaces),
            onPressed: () {
              showModal(context, const AppNamespacesWidget());
            },
          ),
        ],
        title: Column(
          children: [
            Text(
              Characters('Prometheus Dashboards')
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              Characters(clustersRepository
                              .getCluster(
                                clustersRepository.activeClusterId,
                              )!
                              .namespace ==
                          ''
                      ? 'All Namespaces'
                      : clustersRepository
                          .getCluster(
                            clustersRepository.activeClusterId,
                          )!
                          .namespace)
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _futureFetchDashboards,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<IoK8sApiCoreV1ConfigMap>> snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.all(Constants.spacingMiddle),
                          child: CircularProgressIndicator(
                            color: theme(context).colorPrimary,
                          ),
                        ),
                      ],
                    );
                  default:
                    if (snapshot.hasError) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                Constants.spacingMiddle,
                              ),
                              child: AppErrorWidget(
                                message: 'Could not load dashboards',
                                details: snapshot.error.toString(),
                                icon: 'assets/plugins/prometheus.svg',
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return Wrap(
                      children: [
                        AppActionsHeaderWidget(
                          actions: [
                            AppActionsHeaderModel(
                              title: 'Refresh',
                              icon: Icons.refresh,
                              onTap: () {
                                setState(() {
                                  _futureFetchDashboards = _fetchDashboards();
                                });
                              },
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: Constants.spacingMiddle,
                            bottom: Constants.spacingMiddle,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              right: Constants.spacingMiddle,
                              left: Constants.spacingMiddle,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return buildItem(
                                context,
                                snapshot.data![index],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
