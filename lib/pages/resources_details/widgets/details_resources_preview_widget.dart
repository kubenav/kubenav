import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_cron_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/cronjobs.dart' as cronjob_helpers;
import 'package:kubenav/utils/resources/deployments.dart' as deployment_helpers;
import 'package:kubenav/utils/resources/events.dart' as event_helpers;
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/resources/jobs.dart' as job_helpers;
import 'package:kubenav/utils/resources/pods.dart' as pod_helpers;
import 'package:kubenav/widgets/app_error_widget.dart';
import 'package:kubenav/widgets/app_horizontal_list_cards_widget.dart';

import 'package:kubenav/utils/resources/statefulsets.dart'
    as statefulset_helpers;

class DetailsResourcesPreviewController extends GetxController {
  ClusterController clusterController = Get.find();

  String resource;
  String path;
  String? namespace;
  String selector;
  List<dynamic> Function(List<dynamic> items)? filter;

  RxList<dynamic> items = <dynamic>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  DetailsResourcesPreviewController({
    required this.resource,
    required this.path,
    required this.namespace,
    required this.selector,
    required this.filter,
  });

  @override
  void onInit() {
    getResources();
    super.onInit();
  }

  void getResources() async {
    loading.value = true;
    final cluster = clusterController.getActiveCluster();
    if (cluster == null) {
      error.value = 'No active cluster';
    } else {
      final url = namespace != null
          ? '$path/namespaces/$namespace/$resource?limit=5&$selector'
          : '$path/$resource?limit=5&$selector';

      try {
        final resourcesList =
            await KubernetesService(cluster: cluster).getRequest(url);

        if (filter != null) {
          final filteredItems = filter!(resourcesList['items']);
          Logger.log(
            'DetailsResourcesPreviewController getResources',
            '${filteredItems.length} filtered items were returned',
            'Request URL: $url\nManifest: $filteredItems',
          );
          items.value = filteredItems;
          loading.value = false;
        } else {
          Logger.log(
            'DetailsResourcesPreviewController getResources',
            '${resourcesList['items'].length} items were returned',
            'Request URL: $url\nManifest: $resourcesList',
          );
          items.value = resourcesList['items'];
          loading.value = false;
        }
      } on PlatformException catch (err) {
        Logger.log(
          'DetailsResourcesPreviewController getResources',
          'An error was returned while getting resources',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'DetailsResourcesPreviewController getResources',
          'An error was returned while getting resources',
          err,
        );
        error.value = err.toString();
        loading.value = false;
      }
    }
  }
}

class DetailsResourcesPreviewWidget extends StatelessWidget {
  const DetailsResourcesPreviewWidget({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.namespace,
    required this.selector,
    this.filter,
  }) : super(key: key);

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final String? namespace;
  final String selector;
  final List<dynamic> Function(List<dynamic> items)? filter;

  Widget buildContainer(BuildContext context, Widget child) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
            bottom: Constants.spacingSmall,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(title, style: primaryTextStyle(context, size: 18)),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            right: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
          ),
          child: child,
        ),
      ],
    );
  }

  List<String> buildSubtitle(
    String title,
    String resource,
    String path,
    ResourceScope scope,
    dynamic item,
  ) {
    if (resource == Resources.map['cronjobs']!.resource &&
        path == Resources.map['cronjobs']!.path) {
      return cronjob_helpers
          .buildInfoText(IoK8sApiBatchV1CronJob.fromJson(item));
    }

    if (resource == Resources.map['deployments']!.resource &&
        path == Resources.map['deployments']!.path) {
      return deployment_helpers
          .buildInfoText(IoK8sApiAppsV1Deployment.fromJson(item));
    }

    if (resource == Resources.map['events']!.resource &&
        path == Resources.map['events']!.path) {
      return event_helpers.buildInfoText(IoK8sApiCoreV1Event.fromJson(item));
    }

    if (resource == Resources.map['jobs']!.resource &&
        path == Resources.map['jobs']!.path) {
      return job_helpers.buildInfoText(IoK8sApiBatchV1Job.fromJson(item));
    }

    if (resource == Resources.map['pods']!.resource &&
        path == Resources.map['pods']!.path) {
      return pod_helpers.buildInfoText(IoK8sApiCoreV1Pod.fromJson(item));
    }

    if (resource == Resources.map['statefulsets']!.resource &&
        path == Resources.map['statefulsets']!.path) {
      return statefulset_helpers
          .buildInfoText(IoK8sApiAppsV1StatefulSet.fromJson(item));
    }

    final age = getAge(item['metadata'] != null &&
            item['metadata']['creationTimestamp'] != null
        ? DateTime.parse(item['metadata']['creationTimestamp'])
        : null);

    return item['metadata']?['namespace'] != null
        ? ['Namespace: ${item['metadata']?['namespace']}', 'Age: $age']
        : ['Age: $age'];
  }

  @override
  Widget build(BuildContext context) {
    DetailsResourcesPreviewController controller = Get.put(
      DetailsResourcesPreviewController(
        resource: resource,
        path: path,
        namespace: namespace,
        selector: selector,
        filter: filter,
      ),
      tag: '$resource $path $namespace $selector',
    );

    return Obx(
      () {
        if (controller.loading.value) {
          return buildContainer(
            context,
            const CircularProgressIndicator(
              color: Constants.colorPrimary,
            ),
          );
        }

        if (controller.error.value != '') {
          return buildContainer(
            context,
            AppErrorWidget(
              message: 'Could not load $title',
              details: controller.error.value,
              icon: Resources.map.containsKey(resource) &&
                      Resources.map[resource]!.path == path
                  ? 'assets/resources/image108x108/${controller.resource}.png'
                  : null,
            ),
          );
        }

        if (controller.items.isEmpty) {
          return buildContainer(
            context,
            AppErrorWidget(
              message: 'No $title found',
              details: 'We could not found any $title',
              icon: Resources.map.containsKey(resource) &&
                      Resources.map[resource]!.path == path
                  ? 'assets/resources/image108x108/${controller.resource}.png'
                  : null,
            ),
          );
        }

        return AppHorizontalListCardsWidget(
          title: title,
          cards: List.generate(
            controller.items.length,
            (index) => AppHorizontalListCardsModel(
              title: controller.items[index]['metadata']?['name'] ?? '',
              subtitle: buildSubtitle(
                title,
                resource,
                path,
                scope,
                controller.items[index],
              ),
              image: 'assets/resources/image108x108/${controller.resource}.png',
              imageFit: BoxFit.none,
              onTap: () {
                Get.toNamed(
                  '/resources/details?title=$title&resource=$resource&path=$path&scope=${scope.name}&name=${controller.items[index]['metadata']?['name']}&${controller.items[index]['metadata']?['namespace'] != null ? 'namespace=${controller.items[index]['metadata']?['namespace']}' : ''}',
                  preventDuplicates: false,
                );
              },
            ),
          ),
          moreText: controller.items.length >= 5 && filter == null
              ? 'View all'
              : null,
          moreIcon: controller.items.length >= 5 && filter == null
              ? Icons.keyboard_arrow_right
              : null,
          moreOnTap: () {
            Get.toNamed(
              '/resources/list?title=$title&resource=$resource&path=$path&scope=${scope.name}${namespace != null ? '&namespace=$namespace' : ''}&selector=$selector',
              preventDuplicates: false,
            );
          },
        );
      },
    );
  }
}
