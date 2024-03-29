import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/azure_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [SettingsAddClusterAzure] widget can be used to display a list of AKS
/// clusters, so that a user can add his cluster from Azure. We display all
/// clusters a user has access to and the user can select the clusters he wants
/// to add to the app.
///
/// To get the list of clusters a valid [provider] configuration is required, so
/// that we can get the clusters via the Azure API.
class SettingsAddClusterAzure extends StatefulWidget {
  const SettingsAddClusterAzure({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  @override
  State<SettingsAddClusterAzure> createState() =>
      _SettingsAddClusterAzureState();
}

class _SettingsAddClusterAzureState extends State<SettingsAddClusterAzure> {
  bool _isLoadingAddCluster = false;
  bool _isLoading = false;
  String _error = '';
  List<AzureCluster> _clusters = <AzureCluster>[];
  List<AzureCluster> _selectedClusters = <AzureCluster>[];

  /// [_getClusters] returns a list of AKS clusters based on the given
  /// [widget.provider] configuration. The [_clusters] are then displayed in a
  /// list and the user can add them to the [_selectedClusters] list. If an
  /// error occures during the API call we set the [_error] variable.
  Future<void> _getClusters() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      if (widget.provider.azure != null) {
        final tmpClusters = await AzureService().getClusters(
          widget.provider.azure?.subscriptionID ?? '',
          widget.provider.azure?.tenantID ?? '',
          widget.provider.azure?.clientID ?? '',
          widget.provider.azure?.clientSecret ?? '',
          widget.provider.azure?.isAdmin ?? false,
        );

        Logger.log(
          'SettingsAddClusterAzure _getClusters',
          'Clusters were returned',
          tmpClusters,
        );
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
        'SettingsAddClusterAzure _getClusters',
        'Could not get clusters',
        err,
      );
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_addClusters] adds all the users [_selectedClusters] to the app. If we
  /// can not add a cluster we show a snackbar with the error.
  Future<void> _addClusters(BuildContext context) async {
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
            ClusterProviderType.azure,
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
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Could not add clusters',
        err.toString(),
      );
    }
  }

  /// [_buildContent] displays a loading indicator while [_isLoading] is true.
  /// If the API call to get the clusters returns an error a error widget is
  /// displayed. For the success case we show a list of clusters where the uer
  /// can select the clusters he wants to add to the app.
  Widget _buildContent() {
    if (_isLoading) {
      return Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Wrap(
              children: [
                CircularProgressIndicator(
                  color: theme(context).colorPrimary,
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
                  icon: ClusterProviderType.azure.icon(),
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
              child: CheckboxListTile(
                checkColor: Colors.white,
                activeColor: theme(context).colorPrimary,
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
      title: ClusterProviderType.azure.title(),
      subtitle: ClusterProviderType.azure.subtitle(),
      icon: ClusterProviderType.azure.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Add Clusters',
      actionPressed: () {
        _addClusters(context);
      },
      actionIsLoading: _isLoading || _isLoadingAddCluster,
      child: _buildContent(),
    );
  }
}
