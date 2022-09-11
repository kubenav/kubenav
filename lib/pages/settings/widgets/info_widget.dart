import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:kubenav/pages/settings/widgets/license_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class InfoController extends GetxController {
  RxString version = '-'.obs;

  @override
  void onInit() {
    getVersion();
    super.onInit();
  }

  void getVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      version.value = packageInfo.version;
    } catch (err) {
      Logger.log(
        'InfoController getVersion',
        'Could not get package info',
        err,
      );
    }
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoController controller = Get.put(InfoController());

    return AppVertialListSimpleWidget(
      title: 'Info',
      items: [
        AppVertialListSimpleModel(
          children: [
            const Icon(
              CustomIcons.version,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text('Version',
                  style: noramlTextStyle(
                    context,
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 2,
                top: 2,
                left: 6,
                right: 6,
              ),
              decoration: const BoxDecoration(
                color: Constants.colorPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(Constants.sizeBorderRadius),
                ),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Obx(
                () {
                  return Text(
                    controller.version.value,
                    style: secondaryTextStyle(
                      context,
                      size: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            Get.bottomSheet(
              BottomSheet(
                onClosing: () {},
                enableDrag: false,
                builder: (builder) {
                  return const LicenseWidget();
                },
              ),
              isScrollControlled: true,
            );
          },
          children: [
            const Icon(
              CustomIcons.license,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'License',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://kubenav.io');
          },
          children: [
            const Icon(
              CustomIcons.browser,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Website',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://github.com/kubenav/kubenav');
          },
          children: [
            // const Icon(Icons.tab, size: 24, color: Colors.blue),
            const Icon(
              CustomIcons.github,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'GitHub',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://twitter.com/kubenav');
          },
          children: [
            const Icon(
              CustomIcons.twitter,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Twitter',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}
