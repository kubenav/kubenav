import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_error_widget.dart';
import 'package:kubenav/widgets/app_horizontal_list_cards_widget.dart';

class DetailsResourcesPreviewController extends GetxController {
  ClusterController clusterController = Get.find();

  String resource;
  String path;
  String? namespace;
  String selector;

  RxList<dynamic> items = <dynamic>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  DetailsResourcesPreviewController({
    required this.resource,
    required this.path,
    required this.namespace,
    required this.selector,
  });

  @override
  void onInit() {
    getResources();
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

        debugPrint(
            'getResources success: ${resourcesList['items'].length} $resource were returned');
        items.value = resourcesList['items'];
        loading.value = false;
      } on PlatformException catch (err) {
        debugPrint('getResources error: $err');
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        debugPrint('getResources error: $err');
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
  }) : super(key: key);

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final String? namespace;
  final String selector;

  Widget buildContainer(Widget child) {
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
                child: Text(title, style: primaryTextStyle(size: 18)),
                flex: 1,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            right: Constants.spacingMiddle,
            left: Constants.spacingSmall,
          ),
          child: child,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    DetailsResourcesPreviewController controller = Get.put(
      DetailsResourcesPreviewController(
        resource: resource,
        path: path,
        namespace: namespace,
        selector: selector,
      ),
      tag: '$resource $path $namespace $selector',
    );

    return Obx(
      () {
        if (controller.loading.value) {
          return buildContainer(
            const CircularProgressIndicator(
              color: Constants.colorPrimary,
            ),
          );
        }

        if (controller.error.value != '') {
          return buildContainer(
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
              subtitle: controller.items[index]['metadata']?['namespace'] ?? '',
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
          moreText: controller.items.length >= 5 ? 'View all' : null,
          moreIcon:
              controller.items.length >= 5 ? Icons.keyboard_arrow_right : null,
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
