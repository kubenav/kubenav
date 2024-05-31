import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_cron_job.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [CronJobSuspend] is used to suspend a Flux resource. When the user
/// presses the action button, the resource is suspended by setting the
/// `spec.suspend` field to `true` for the provided [item].
class CronJobSuspend extends StatefulWidget {
  const CronJobSuspend({
    super.key,
    required this.name,
    required this.namespace,
    required this.resource,
    required this.cronJob,
  });

  final String name;
  final String namespace;
  final Resource resource;
  final IoK8sApiBatchV1CronJob cronJob;

  @override
  State<CronJobSuspend> createState() => _CronJobSuspendState();
}

class _CronJobSuspendState extends State<CronJobSuspend> {
  bool _isLoading = false;

  /// [_suspend] is used to suspend the provided [item]. The suspension is done
  /// by setting the `spec.suspend` field to `true`.
  /// The user gets a snackbar message if the suspension was successful or
  /// failed.
  Future<void> _suspend() async {
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

      final String body = widget.cronJob.spec?.suspend != null
          ? '[{ "op": "replace", "path": "/spec/suspend", "value": true }]'
          : '[{ "op": "add", "path": "/spec/suspend", "value": true }]';

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
          '${widget.resource.singular} Suspended',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was suspended',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'CronJobSuspend _suspend',
        'Suspension Failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Suspension Failed',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Suspend',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.pause,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Suspend',
      actionPressed: () {
        _suspend();
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
            'Do you really want to suspend the ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
