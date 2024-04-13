import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/rancher_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

class SettingsAddClusterRancher extends StatefulWidget {
  const SettingsAddClusterRancher({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  @override
  State<SettingsAddClusterRancher> createState() =>
      _SettingsAddClusterRancherState();
}

class _SettingsAddClusterRancherState extends State<SettingsAddClusterRancher> {
  bool _isLoadingAddCluster = false;
  bool _isLoading = false;
  String _error = '';
  List<RancherCluster> _clusters = <RancherCluster>[];
  List<RancherCluster> _selectedClusters = <RancherCluster>[];

  /// [_getClusters] returns a list of [_clusters] from the Rancher API which
  /// can be added to the list of [_selectedClusters] by a user to add them to
  /// the app. If the API call returns an error we set the [_error] variable.
  Future<void> _getClusters() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      if (widget.provider.rancher != null) {
        final tmpClusters = await RancherService().getClusters(
          widget.provider.rancher!.serverAddress ?? '',
          widget.provider.rancher!.allowInsecureConnections ?? false,
          widget.provider.rancher!.token ?? '',
        );

        for (var i = 0; i < tmpClusters.length; i++) {
          final kubeconfig = await RancherService().getKubeconfig(
            widget.provider.rancher!.serverAddress ?? '',
            widget.provider.rancher!.allowInsecureConnections ?? false,
            widget.provider.rancher!.token ?? '',
            tmpClusters[i].id!,
          );
          tmpClusters[i].kubeconfig = Kubeconfig.fromJson(
            json.decode(
              json.encode(
                loadYaml(
                  kubeconfig.config ?? '',
                ),
              ),
            ),
          );
        }

        setState(() {
          _isLoading = false;
          _clusters = tmpClusters;
        });
      } else {
        setState(() {
          _isLoading = false;
          _error = 'Provider configuration is invalid';
        });
      }
    } catch (err) {
      Logger.log(
        'SettingsAddClusterRancher _getClusters',
        'Could not get clusters',
        err,
      );
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_addClusters] adds the users selected clusters [_selectedClusters] to the
  /// app. When we are not able to add the clusters a snackbar with the error is
  /// shown.
  Future<void> _addClusters() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoadingAddCluster = true;
      });
      for (var selectedCluster in _selectedClusters) {
        if (selectedCluster.name != null &&
            selectedCluster.kubeconfig != null) {
          final tmpClusters = await selectedCluster.kubeconfig!.getClusters(
            ClusterProviderType.rancher,
            widget.provider.id ?? '',
          );
          for (var tmpCluster in tmpClusters) {
            tmpCluster.name = selectedCluster.name!;
            await clustersRepository.addCluster(tmpCluster);
          }
        }
      }
      setState(() {
        _isLoadingAddCluster = false;
      });
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (err) {
      setState(() {
        _isLoadingAddCluster = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not add clusters',
          err.toString(),
        );
      }
    }
  }

  /// [_buildContent] shows a loading indicator, when we execute the API call to
  /// get the clusters. When the API call returns an error we display an error
  /// widget. If the API returns a list of clusters, we show a list of clusters,
  /// which can be selected by the user to add them to the app.
  Widget _buildContent() {
    if (_isLoading) {
      return Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Wrap(
              children: [
                CircularProgressIndicator(
                  color: theme(context).primary,
                ),
              ],
            ),
          ),
        ],
      );
    }

    if (_error != '') {
      return Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Wrap(
              children: [
                AppErrorWidget(
                  message: 'Could not load clusters',
                  details: _error,
                  icon: ClusterProviderType.rancher.icon(),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return ListView(
      children: [
        ...List.generate(
          _clusters.length,
          (index) {
            return Container(
              margin: const EdgeInsets.only(
                top: Constants.spacingSmall,
                bottom: Constants.spacingSmall,
                left: Constants.spacingExtraSmall,
                right: Constants.spacingExtraSmall,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: theme(context).shadow,
                    blurRadius: Constants.sizeBorderBlurRadius,
                    spreadRadius: Constants.sizeBorderSpreadRadius,
                    offset: const Offset(0.0, 0.0),
                  ),
                ],
                color: theme(context).card,
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constants.sizeBorderRadius),
                ),
              ),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                value: _selectedClusters
                        .where((c) => c.name == _clusters[index].name)
                        .toList()
                        .length ==
                    1,
                onChanged: (bool? value) {
                  if (value == true) {
                    setState(() {
                      _selectedClusters.add(_clusters[index]);
                    });
                  }
                  if (value == false) {
                    setState(() {
                      _selectedClusters = _selectedClusters
                          .where((c) => c.name != _clusters[index].name)
                          .toList();
                    });
                  }
                },
                title: Text(
                  Characters(_clusters[index].name ?? '')
                      .replaceAll(Characters(''), Characters('\u{200B}'))
                      .toString(),
                  style: noramlTextStyle(
                    context,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _getClusters();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.rancher.title(),
      subtitle: ClusterProviderType.rancher.subtitle(),
      icon: ClusterProviderType.rancher.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Add Clusters',
      actionPressed: () {
        _addClusters();
      },
      actionIsLoading: _isLoading || _isLoadingAddCluster,
      child: _buildContent(),
    );
  }
}
