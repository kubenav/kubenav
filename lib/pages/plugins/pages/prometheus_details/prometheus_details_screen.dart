import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/plugins/pages/prometheus_details/prometheus_details_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/app_prometheus_charts_widget.dart';

class PrometheusDetails extends GetView {
  const PrometheusDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PrometheusDetailsController controller = Get.put(
      PrometheusDetailsController(
        namespace: Get.parameters['namespace'],
        name: Get.parameters['name'],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              Characters(controller.name ?? '')
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              Characters(controller.namespace ?? 'No Namespace')
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
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
                          padding:
                              const EdgeInsets.all(Constants.spacingMiddle),
                          child: AppErrorWidget(
                            message: 'Could not load dashboard',
                            details: controller.error.value,
                            icon: 'assets/plugins/image108x108/prometheus.png',
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return AppPrometheusChartsWidget(
                  manifest: const {},
                  defaultCharts: controller.items,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
