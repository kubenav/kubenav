import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/providers/digitalocean_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
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
          'Clusters',
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
          _error = 'Provider Configuration is Invalid';
        });
      }
    } catch (err) {
      Logger.log(
        'SettingsAddClusterDigitalOcean _getClusters',
        'Failed to Get Clusters',
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
          'Failed to Add Clusters',
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
      return CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      );
    }

    if (_error != '') {
      return AppErrorWidget(
        message: 'Failed to Load Clusters',
        details: _error,
        icon: ClusterProviderType.digitalocean.icon(),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: Constants.spacingMiddle,
        );
      },
      itemCount: _clusters.length,
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
            color: Theme.of(context).colorScheme.surface,
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
