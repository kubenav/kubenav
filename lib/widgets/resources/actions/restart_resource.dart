import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [RestartResource] widget can be used to restart all Pods of a
/// Deployment, StatefulSet or DaemonSet. This is done by adding / adjusting the
/// `kubenav.io/restartedAt` annotation of the resource.
class RestartResource extends StatefulWidget {
  const RestartResource({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
    required this.resource,
  });

  final String name;
  final String namespace;
  final dynamic item;
  final Resource resource;

  @override
  State<RestartResource> createState() => _RestartResourceState();
}

class _RestartResourceState extends State<RestartResource> {
  bool _isLoading = false;

  /// [_restart] is used to restart all Pods of the provided Deployment,
  /// StatefulSet or DaemonSet. The restart is done by adding / adjusting the
  /// `kubenav.io/restartedAt` annotation of the resource. The user gets a
  /// snackbar message if the restart was successful or failed.
  Future<void> _restart() async {
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

      final String body =
          '{"spec": {"template": {"metadata": {"annotations": {"kubenav.io/restartedAt": "${DateTime.now().toIso8601String()}"}}}}}';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}?fieldManager=kubenav';

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).patchRequest(PatchType.mergePatch, url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          '${widget.resource.singular} Restarted',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was restarted',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'RestartResource _restart',
        'Failed to Restart ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Restart ${widget.resource.singular}',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Restart',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.restart_alt,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Restart',
      actionPressed: () {
        _restart();
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
            'Do you really want to restart all Pods of the ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
