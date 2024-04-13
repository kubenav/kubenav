import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/digitalocean_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [SettingsAddClusterDigitalOcean] widget can be used to display a list of
/// DOKS clusters. The user can then select the clusters from this list he wants
/// to add to the app.
///
/// To get the clusters from the DigitalOcean API a valid [provider]
/// configuration is required, with the users credentials to access the API.
class SettingsAddClusterDigitalOcean extends StatefulWidget {
  const SettingsAddClusterDigitalOcean({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  @override
  State<SettingsAddClusterDigitalOcean> createState() =>
      _SettingsAddClusterDigitalOceanState();
}

class _SettingsAddClusterDigitalOceanState
    extends State<SettingsAddClusterDigitalOcean> {
  bool _isLoadingAddCluster = false;
  bool _isLoading = false;
  String _error = '';
  List<DigitalOceanCluster> _clusters = <DigitalOceanCluster>[];
  List<DigitalOceanCluster> _selectedClusters = <DigitalOceanCluster>[];

  /// [_getClusters] can be used to get a list of [_clusters]. A user can then
  /// add theses clusters to the [_selectedClusters] list to add them to the
  /// app. If an error occurs during the API call the [_error] variable is set.
  Future<void> _getClusters() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      if (widget.provider.digitalocean != null) {
        final tmpClusters = await DigitalOceanService().getClusters(
          widget.provider.digitalocean!.token ?? '',
        );

        Logger.log(
          'SettingsAddClusterDigitalOcean _getClusters',
          'Clusters were returned',
          tmpClusters,
        );

        for (var i = 0; i < tmpClusters.length; i++) {
          final kubeconfig = await DigitalOceanService().getKubeconfig(
            tmpClusters[i].id!,
            widget.provider.digitalocean!.token ?? '',
          );
          tmpClusters[i].kubeconfig = Kubeconfig.fromJson(
            json.decode(
              json.encode(
                loadYaml(
                  kubeconfig,
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
        'SettingsAddClusterDigitalOcean _getClusters',
        'Could not get clusters',
        err,
      );
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_addClusters] adds the list of the users [_selectedClusters] to the app.
  /// When an error is returned from the operation we show a snackbar with the
  /// error.
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
            ClusterProviderType.digitalocean,
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

  /// [_buildContent] returns a loading indicator while we are loading the
  /// clusters from the DigitalOcean API ([_isLoading] == `true`). When the API
  /// call returns an error a error widget is displayed. For the success case
  /// we show a list of clusters which can be selected by the user to add them
  /// to the app.
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
                  icon: ClusterProviderType.digitalocean.icon(),
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
                  Characters(
                    _clusters[index].name ?? '',
                  )
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
      title: ClusterProviderType.digitalocean.title(),
      subtitle: ClusterProviderType.digitalocean.subtitle(),
      icon: ClusterProviderType.digitalocean.icon(),
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
