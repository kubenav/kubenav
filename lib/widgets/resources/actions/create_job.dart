import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_cron_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_owner_reference.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/resources/resources_jobs.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

String _createBody(IoK8sApiBatchV1Job job) {
  return json.encode(removeNull(resourceJob.toJson(job)));
}

/// The [CreateJob] widget can be used to create a Job for a CronJob. The
/// provided [cronJob] is the CronJob for which we want to create a Job and is
/// used as template for the Job.
class CreateJob extends StatefulWidget {
  const CreateJob({
    super.key,
    required this.name,
    required this.namespace,
    required this.cronJob,
  });

  final String name;
  final String namespace;
  final IoK8sApiBatchV1CronJob cronJob;

  @override
  State<CreateJob> createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  final _createJobFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  bool _isLoading = false;

  /// [_validator] is used to validate the required field [_nameController].
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  /// [_createJob] creates a Job for the provided CronJob. The Job is created
  /// with the same spec as the CronJob. The user gets a snackbar message if the
  /// creation was successful or failed.
  Future<void> _createJob() async {
    if (_createJobFormKey.currentState != null &&
        _createJobFormKey.currentState!.validate()) {
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

        final Map<String, String> annotations = {
          'cronjob.kubernetes.io/instantiate': 'manual',
        };
        if (widget.cronJob.spec?.jobTemplate.metadata?.annotations != null) {
          annotations.addAll(
            widget.cronJob.spec!.jobTemplate.metadata!.annotations,
          );
        }

        final job = IoK8sApiBatchV1Job(
          kind: 'Job',
          apiVersion: 'batch/v1',
          metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta(
            name: _nameController.text,
            namespace: widget.namespace,
            labels: widget.cronJob.spec?.jobTemplate.metadata?.labels ?? {},
            annotations: annotations,
            ownerReferences: [
              IoK8sApimachineryPkgApisMetaV1OwnerReference(
                apiVersion: 'batch/v1',
                blockOwnerDeletion: true,
                controller: true,
                kind: 'CronJob',
                name: widget.name,
                uid: widget.cronJob.metadata?.uid ?? '',
              ),
            ],
          ),
          spec: widget.cronJob.spec?.jobTemplate.spec,
        );
        final String body = await compute(_createBody, job);

        final cluster = await clustersRepository.getClusterWithCredentials(
          clustersRepository.activeClusterId,
        );
        final url =
            '${resourceJob.path}/namespaces/${widget.namespace}/${resourceJob.resource}';

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
            'Job Created',
            'The Job ${_nameController.text} for the CronJob ${widget.namespace}/${widget.name} was created',
          );
          Navigator.pop(context);
        }
      } catch (err) {
        Logger.log('CreateJob _createJob', 'Failed to Create Job', err);
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          showSnackbar(context, 'Failed to Create Job', err.toString());
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = '${widget.name}-manual';
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Create Job',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.start,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Create Job',
      actionPressed: () {
        _createJob();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _createJobFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: Constants.spacingMiddle,
              bottom: Constants.spacingMiddle,
              left: Constants.spacingMiddle,
              right: Constants.spacingMiddle,
            ),
            child: Column(
              children: [
                Text(
                  'Do you really want to create a Job for the CronJob ${widget.namespace}/${widget.name}?',
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Job Name',
                  ),
                  validator: _validator,
                  onFieldSubmitted: (String value) {
                    _createJob();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
