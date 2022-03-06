import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show
        IoK8sApiBatchV1CronJob,
        IoK8sApiBatchV1Job,
        IoK8sApiBatchV1JobSpec,
        IoK8sApiCoreV1PodTemplateSpec,
        IoK8sApimachineryPkgApisMetaV1ObjectMeta;
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsCreateJobController extends GetxController {
  final String name;
  final String namespace;
  final dynamic item;

  ClusterController clusterController = Get.find();

  DetailsCreateJobController({
    required this.name,
    required this.namespace,
    required this.item,
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createJob(BuildContext context) async {
    try {
      final cronJob = IoK8sApiBatchV1CronJob.fromJson(item);
      final jobName = '$name-manual';
      final job = IoK8sApiBatchV1Job(
        kind: 'Job',
        apiVersion: 'batch/v1',
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta(
          name: jobName,
          namespace: namespace,
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

      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final url =
          '${Resources.map['jobs']!.path}/namespaces/$namespace/${Resources.map['jobs']!.resource}';

      await KubernetesService(cluster: cluster).postRequest(url, body);
      snackbar(
        'Job was created',
        'The Job $jobName for CronJob $name in namespace $namespace was created',
      );
    } on PlatformException catch (err) {
      Logger.log(
        'DetailsCreateJobController createJob',
        'An error was returned while the job was created',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      snackbar(
        'Could not create Job',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
    } catch (err) {
      Logger.log(
        'DetailsCreateJobController createJob',
        'An error was returned while the job was created',
        err,
      );
      snackbar('Could not create Job', err.toString());
    }

    finish(context);
  }
}

class DetailsCreateJobWidget extends StatelessWidget {
  const DetailsCreateJobWidget({
    Key? key,
    required this.name,
    required this.namespace,
    required this.item,
  }) : super(key: key);

  final String name;
  final String namespace;
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    DetailsCreateJobController controller = Get.put(
      DetailsCreateJobController(
        name: name,
        namespace: namespace,
        item: item,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Create Job',
      subtitle: name,
      icon: Icons.play_arrow,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Create Job',
      onActionPressed: () {
        controller.createJob(context);
      },
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                  'Do you really want to create a Job for the CronJob $name in namespace $namespace?'),
            ),
          ],
        ),
      ),
    );
  }
}
