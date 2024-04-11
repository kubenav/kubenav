import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_cron_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [DetailsCreateJob] widget can be used to create a new Job from a
/// CronJob. To create a new Job we need the [name], [namespace] and the
/// manifest ([item]) of the corresponding CronJob.
class DetailsCreateJob extends StatefulWidget {
  const DetailsCreateJob({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
  });

  final String name;
  final String namespace;
  final dynamic item;

  @override
  State<DetailsCreateJob> createState() => _DetailsCreateJobState();
}

class _DetailsCreateJobState extends State<DetailsCreateJob> {
  bool _isLoading = false;

  /// [_createJob] creates a new Job based on the provided CronJob
  /// ([widget.item]). To create a new Job we have to use the spec from the
  /// CronJob, then we make a post request to the Kubernetes API to create the
  /// new job. If the job was created we show a success message in a snackbar
  /// and close the widget. If the API call fails we show a snackbar with the
  /// thrown exception.
  Future<void> _createJob() async {
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

      final cronJob = IoK8sApiBatchV1CronJob.fromJson(widget.item);
      final jobName = '${widget.name}-manual';
      final job = IoK8sApiBatchV1Job(
        kind: 'Job',
        apiVersion: 'batch/v1',
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta(
          name: jobName,
          namespace: widget.namespace,
          labels: {
            'job-name': jobName,
          },
          annotations: {
            'cronjob.kubernetes.io/instantiate': 'manual',
          },
        ),
        spec: cronJob?.spec?.jobTemplate.spec,
      );
      final String body = jsonEncode(job.toJson());

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${Resources.map['jobs']!.path}/namespaces/${widget.namespace}/${Resources.map['jobs']!.resource}';

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).postRequest(url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Job was created',
          'The Job $jobName for CronJob ${widget.name} in namespace ${widget.namespace} was created',
        );
        Navigator.pop(context);
      }
    } on PlatformException catch (err) {
      Logger.log(
        'DetailsCreateJob _createJob',
        'An error was returned while the job was created',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not create Job',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
      }
    } catch (err) {
      Logger.log(
        'DetailsCreateJob _createJob',
        'An error was returned while the job was created',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not create Job',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Create Job',
      subtitle: widget.name,
      icon: Icons.play_arrow,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Create Job',
      actionPressed: () {
        _createJob();
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
                'Do you really want to create a Job for the CronJob ${widget.name} in namespace ${widget.namespace}?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
