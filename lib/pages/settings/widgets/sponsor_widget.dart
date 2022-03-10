import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_browser_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class SponsorWidget extends StatelessWidget {
  const SponsorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppVertialListSimpleWidget(
      title: 'Sponsor',
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
                  return AppBrowserWidget(
                    initialUrl: 'https://github.com/sponsors/ricoberger',
                    onClosePressed: () {
                      finish(context);
                    },
                  );
                },
              ),
              isScrollControlled: true,
            );
          },
          children: [
            const Icon(
              CustomIcons.github,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: Text(
                'GitHub',
                style: noramlTextStyle(),
              ),
              flex: 1,
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
            Get.bottomSheet(
              BottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.sizeBorderRadius),
                ),
                onClosing: () {},
                enableDrag: false,
                builder: (builder) {
                  return AppBrowserWidget(
                    initialUrl: 'https://www.paypal.com/paypalme/ricoberger',
                    onClosePressed: () {
                      finish(context);
                    },
                  );
                },
              ),
              isScrollControlled: true,
            );
          },
          children: [
            const Icon(
              CustomIcons.paypal,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: Text('PayPal', style: noramlTextStyle()),
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
