import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [DetailsRestartResource] can be used to trigger a rollout of a
/// Deployment, StatefulSet or DaemonSet. Once the user presses the restart
/// button we will create a json path to add/update the "kubenav.io/restartedAt"
/// annotation of the corresponding Pods, which will trigger a rollover for all
/// Pods.
class DetailsRestartResource extends StatefulWidget {
  const DetailsRestartResource({
    super.key,
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
    required this.item,
  });

  final String resource;
  final String path;
  final String name;
  final String namespace;
  final dynamic item;

  @override
  State<DetailsRestartResource> createState() => _DetailsRestartResourceState();
}

class _DetailsRestartResourceState extends State<DetailsRestartResource> {
  bool _isLoading = false;

  /// [_restartResource] triggeres a rollover for all Pods of the specified
  /// Deployment, StatefulSet or DaemonSet. We do this by creating a json patch
  /// to add or update the "kubenav.io/restartedAt" annotation to all the Pods.
  /// If the API call succeeds we show a success message in a snackbar and close
  /// the widget. In case of an error we show the thrown exception in a
  /// snackbar.
  Future<void> _restartResource() async {
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

      final now = DateTime.now().toIso8601String();
      final String body = widget.item['spec'] != null &&
              widget.item['spec']['template'] != null &&
              widget.item['spec']['template']['metadata'] != null &&
              widget.item['spec']['template']['metadata']['annotations'] != null
          ? widget.item['spec']['template']['metadata']['annotations']
                      ['kubenav.io/restartedAt'] !=
                  null
              ? '[{"op": "replace", "path": "/spec/template/metadata/annotations/kubenav.io~1restartedAt", "value": "$now"}]'
              : '[{"op": "add", "path": "/spec/template/metadata/annotations/kubenav.io~1restartedAt", "value": "$now"}]'
          : '[{"op": "add", "path": "/spec/template/metadata/annotations", "value": {"kubenav.io/restartedAt": "$now"}}]';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.path}/namespaces/${widget.namespace}/${widget.resource}/${widget.name}';

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
          'Resource is restarted',
          'The resource ${widget.name} in namespace ${widget.namespace} is restarted',
        );
        Navigator.pop(context);
      }
    } on PlatformException catch (err) {
      Logger.log(
        'DetailsRestartResource _restartResource',
        'An error was returned while restarting the resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
      });
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Could not restart resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
    } catch (err) {
      Logger.log(
        'DetailsRestartResource _restartResource',
        'An error was returned while restarting the resource',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Could not restart resource',
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Restart',
      subtitle: widget.name,
      icon: Icons.restart_alt,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Restart',
      actionPressed: () {
        _restartResource();
      },
      actionIsLoading: _isLoading,
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'Do you really want to restart ${widget.name} in namespace ${widget.namespace}?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
