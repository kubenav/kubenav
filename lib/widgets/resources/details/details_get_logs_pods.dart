import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_list.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/details/details_get_logs.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [DetailsGetLogsPods] widget can be used to get a list of all Pods for a
/// Deployment, DaemonSet or StatefulSet, where the user can then select the
/// Pods for which he wants to view the logs.
class DetailsGetLogsPods extends StatefulWidget {
  const DetailsGetLogsPods({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
  });

  final String name;
  final String namespace;
  final dynamic item;

  @override
  State<DetailsGetLogsPods> createState() => _DetailsGetLogsPodsState();
}

class _DetailsGetLogsPodsState extends State<DetailsGetLogsPods> {
  bool _isLoading = false;
  String _error = '';
  List<IoK8sApiCoreV1Pod> _pods = <IoK8sApiCoreV1Pod>[];
  List<IoK8sApiCoreV1Pod> _selectedPods = <IoK8sApiCoreV1Pod>[];
  dynamic _podSpec;

  /// [_getPods] gets all Pods for the provided Deployment, DaemonSet or
  /// StatefulSet.
  Future<void> _getPods() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      final result = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).getRequest(
        '/api/v1/namespaces/${widget.namespace}/pods?${getSelector(IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(widget.item['spec']['selector']))}',
      );

      final data = json.decode(result);

      setState(() {
        _isLoading = false;
        _pods = IoK8sApiCoreV1PodList.fromJson(data)!.items;
        if (data['items'].isNotEmpty) {
          _podSpec = data['items'][0];
        }
      });
    } catch (err) {
      Logger.log(
        'DetailsGetLogsPods _getPods',
        'Could not get pods',
        err,
      );
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_buildContent] shows a loading indicator, when we execute the API call to
  /// get the clusters. When the API call returns an error we display an error
  /// widget. If the API returns a list of clusters, we show a list of clusters,
  /// which can be selected by the user to add them to the app.
  Widget _buildContent() {
    if (_isLoading) {
      return CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      );
    }

    if (_error != '') {
      return AppErrorWidget(
        message: 'Could not load Pods',
        details: _error,
        icon: ClusterProviderType.google.icon(),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      separatorBuilder: (context, index) {
        return const SizedBox(height: Constants.spacingMiddle);
      },
      itemCount: _pods.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).extension<CustomColors>()!.shadow,
                blurRadius: Constants.sizeBorderBlurRadius,
                spreadRadius: Constants.sizeBorderSpreadRadius,
                offset: const Offset(0.0, 0.0),
              ),
            ],
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.sizeBorderRadius),
            ),
          ),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _selectedPods
                    .where(
                      (p) => p.metadata?.name == _pods[index].metadata?.name,
                    )
                    .toList()
                    .length ==
                1,
            onChanged: (bool? value) {
              if (value == true) {
                setState(() {
                  _selectedPods.add(_pods[index]);
                });
              }
              if (value == false) {
                setState(() {
                  _selectedPods = _selectedPods
                      .where(
                        (p) => p.metadata?.name != _pods[index].metadata?.name,
                      )
                      .toList();
                });
              }
            },
            title: Text(
              Characters(
                _pods[index].metadata?.name ?? '',
              ).replaceAll(Characters(''), Characters('\u{200B}')).toString(),
              style: noramlTextStyle(
                context,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getPods();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Select Pods',
      subtitle: '${widget.name}/${widget.namespace}',
      icon: 'assets/resources/${Resources.map['pods']?.resource}.svg',
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Get Logs',
      actionPressed: () {
        Navigator.pop(context);
        if (_selectedPods.isNotEmpty && _podSpec != null) {
          showModal(
            context,
            DetailsGetLogs(
              names: _selectedPods
                  .map((e) => e.metadata?.name ?? '')
                  .toList()
                  .join(','),
              namespace: widget.namespace,
              item: _podSpec,
            ),
          );
        }
      },
      actionIsLoading: _isLoading,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: _buildContent(),
        ),
      ),
    );
  }
}
