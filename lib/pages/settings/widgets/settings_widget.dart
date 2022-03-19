import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppVertialListSimpleWidget(
      title: 'Settings',
      items: [
        AppVertialListSimpleModel(
          onTap: () {
            Get.toNamed('/settings/providers');
          },
          children: [
            const Icon(
              CustomIcons.kubernetes,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: Text('Provider Configurations', style: noramlTextStyle()),
              flex: 1,
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
