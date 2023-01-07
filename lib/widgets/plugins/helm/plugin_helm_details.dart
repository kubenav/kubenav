import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/plugins/helm.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details_template.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details_values.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/shared/app_actions_header_widget.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

/// The [PluginHelmDetails] widget can be used to show the details of a Helm
/// release. Within the details it is also possible to view the values and
/// templates of a Helm release and to view the History of the Helm release.
class PluginHelmDetails extends StatefulWidget {
  const PluginHelmDetails({
    Key? key,
    required this.name,
    required this.namespace,
    required this.version,
  }) : super(key: key);

  final String name;
  final String namespace;
  final int version;

  @override
  State<PluginHelmDetails> createState() => _PluginHelmDetailsState();
}

class _PluginHelmDetailsState extends State<PluginHelmDetails> {
  late Future<Release> _futureFetchHelmRelease;
  late Future<List<Release>> _futureFetchHistory;

  /// [_fetchHelmRelease] fetches the Helm release for the provided
  /// [widget.name], [widget.namespace] and [widget.version].
  Future<Release> _fetchHelmRelease() async {
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

    return await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).helmGetChart(widget.namespace, widget.name, widget.version);
  }

  /// [_fetchHistory] fetches the history for the Helm releases provided via the
  /// [widget.name] and [widget.namespace] arguments.
  Future<List<Release>> _fetchHistory() async {
    try {
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

      return await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).helmGetHistory(widget.namespace, widget.name);
    } catch (err) {
      return [];
    }
  }

  /// [buildDetails] builds the widget with the details of the Helm release. If
  /// we were not able to load the release an empty container is returned.
  Widget buildDetails(Release? release) {
    if (release != null) {
      return DetailsItemWidget(
        title: 'Details',
        details: [
          DetailsItemModel(
            name: 'Name',
            values: release.name,
          ),
          DetailsItemModel(
            name: 'Namespace',
            values: release.namespace,
          ),
          DetailsItemModel(
            name: 'Version',
            values: release.version,
          ),
          DetailsItemModel(
            name: 'Staus',
            values: release.info?.status,
          ),
          DetailsItemModel(
            name: 'Description',
            values: release.info?.description,
          ),
          DetailsItemModel(
            name: 'First Deployed',
            values:
                formatTime(DateTime.parse(release.info?.firstDeployed ?? '')),
          ),
          DetailsItemModel(
            name: 'Last Deployed',
            values:
                formatTime(DateTime.parse(release.info?.lastDeployed ?? '')),
          ),
          DetailsItemModel(
            name: 'Notes',
            values: release.info?.notes,
          ),
        ],
      );
    }

    return Container();
  }

  /// [buildTemplates] builds a list for all templates used by the Helm release.
  /// When the user clicks on one of the templates, the template will be opened
  /// in a modal bottom sheet.
  Widget buildTemplates(BuildContext context, Release? release) {
    if (release != null &&
        release.chart != null &&
        release.chart!.templates != null) {
      return AppVertialListSimpleWidget(
        title: 'Templates',
        items: release.chart!.templates!
            .map(
              (template) => AppVertialListSimpleModel(
                onTap: () {
                  showModal(
                    context,
                    PluginHelmDetailsTemplate(
                      name: widget.name,
                      template: template.data != null
                          ? utf8.decode(base64.decode(template.data!))
                          : '',
                    ),
                  );
                },
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Characters(template.name ?? '')
                              .replaceAll(
                                  Characters(''), Characters('\u{200B}'))
                              .toString(),
                          style: primaryTextStyle(
                            context,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      );
    }

    return Container();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchHelmRelease = _fetchHelmRelease();
      _futureFetchHistory = _fetchHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              Characters('${widget.name} v${widget.version}')
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
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _futureFetchHelmRelease,
              builder: (
                BuildContext context,
                AsyncSnapshot<Release> snapshot,
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
                                message: 'Could not load Helm chart',
                                details: snapshot.error.toString(),
                                icon: 'assets/plugins/image108x108/helm.png',
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        AppActionsHeaderWidget(
                          actions: [
                            AppActionsHeaderModel(
                              title: 'Values',
                              icon: Icons.description,
                              onTap: () {
                                showModal(
                                  context,
                                  PluginHelmDetailsValues(
                                    release: snapshot.data!,
                                  ),
                                );
                              },
                            ),
                            AppActionsHeaderModel(
                              title: 'Refresh',
                              icon: Icons.refresh,
                              onTap: () {
                                setState(() {
                                  _futureFetchHelmRelease = _fetchHelmRelease();
                                  _futureFetchHistory = _fetchHistory();
                                });
                              },
                            ),
                          ],
                        ),
                        buildDetails(snapshot.data),
                        const SizedBox(height: Constants.spacingMiddle),
                        FutureBuilder(
                          future: _futureFetchHistory,
                          builder: (
                            BuildContext context,
                            AsyncSnapshot<List<Release>> snapshot,
                          ) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(
                                        Constants.spacingMiddle,
                                      ),
                                      child: CircularProgressIndicator(
                                        color: theme(context).colorPrimary,
                                      ),
                                    ),
                                  ],
                                );
                              default:
                                return AppVertialListSimpleWidget(
                                  title: 'History',
                                  items: (snapshot.data ?? [])
                                      .map(
                                        (release) => AppVertialListSimpleModel(
                                          onTap: () {
                                            navigate(
                                              context,
                                              PluginHelmDetails(
                                                name: widget.name,
                                                namespace: widget.namespace,
                                                version: release.version!,
                                              ),
                                            );
                                          },
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Characters(
                                                            'Revision: ${release.version ?? ''}')
                                                        .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                                '\u{200B}'))
                                                        .toString(),
                                                    style: primaryTextStyle(
                                                      context,
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    Characters(
                                                            'Updated: ${formatTime(DateTime.parse(release.info?.lastDeployed ?? ''))}')
                                                        .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                                '\u{200B}'))
                                                        .toString(),
                                                    style: secondaryTextStyle(
                                                      context,
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    Characters(
                                                            'Status: ${release.info?.status}')
                                                        .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                                '\u{200B}'))
                                                        .toString(),
                                                    style: secondaryTextStyle(
                                                      context,
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    Characters(
                                                            'Chart: ${release.chart?.metadata?.version}')
                                                        .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                                '\u{200B}'))
                                                        .toString(),
                                                    style: secondaryTextStyle(
                                                      context,
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    Characters(
                                                            'Chart: ${release.chart?.metadata?.appVersion}')
                                                        .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                                '\u{200B}'))
                                                        .toString(),
                                                    style: secondaryTextStyle(
                                                      context,
                                                    ),
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                );
                            }
                          },
                        ),
                        const SizedBox(height: Constants.spacingMiddle),
                        buildTemplates(
                          context,
                          snapshot.data,
                        ),
                        const SizedBox(height: Constants.spacingExtraLarge),
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
