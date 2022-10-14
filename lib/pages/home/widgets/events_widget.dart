import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event_list.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/events.dart';
import 'package:kubenav/widgets/app_error_widget.dart';

class EventsController extends GetxController {
  ClusterController clusterController = Get.find();

  RxList<IoK8sApiCoreV1Event> events = <IoK8sApiCoreV1Event>[].obs;
  RxBool loading = false.obs;
  RxString error = ''.obs;
  Worker? worker;

  @override
  void onInit() {
    getEvents();

    worker = ever(clusterController.activeClusterIndex, (_) {
      getEvents();
    });

    super.onInit();
  }

  @override
  void onClose() {
    if (worker != null) {
      worker!.dispose();
    }

    super.onClose();
  }

  void getEvents() async {
    loading.value = true;

    final cluster = clusterController.getActiveCluster();
    if (cluster == null) {
      error.value = 'No active cluster';
    } else {
      final url =
          '${Resources.map['events']!.path}/${Resources.map['events']!.resource}?fieldSelector=type=Warning';

      try {
        final resourcesList =
            await KubernetesService(cluster: cluster).getRequest(url);
        final eventsList = IoK8sApiCoreV1EventList.fromJson(resourcesList);

        if (eventsList != null) {
          Logger.log(
            'EventsController getEvents',
            '${eventsList.items.length} events were returned',
            'Request URL: $url\nManifest: $eventsList',
          );

          final eventItems = eventsList.items;
          eventItems.sort((a, b) =>
              a.lastTimestamp != null && b.lastTimestamp != null
                  ? b.lastTimestamp!.compareTo(a.lastTimestamp!)
                  : 0);

          if (eventItems.length > 25) {
            events.value = eventItems.sublist(0, 25);
          } else {
            events.value = eventItems;
          }
        }

        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'EventsController getEvents',
          'An error was returned while getting events',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'EventsController getEvents',
          'An error was returned while getting events',
          err,
        );
        error.value = err.toString();
        loading.value = false;
      }
    }
  }
}

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key}) : super(key: key);

  Widget buildEventItem(IoK8sApiCoreV1Event event) {
    final info = buildInfoText(event);

    return ListItemWidget(
      title: Resources.map['events']!.title,
      resource: Resources.map['events']!.resource,
      path: Resources.map['events']!.path,
      scope: Resources.map['events']!.scope,
      name: event.metadata.name ?? '',
      namespace: event.metadata.namespace,
      info: info,
      status: event.type == 'Normal' ? Status.success : Status.warning,
    );
  }

  @override
  Widget build(BuildContext context) {
    EventsController controller = Get.put(
      EventsController(),
    );

    return Column(
      children: [
        Obx(
          () {
            if (controller.loading.value) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(Constants.spacingMiddle),
                    child: CircularProgressIndicator(
                        color: Constants.colorPrimary),
                  ),
                ],
              );
            }

            if (controller.error.value != '') {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.spacingMiddle),
                      child: AppErrorWidget(
                        message: 'Could not load events',
                        details: controller.error.value,
                        icon:
                            'assets/resources/image108x108/${Resources.map['events']!.resource}.png',
                      ),
                    ),
                  ),
                ],
              );
            }

            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: Constants.spacingMiddle,
                    left: Constants.spacingMiddle,
                    right: Constants.spacingMiddle,
                    bottom: Constants.spacingMiddle,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Warnings',
                          style: primaryTextStyle(context, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                        right: Constants.spacingMiddle,
                        left: Constants.spacingMiddle,
                      ),
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        return buildEventItem(controller.events[index]);
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
