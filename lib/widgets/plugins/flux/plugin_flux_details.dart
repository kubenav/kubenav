import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/resource.dart' show Resources;
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details_reconcile.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details_resume.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details_suspend.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/details/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/details/details_show_yaml.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// [fluxDetailsActions] returns the resource actions for the details of a Flux
/// resource.
List<AppResourceActionsModel> fluxDetailsActions(
  BuildContext context,
  FluxResource resource,
  Map<String, dynamic> item,
  List<AppResourceActionsModel> additionalActions,
) {
  AppRepository appRepository = Provider.of<AppRepository>(
    context,
    listen: false,
  );

  return [
    AppResourceActionsModel(
      title: appRepository.settings.editorFormat == 'json' ? 'Json' : 'Yaml',
      icon: Icons.description,
      onTap: () {
        showModal(
          context,
          DetailsShowYaml(
            item: item,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Suspend',
      icon: Icons.pause,
      onTap: () {
        showModal(
          context,
          PluginFluxDetailsSuspend(
            resource: resource,
            namespace: item['metadata']['namespace'],
            name: item['metadata']['name'],
            item: item,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Resume',
      icon: Icons.play_arrow,
      onTap: () {
        showModal(
          context,
          PluginFluxDetailsResume(
            resource: resource,
            namespace: item['metadata']['namespace'],
            name: item['metadata']['name'],
            item: item,
          ),
        );
      },
    ),
    AppResourceActionsModel(
      title: 'Reconcile',
      icon: Icons.restart_alt,
      onTap: () {
        showModal(
          context,
          PluginFluxDetailsReconcile(
            resource: resource,
            namespace: item['metadata']['namespace'],
            name: item['metadata']['name'],
            item: item,
          ),
        );
      },
    ),
    ...additionalActions,
  ];
}

/// [PluginFluxDetails] is responsible for showing the details of a Flux
/// resource. This includes the metadata, conditions, events and the details
/// of the resource itself.
class PluginFluxDetails extends StatefulWidget {
  const PluginFluxDetails({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
  });

  final String name;
  final String namespace;
  final FluxResource resource;

  @override
  State<PluginFluxDetails> createState() => _PluginFluxDetailsState();
}

class _PluginFluxDetailsState extends State<PluginFluxDetails> {
  late Future<Map<String, dynamic>> _futureFetchResource;

  /// [_fetchResource] fetches the item for the prvided [widget.resource]
  /// with the given [widget.name] and [widget.namespace].
  Future<Map<String, dynamic>> _fetchResource() async {
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
        '${widget.resource.api.path}/namespaces/${widget.namespace}/${widget.resource.api.resource}/${widget.name}';

    final result = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(url);
    return json.decode(result);
  }

  /// [_buildDetails] is responsible for showing the correct details item for
  /// the selected resource.
  List<Widget> _buildDetails(
    FluxResource resource,
    Map<String, dynamic> item,
  ) {
    final details = resource.buildDetails(context, item);

    return List.generate(
      details.length,
      (index) {
        final detail = details[index];
        return [
          DetailsItemWidget(
            title: detail.title,
            details: List.generate(
              detail.data.length,
              (index) {
                return DetailsItemModel(
                  name: detail.data[index].key,
                  values: detail.data[index].value,
                  onTap: detail.data[index].onTap,
                );
              },
            ),
          ),
          const SizedBox(height: Constants.spacingMiddle),
        ];
      },
    ).flattened.toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchResource = _fetchResource();
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
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: _futureFetchResource,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot,
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
                      final item = snapshot.data;

                      if (snapshot.hasError || item == null) {
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
                                  message:
                                      'Could not load ${widget.resource.singular}',
                                  details: snapshot.error.toString(),
                                  icon: 'assets/plugins/flux.svg',
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
                            actions: fluxDetailsActions(
                              context,
                              widget.resource,
                              item,
                              [
                                AppResourceActionsModel(
                                  title: 'Refresh',
                                  icon: Icons.refresh,
                                  onTap: () {
                                    setState(() {
                                      _futureFetchResource = _fetchResource();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          DetailsItemMetadata(
                            item: snapshot.data,
                          ),
                          DetailsItemConditions(
                            item: snapshot.data,
                          ),
                          const SizedBox(height: Constants.spacingMiddle),
                          ..._buildDetails(
                            widget.resource,
                            snapshot.data!,
                          ),
                          DetailsResourcesPreview(
                            title: Resources.map['events']!.title,
                            resource: Resources.map['events']!.resource,
                            path: Resources.map['events']!.path,
                            scope: Resources.map['events']!.scope,
                            additionalPrinterColumns: Resources
                                .map['events']!.additionalPrinterColumns,
                            namespace: widget.namespace,
                            selector:
                                'fieldSelector=involvedObject.name=${widget.name}',
                          ),
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
