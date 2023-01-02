import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace_list.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// [AppNamespacesWidget] is a widget which can be used to switch the namespace
/// of the currently active cluster. The widget should be used within a modal
/// bottom sheet.
///
/// The widget displays a list of the users favorite namespaces, so that users
/// have faster access to them and for users which to not have the permissions
/// to view all namespaces in a cluster and the widget loads all namespaces
/// from the currently active cluster via a Kubernetes API call.
class AppNamespacesWidget extends StatefulWidget {
  const AppNamespacesWidget({Key? key}) : super(key: key);

  @override
  State<AppNamespacesWidget> createState() => _AppNamespacesWidgetState();
}

class _AppNamespacesWidgetState extends State<AppNamespacesWidget> {
  bool _isLoading = false;
  String _error = '';
  List<IoK8sApiCoreV1Namespace> _namespaces = <IoK8sApiCoreV1Namespace>[];

  /// [_getNamespaces] executes a request against the Kubernetes API of the
  /// currently active cluster, to load all namespaces. If the API returns a
  /// list of namespaces, we set the [_namespaces] state. If the API call
  /// returns an error we set the [_error] state.
  Future<void> _getNamespaces() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
        _error = '';
      });

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      final result = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).getRequest('/api/v1/namespaces');

      Logger.log(
        'AppNamespacesWidget _getNamespaces',
        'Namespaces were returned successfully',
        result,
      );

      final namespaceList = IoK8sApiCoreV1NamespaceList.fromJson(result);
      setState(() {
        _isLoading = false;
        _namespaces = namespaceList!.items;
      });
    } on PlatformException catch (err) {
      Logger.log(
        'AppNamespacesWidget _getNamespaces',
        'Could not get namespaces',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
        _error =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
      });
    } catch (err) {
      Logger.log(
        'AppNamespacesWidget _getNamespaces',
        'Could not get namespaces',
        err,
      );
      setState(() {
        _isLoading = false;
        _error = err.toString();
      });
    }
  }

  /// [_changeNamespace] sets the namespace of the currently active cluster to
  /// the provided [namespace]. If the operation succeeds we close the modal. If
  /// the operation return an error we show the user a snackbar with the
  /// returned error.
  Future<void> _changeNamespace(BuildContext context, String namespace) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      await clustersRepository.setNamespace(
        clustersRepository.activeClusterId,
        namespace,
      );
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (err) {
      showSnackbar(
        'Namespace was not changed',
        err.toString(),
      );
    }
  }

  /// [_buildFavoriteNamespace] builds a list of the user defined namespaces in
  /// the app settings. This list is always displayed, also when the user has
  /// not the permissions to view a list of namespaces, to make it easier for
  /// these users to switch between different namespaces of a cluster.
  List<Widget> _buildFavoriteNamespace(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    return [
      Container(
        margin: const EdgeInsets.only(
          top: Constants.spacingSmall,
          bottom: Constants.spacingSmall,
          left: Constants.spacingExtraSmall,
          right: Constants.spacingExtraSmall,
        ),
        child: Text(
          'Favorites',
          style: primaryTextStyle(context, size: 18),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(
          top: Constants.spacingSmall,
          bottom: Constants.spacingSmall,
          left: Constants.spacingExtraSmall,
          right: Constants.spacingExtraSmall,
        ),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: Constants.sizeBorderBlurRadius,
              spreadRadius: Constants.sizeBorderSpreadRadius,
              offset: const Offset(0.0, 0.0),
            ),
          ],
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        child: InkWell(
          onTap: () {
            _changeNamespace(context, '');
          },
          child: Row(
            children: [
              Icon(
                clustersRepository
                            .getCluster(clustersRepository.activeClusterId)!
                            .namespace ==
                        ''
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 24,
                color: Constants.colorPrimary,
              ),
              const SizedBox(width: Constants.spacingSmall),
              Expanded(
                flex: 1,
                child: Text(
                  'All Namespaces',
                  style: noramlTextStyle(
                    context,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
      ...List.generate(
        appRepository.settings.namespaces.length,
        (index) {
          final name = appRepository.settings.namespaces[index];

          return Container(
            margin: const EdgeInsets.only(
              top: Constants.spacingSmall,
              bottom: Constants.spacingSmall,
              left: Constants.spacingExtraSmall,
              right: Constants.spacingExtraSmall,
            ),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: Constants.sizeBorderBlurRadius,
                  spreadRadius: Constants.sizeBorderSpreadRadius,
                  offset: const Offset(0.0, 0.0),
                ),
              ],
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constants.sizeBorderRadius),
              ),
            ),
            child: InkWell(
              onTap: () {
                _changeNamespace(context, name);
              },
              child: Row(
                children: [
                  Icon(
                    name ==
                            clustersRepository
                                .getCluster(clustersRepository.activeClusterId)!
                                .namespace
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 24,
                    color: Constants.colorPrimary,
                  ),
                  const SizedBox(width: Constants.spacingSmall),
                  Expanded(
                    flex: 1,
                    child: Text(
                      name,
                      style: noramlTextStyle(
                        context,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      Container(
        margin: const EdgeInsets.only(
          top: Constants.spacingSmall,
          bottom: Constants.spacingSmall,
          left: Constants.spacingExtraSmall,
          right: Constants.spacingExtraSmall,
        ),
        child: Text(
          'Namespaces',
          style: primaryTextStyle(context, size: 18),
        ),
      ),
    ];
  }

  /// [_buildContent] returns the content of the namespaces modal. If
  /// [_isLoading] is `true` while we are loading the namespaces of the cluster
  /// we display, the users favorite namespaces and a loading indicator. When an
  /// [_error] was returned during the API call to get all namespaces, we show
  /// the users favorite namespaces and the error message. If we were able to
  /// get the list of namespaces, we show the users favorite namespaces and the
  /// list of retrieved namespaces.
  Widget _buildContent(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    if (_isLoading) {
      return ListView(
        children: [
          ..._buildFavoriteNamespace(context),
          const Center(
            child: CircularProgressIndicator(
              color: Constants.colorPrimary,
            ),
          ),
        ],
      );
    }

    if (_error != '') {
      return ListView(
        children: [
          ..._buildFavoriteNamespace(context),
          Wrap(
            children: [
              AppErrorWidget(
                message: 'Could not load Namespaces',
                details: _error,
                icon: CustomIcons.namespaces,
              ),
            ],
          ),
        ],
      );
    }

    return ListView(
      children: [
        ..._buildFavoriteNamespace(context),
        ...List.generate(
          _namespaces.length,
          (index) {
            final name = _namespaces[index].metadata?.name;

            return Container(
              margin: const EdgeInsets.only(
                top: Constants.spacingSmall,
                bottom: Constants.spacingSmall,
                left: Constants.spacingExtraSmall,
                right: Constants.spacingExtraSmall,
              ),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: Constants.sizeBorderBlurRadius,
                    spreadRadius: Constants.sizeBorderSpreadRadius,
                    offset: const Offset(0.0, 0.0),
                  ),
                ],
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(Constants.sizeBorderRadius),
                ),
              ),
              child: InkWell(
                onTap: () {
                  _changeNamespace(context, name ?? 'default');
                },
                child: Row(
                  children: [
                    Icon(
                      name != null &&
                              name ==
                                  clustersRepository
                                      .getCluster(
                                          clustersRepository.activeClusterId)!
                                      .namespace
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 24,
                      color: Constants.colorPrimary,
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      flex: 1,
                      child: Text(
                        name ?? '',
                        style: noramlTextStyle(
                          context,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
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
    _getNamespaces();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Namespaces',
      subtitle: 'Select the active namespace',
      icon: CustomIcons.namespaces,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Close',
      actionPressed: () {
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: _buildContent(context),
    );
  }
}
