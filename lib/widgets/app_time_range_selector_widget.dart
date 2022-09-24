import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/time_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AppTimeRangeSelectorController extends GetxController {
  List<String> times = [
    'Last 5 Minutes',
    'Last 15 Minutes',
    'Last 30 Minutes',
    'Last 1 Hour',
    'Last 3 Hours',
    'Last 6 Hours',
    'Last 12 Hours',
    'Last 1 Day',
    'Last 2 Days',
    'Last 7 Days',
    'Last 30 Days',
  ];
  Time time;

  AppTimeRangeSelectorController({
    required this.time,
  });

  RxString selectedTime = ''.obs;

  @override
  void onInit() {
    selectedTime.value = time.time;

    super.onInit();
  }

  Time getTime() {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    switch (selectedTime.value) {
      case 'Last 5 Minutes':
        return Time(time: 'Last 5 Minutes', start: now - 300, end: now);
      case 'Last 15 Minutes':
        return Time(time: 'Last 15 Minutes', start: now - 900, end: now);
      case 'Last 30 Minutes':
        return Time(time: 'Last 30 Minutes', start: now - 1800, end: now);
      case 'Last 1 Hour':
        return Time(time: 'Last 1 Hour', start: now - 3600, end: now);
      case 'Last 3 Hours':
        return Time(time: 'Last 3 Hours', start: now - 10800, end: now);
      case 'Last 6 Hours':
        return Time(time: 'Last 6 Hours', start: now - 21600, end: now);
      case 'Last 12 Hours':
        return Time(time: 'Last 12 Hours', start: now - 43200, end: now);
      case 'Last 1 Day':
        return Time(time: 'Last 1 Day', start: now - 86400, end: now);
      case 'Last 2 Days':
        return Time(time: 'Last 2 Days', start: now - 172800, end: now);
      case 'Last 7 Days':
        return Time(time: 'Last 7 Days', start: now - 604800, end: now);
      case 'Last 30 Days':
        return Time(time: 'Last 30 Days', start: now - 2592000, end: now);
      default:
        return Time(time: 'Last 15 Minutes', start: now - 900, end: now);
    }
  }
}

class AppTimeRangeSelectorWidget extends StatelessWidget {
  const AppTimeRangeSelectorWidget({
    Key? key,
    required this.time,
    required this.selectTime,
  }) : super(key: key);

  final Time time;
  final void Function(Time time) selectTime;

  @override
  Widget build(BuildContext context) {
    AppTimeRangeSelectorController controller = Get.put(
      AppTimeRangeSelectorController(
        time: time,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Time Range',
      subtitle: 'Select the time range for you data',
      icon: Icons.schedule,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Select Time Range',
      onActionPressed: () {
        selectTime(controller.getTime());
        finish(context);
      },
      child: Obx(
        () {
          return ListView(
            children: [
              ...List.generate(
                controller.times.length,
                (index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: Constants.spacingSmall,
                      bottom: Constants.spacingSmall,
                      left: Constants.spacingExtraSmall,
                      right: Constants.spacingExtraSmall,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          blurRadius: Constants.sizeBorderBlurRadius,
                          spreadRadius: Constants.sizeBorderSpreadRadius,
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Constants.sizeBorderRadius),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.selectedTime.value = controller.times[index];
                      },
                      child: Row(
                        children: [
                          Icon(
                            controller.times[index] ==
                                    controller.selectedTime.value
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            size: 24,
                            color: Constants.colorPrimary,
                          ),
                          const SizedBox(width: Constants.spacingSmall),
                          Expanded(
                            flex: 1,
                            child: Text(
                              controller.times[index],
                              style: noramlTextStyle(
                                context,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
