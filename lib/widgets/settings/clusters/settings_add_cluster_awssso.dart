import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/providers/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [SettingsAddClusterAWSSSO] widget can be used to display a list of EKS
/// clusters, when the user is authenticated via the AWS SSO provider. We then
/// load all the users clusters and show them in a list where the user can
/// select the clusters he wants to add to the app.
///
/// To get the list of clusters a valid [provider] configuration is required,
/// with the users credentials to access the AWS API.
class SettingsAddClusterAWSSSO extends StatefulWidget {
  const SettingsAddClusterAWSSSO({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  @override
  State<SettingsAddClusterAWSSSO> createState() =>
      _SettingsAddClusterAWSSSOState();
}

class _SettingsAddClusterAWSSSOState extends State<SettingsAddClusterAWSSSO> {
  bool _isLoadingAddCluster = false;
  bool _isLoading = false;
  String _error = '';
  List<AWSCluster> _clusters = <AWSCluster>[];
  List<AWSCluster> _selectedClusters = <AWSCluster>[];

  /// [_getClusters] returns a list of [_clusters] from the AWS API. If an error
  /// occures during the API call we set the [_error] field.
  Future<void> _getClusters() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      if (widget.provider.awssso != null) {
        final tmpClusters = await AWSService().getClusters(
          widget.provider.awssso?.ssoCredentials?.accessKeyId ?? '',
          widget.provider.awssso?.ssoCredentials?.secretAccessKey ?? '',
          widget.provider.awssso?.region ?? '',
          widget.provider.awssso?.ssoCredentials?.sessionToken ?? '',
          '',
        );

        Logger.log(
          'SettingsAddClusterAWSSSO _getClusters',
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
        'SettingsAddClusterAWSSSO _getClusters',
        'Could not get clusters',
        err,
      );
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_addClusters] adds the users [_selectedClusters] to the app. When we are
  /// not able to add the selected clusters we show an error in a snackbar.
  ///
  /// We also have to save the cluster name as it is returned from AWS to the
  /// clusterProviderInternal, so that we can get a set of credentials for the
  /// cluster.
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
        if (selectedCluster.name != null && selectedCluster.endpoint != null) {
          await clustersRepository.addCluster(
            Cluster(
              id: const Uuid().v4(),
              name:
                  'aws_${widget.provider.awssso?.region}_${selectedCluster.name}',
              clusterProviderType: ClusterProviderType.awssso,
              clusterProviderId: widget.provider.id ?? '',
              clusterProviderInternal: selectedCluster.name ?? '',
              clusterServer: selectedCluster.endpoint ?? '',
              clusterCertificateAuthorityData:
                  selectedCluster.certificateAuthority?.data ?? '',
              userToken:
                  widget.provider.awssso!.ssoCredentials?.accessToken ?? '',
              userTokenExpireTimestamp:
                  widget.provider.awssso!.ssoCredentials?.accessTokenExpire ??
                      0,
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
      if (mounted) {
        showSnackbar(
          context,
          'Could not add clusters',
          err.toString(),
        );
      }
    }
  }

  /// [_buildContent] show a list of [_clusters] where a user can add / remove
  /// the clusters to the list of [_selectedClusters]. While we are loading the
  /// clusters a loading indicator is displayed. When we are not able to load
  /// the clusters and the [_error] variable is not empty a error widget is
  /// displayed.
  Widget _buildContent() {
    if (_isLoading) {
      return CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      );
    }

    if (_error != '') {
      return AppErrorWidget(
        message: 'Could not load clusters',
        details: _error,
        icon: ClusterProviderType.awssso.icon(),
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
            color: Theme.of(context).colorScheme.background,
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
                'aws_${widget.provider.awssso?.region}_${_clusters[index].name}',
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
      title: ClusterProviderType.awssso.title(),
      subtitle: ClusterProviderType.awssso.subtitle(),
      icon: ClusterProviderType.awssso.icon(),
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
