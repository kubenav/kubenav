import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/google_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [SettingsAddClusterGoogle] widget can be used to display a list of GKE
/// clusters. The user can then select the clusters from this list which he
/// wants to add to the app.
///
/// To get the list of clusters a valid [provider] configuration is required
/// with the users access credentials so that we can call the Google API to get
/// the clusters on behalf of the user.
class SettingsAddClusterGoogle extends StatefulWidget {
  const SettingsAddClusterGoogle({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  @override
  State<SettingsAddClusterGoogle> createState() =>
      _SettingsAddClusterGoogleState();
}

class _SettingsAddClusterGoogleState extends State<SettingsAddClusterGoogle> {
  bool _isLoadingAddCluster = false;
  bool _isLoading = false;
  String _error = '';
  List<GoogleCluster> _clusters = <GoogleCluster>[];
  List<GoogleCluster> _selectedClusters = <GoogleCluster>[];

  /// [_getClusters] returns a list of [_clusters] from the Google API which can
  /// be added to the list of [_selectedClusters] by a user to add them to the
  /// app. If the API call returns an error we set the [_error] variable.
  Future<void> _getClusters() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      if (widget.provider.google != null) {
        final projects = await GoogleService()
            .getProjects(widget.provider.google!.accessToken ?? '');

        final List<GoogleCluster> tmpClusters = [];
        for (var project in projects) {
          final projectClusters = await GoogleService().getClusters(
            project.projectId!,
            widget.provider.google!.accessToken ?? '',
          );

          tmpClusters.addAll(projectClusters);
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
        'SettingsAddClusterGoogle _getClusters',
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
        await clustersRepository.addCluster(
          Cluster(
            id: const Uuid().v4(),
            name: 'gke_${selectedCluster.location}_${selectedCluster.name}',
            clusterProviderType: ClusterProviderType.google,
            clusterProviderId: widget.provider.id ?? '',
            clusterServer: 'https://${selectedCluster.endpoint!}',
            clusterCertificateAuthorityData:
                selectedCluster.masterAuth?.clusterCaCertificate ?? '',
            clusterInsecureSkipTLSVerify: false,
            userClientCertificateData:
                selectedCluster.masterAuth?.clientCertificate ?? '',
            userClientKeyData: selectedCluster.masterAuth?.clientKey ?? '',
            userUsername: selectedCluster.masterAuth?.username ?? '',
            userPassword: selectedCluster.masterAuth?.password ?? '',
            namespace: 'default',
          ),
        );
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
                  icon: ClusterProviderType.google.icon(),
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
                    'gke_${_clusters[index].location}_${_clusters[index].name}',
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
      title: ClusterProviderType.google.title(),
      subtitle: ClusterProviderType.google.subtitle(),
      icon: ClusterProviderType.google.icon(),
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
