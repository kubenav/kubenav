import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginArgoSync] widget is used to initiate a Sync operation on an Argo
/// Application. To sync the application we have to send a json patch for the
/// application.
///
/// See https://argo-cd.readthedocs.io/en/stable/user-guide/sync-kubectl/
///
/// TODO: Implement Sync Options and specifying specific resources
class PluginArgoSync extends StatefulWidget {
  const PluginArgoSync({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.item,
  });

  final String name;
  final String namespace;
  final Resource resource;
  final dynamic item;

  @override
  State<PluginArgoSync> createState() => _PluginArgoSyncState();
}

class _PluginArgoSyncState extends State<PluginArgoSync> {
  bool _isLoading = false;

  Future<void> _sync() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });

      if (widget.item is! IoArgoprojV1alpha1Application) {
        throw 'Unsupported Resource';
      }

      final item = await compute(widget.resource.toJson, widget.item);

      final String body = item.containsKey('operation')
          ? '[{"op": "replace", "path": "/operation", "value": {"info": [{"name": "app", "value": "kubenav"}], "sync": {}}}]'
          : '[{"op": "add", "path": "/operation", "value": {"info": [{"name": "app", "value": "kubenav"}], "sync": {}}}]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      final url =
          '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}';

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).patchRequest(url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          '${widget.resource.singular} Synced',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was synced',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'PluginArgoSync _reconcile',
        'Initiating Sync Operation Failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Initiating Sync Operation Failed',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Sync',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.sync,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Sync',
      actionPressed: () {
        _sync();
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
          child: Text(
            'Do you really want to sync the ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
