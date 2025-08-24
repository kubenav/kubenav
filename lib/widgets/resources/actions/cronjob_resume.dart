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

/// The [CronJobResume] is used to resume a Flux resource. When the user
/// presses the action button, the resource is resumed by setting the
/// `spec.suspend` field to `false` for the provided [item].
class CronJobResume extends StatefulWidget {
  const CronJobResume({
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
  State<CronJobResume> createState() => _CronJobResumeState();
}

class _CronJobResumeState extends State<CronJobResume> {
  bool _isLoading = false;

  /// [_resume] is used to resume the provided [item]. The resumption is done
  /// by setting the `spec.suspend` field to `true`.
  /// The user gets a snackbar message if the resumption was successful or
  /// failed.
  Future<void> _resume() async {
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
          ? '[{ "op": "replace", "path": "/spec/suspend", "value": false }]'
          : '[{ "op": "add", "path": "/spec/suspend", "value": false }]';

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
          '${widget.resource.singular} Resumed',
          'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was resumed',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log('CronJobResume _resume', 'Resumption Failed', err);
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(context, 'Resumption Failed', err.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Resume',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.play_arrow,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Resume',
      actionPressed: () {
        _resume();
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
            'Do you really want to resume the ${widget.resource.singular} ${widget.namespace}/${widget.name}?',
          ),
        ),
      ),
    );
  }
}
