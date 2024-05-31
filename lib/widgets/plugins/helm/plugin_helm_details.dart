import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/plugins/helm.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details_manifest.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details_rollback.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details_template.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details_uninstall.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details_values.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

/// [helmDetailsActions] returns the resource actions for the details of an
/// Helm chart.
List<AppResourceActionsModel> helmDetailsActions(
  BuildContext context,
  Release release,
  void Function()? refresh,
) {
  final actions = [
    AppResourceActionsModel(
      title: 'Values',
      icon: Icons.description,
      onTap: () {
        showModal(
          context,
          PluginHelmDetailsValues(
            title: 'Values',
            name: release.name ?? '',
            values: release.config,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Default Values',
      icon: Icons.description,
      onTap: () {
        showModal(
          context,
          PluginHelmDetailsValues(
            title: 'Default Values',
            name: release.name ?? '',
            values: release.chart?.values,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Manifest',
      icon: Icons.description,
      onTap: () {
        showModal(
          context,
          PluginHelmDetailsManifest(
            name: release.name ?? '',
            manifest: release.manifest ?? '',
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Rollback',
      icon: Icons.history,
      onTap: () {
        showModal(
          context,
          PluginHelmDetailsRollback(
            namespace: release.namespace ?? '',
            name: release.name ?? '',
            version: release.version ?? 0,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Uninstall',
      icon: Icons.delete,
      onTap: () {
        showModal(
          context,
          PluginHelmDetailsUninstall(
            namespace: release.namespace ?? '',
            name: release.name ?? '',
          ),
        );
      },
    ),
  ];

  if (refresh != null) {
    actions.add(
      AppResourceActionsModel(
        title: 'Refresh',
        icon: Icons.refresh,
        onTap: refresh,
      ),
    );
  }

  return actions;
}

/// The [PluginHelmDetails] widget can be used to show the details of a Helm
/// release. Within the details it is also possible to view the values and
/// templates of a Helm release and to view the History of the Helm release.
class PluginHelmDetails extends StatefulWidget {
  const PluginHelmDetails({
    super.key,
    required this.name,
    required this.namespace,
    required this.version,
  });

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
    ).helmGetRelease(widget.namespace, widget.name, widget.version);
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
      ).helmListReleaseHistory(widget.namespace, widget.name);
    } catch (err) {
      return [];
    }
  }

  /// [_buildTemplates] builds a list for all templates used by the Helm
  /// release. When the user clicks on one of the templates, the template will
  /// be opened in a modal bottom sheet.
  Widget _buildTemplates(Release release) {
    if (release.chart != null && release.chart!.templates != null) {
      return AppVerticalListSimpleWidget(
        title: 'Templates',
        items: release.chart!.templates!
            .map(
              (template) => AppVerticalListSimpleModel(
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
                                Characters(''),
                                Characters('\u{200B}'),
                              )
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
    Provider.of<AppRepository>(
      context,
      listen: false,
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
      body: SafeArea(
        child: SingleChildScrollView(
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
                            padding: const EdgeInsets.all(
                              Constants.spacingMiddle,
                            ),
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      );
                    default:
                      final release = snapshot.data;

                      if (snapshot.hasError || release == null) {
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
                                  message: 'Failed to Load Helm Release',
                                  details: snapshot.error.toString(),
                                  icon: 'assets/plugins/helm.svg',
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          AppResourceActions(
                            mode: AppResourceActionsMode.header,
                            actions: helmDetailsActions(
                              context,
                              release,
                              () {
                                setState(() {
                                  _futureFetchHelmRelease = _fetchHelmRelease();
                                  _futureFetchHistory = _fetchHistory();
                                });
                              },
                            ),
                          ),
                          DetailsItem(
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
                                values: release.info?.firstDeployed != null
                                    ? formatTime(
                                        DateTime.parse(
                                          release.info!.firstDeployed!,
                                        ),
                                      )
                                    : null,
                              ),
                              DetailsItemModel(
                                name: 'Last Deployed',
                                values: release.info?.lastDeployed != null
                                    ? formatTime(
                                        DateTime.parse(
                                          release.info!.lastDeployed!,
                                        ),
                                      )
                                    : null,
                              ),
                              DetailsItemModel(
                                name: 'Notes',
                                values: release.info?.notes,
                              ),
                            ],
                          ),
                          const SizedBox(height: Constants.spacingMiddle),
                          FutureBuilder(
                            future: _futureFetchHistory,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<List<Release>> snapshot,
                            ) {
                              if (snapshot.data == null ||
                                  snapshot.data!.isEmpty) {
                                return Container();
                              }

                              return Column(
                                children: [
                                  AppVerticalListSimpleWidget(
                                    title: 'History',
                                    items: (snapshot.data ?? [])
                                        .map(
                                          (release) =>
                                              AppVerticalListSimpleModel(
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
                                                        'Revision: ${release.version ?? ''}',
                                                      )
                                                          .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                              '\u{200B}',
                                                            ),
                                                          )
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
                                                        'Updated: ${formatTime(DateTime.parse(release.info?.lastDeployed ?? '-'))}',
                                                      )
                                                          .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                              '\u{200B}',
                                                            ),
                                                          )
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
                                                        'Status: ${release.info?.status ?? '-'}',
                                                      )
                                                          .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                              '\u{200B}',
                                                            ),
                                                          )
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
                                                        'Chart Version: ${release.chart?.metadata?.version ?? '-'}',
                                                      )
                                                          .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                              '\u{200B}',
                                                            ),
                                                          )
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
                                                        'App Version: ${release.chart?.metadata?.appVersion ?? '-'}',
                                                      )
                                                          .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                              '\u{200B}',
                                                            ),
                                                          )
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
                                              Wrap(
                                                children: [
                                                  const SizedBox(
                                                    width:
                                                        Constants.spacingSmall,
                                                  ),
                                                  Icon(
                                                    Icons.radio_button_checked,
                                                    size: 24,
                                                    color: release.info
                                                                    ?.status ==
                                                                'deployed' ||
                                                            release.info
                                                                    ?.status ==
                                                                'superseded' ||
                                                            release.info
                                                                    ?.status ==
                                                                'uninstalled'
                                                        ? Theme.of(context)
                                                            .extension<
                                                                CustomColors>()!
                                                            .success
                                                        : release.info
                                                                    ?.status ==
                                                                'failed'
                                                            ? Theme.of(context)
                                                                .extension<
                                                                    CustomColors>()!
                                                                .error
                                                            : Theme.of(context)
                                                                .extension<
                                                                    CustomColors>()!
                                                                .warning,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(
                                    height: Constants.spacingMiddle,
                                  ),
                                ],
                              );
                            },
                          ),
                          _buildTemplates(release),
                          const SizedBox(height: Constants.spacingMiddle),
                        ],
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
