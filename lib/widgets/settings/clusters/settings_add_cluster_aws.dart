import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [SettingsAddClusterAWS] widget displays a list of EKS cluster from AWS
/// for the user. A user can then select the clusters he wants to add to
/// kubenav. Once he selected the clusters he wants to add, he has to click the
/// add clusters button, so that the clusters can be used in the app.
///
/// To get the clusters from AWS a [provider] is required. The provider must
/// contain a valid set of credentails for the user.
class SettingsAddClusterAWS extends StatefulWidget {
  const SettingsAddClusterAWS({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  @override
  State<SettingsAddClusterAWS> createState() => _SettingsAddClusterAWSState();
}

class _SettingsAddClusterAWSState extends State<SettingsAddClusterAWS> {
  bool _isLoadingAddCluster = false;
  bool _isLoading = false;
  String _error = '';
  List<AWSCluster> _clusters = <AWSCluster>[];
  List<AWSCluster> _selectedClusters = <AWSCluster>[];

  /// The [_getClusters] function is used to get all clusters from AWS. If we
  /// are able to get the clusters, we add them to the [_clusters] list. If an
  /// error is thrown during the API call we set the [_error] variable.
  Future<void> _getClusters() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      if (widget.provider.aws != null) {
        final tmpClusters = await AWSService().getClusters(
          widget.provider.aws?.accessKeyID ?? '',
          widget.provider.aws?.secretKey ?? '',
          widget.provider.aws?.region ?? '',
          widget.provider.aws?.sessionToken ?? '',
          widget.provider.aws?.roleArn ?? '',
        );

        Logger.log(
          'SettingsAddClusterAWS _getClusters',
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
        'SettingsAddClusterAWS _getClusters',
        'Could not get clusters',
        err,
      );
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_addClusters] adds all the users [_selectedClusters] to the list of
  /// clusters for the app. When we are not able to add a selected cluster we
  /// display a snackbar with the thrown error.
  ///
  /// We also have to save the cluster name as it is returned from AWS to the
  /// clusterProviderInternal, so that we can get a set of credentials for the
  /// cluster.
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
        if (selectedCluster.name != null && selectedCluster.endpoint != null) {
          await clustersRepository.addCluster(
            Cluster(
              id: const Uuid().v4(),
              name:
                  'aws_${widget.provider.aws?.region}_${selectedCluster.name}',
              clusterProviderType: ClusterProviderType.aws,
              clusterProviderId: widget.provider.id ?? '',
              clusterProviderInternal: selectedCluster.name ?? '',
              clusterServer: selectedCluster.endpoint ?? '',
              clusterCertificateAuthorityData:
                  selectedCluster.certificateAuthority?.data ?? '',
              namespace: 'default',
            ),
          );
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

  /// The [_buildContent] function returns a loading indicator when [_isLoading]
  /// is true. If [_error] is not empty it displays an error widget. For the
  /// success case we show the list of the retrieved clusters from AWS as a
  /// list, where the user can select the clusters he wants to add to the app.
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
                  icon: ClusterProviderType.aws.icon(),
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
                    'aws_${widget.provider.aws?.region}_${_clusters[index].name}',
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
      title: ClusterProviderType.aws.title(),
      subtitle: ClusterProviderType.aws.subtitle(),
      icon: ClusterProviderType.aws.icon(),
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
