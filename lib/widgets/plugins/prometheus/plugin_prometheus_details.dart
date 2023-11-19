import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_drawer.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

/// The [PluginPrometheusDetails] widget lists all charts of a single Prometheus
/// dashboard. The dashboard is identified by it's [namespace] and [name]. The
/// charts are then rendered via our global [AppPrometheusChartsWidget] which is
/// also used to render the list of charts for our Kubernetes resources.
class PluginPrometheusDetails extends StatefulWidget {
  const PluginPrometheusDetails({
    super.key,
    required this.namespace,
    required this.name,
  });

  final String namespace;
  final String name;

  @override
  State<PluginPrometheusDetails> createState() =>
      _PluginPrometheusDetailsState();
}

class _PluginPrometheusDetailsState extends State<PluginPrometheusDetails> {
  late Future<List<Chart>> _futureFetchDashboard;

  /// [_fetchDashboard] fetches the Prometheus dashboad (ConfigMap) with the
  /// provided [widget.name] and [widget.namespace] and returns all the charts
  /// from the dashboard, so that they can be passed to the
  /// [AppPrometheusChartsWidget] widget.
  Future<List<Chart>> _fetchDashboard() async {
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
        '/api/v1/namespaces/${widget.namespace}/configmaps/${widget.name}';

    final result = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);

    final configMap = IoK8sApiCoreV1ConfigMap.fromJson(result);

    if (configMap != null &&
        configMap.metadata != null &&
        configMap.metadata!.name != null) {
      Logger.log(
        'PluginPrometheusDetailsRepository _fetchDashboard',
        'ConfigMap  ${configMap.metadata?.name} was returned',
        configMap,
      );

      if (configMap.data.containsKey('charts')) {
        final parsedCharts = loadYaml(configMap.data['charts']!);

        Logger.log(
          'PluginPrometheusDetailsRepository _fetchDashboard',
          'Charts were loaded from ConfigMap ${configMap.metadata?.name}',
          parsedCharts,
        );

        final List<Chart> charts = [];
        for (var parsedChart in parsedCharts as List<dynamic>) {
          charts.add(Chart.fromYaml(parsedChart));
        }
        return charts;
      }
    }

    return [];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchDashboard = _fetchDashboard();
    });
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
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      drawer: appRepository.settings.classicMode ? const AppDrawer() : null,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              Characters(widget.name)
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
              Characters(widget.namespace)
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
      bottomNavigationBar: appRepository.settings.classicMode
          ? null
          : const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: _futureFetchDashboard,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<Chart>> snapshot,
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
                                  message: 'Could not load dashboard',
                                  details: snapshot.error.toString(),
                                  icon: 'assets/plugins/prometheus.svg',
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return AppPrometheusChartsWidget(
                        manifest: const {},
                        defaultCharts: snapshot.data!,
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
