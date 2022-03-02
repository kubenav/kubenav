import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/helpers.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppVertialListSimpleWidget(
      title: 'Help',
      items: [
        AppVertialListSimpleModel(
          onTap: () {
            Get.bottomSheet(
              BottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.sizeBorderRadius),
                ),
                onClosing: () {},
                enableDrag: false,
                builder: (builder) {
                  return Logger();
                },
              ),
              isScrollControlled: true,
            );
          },
          children: [
            const Icon(
              Icons.subject,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: Text('Logs', style: noramlTextStyle()),
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
