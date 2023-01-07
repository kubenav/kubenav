import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

/// The [SettingsSponsor] widget displays a list with all available sponsor
/// options. Currently these are GitHub Sponsors and Paypal.
///
/// On iOS the [SettingsSponsor] widget returns an empty container, because
/// Apple doesn't like it when we do not use the In-App Purchase API.
///
/// See https://github.com/kubenav/kubenav/commit/6b4932a313a55366fa5b4674800a3cf40df23647
class SettingsSponsor extends StatelessWidget {
  const SettingsSponsor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );

    if (Platform.isIOS) {
      return Container();
    }

    return AppVertialListSimpleWidget(
      title: 'Sponsor',
      items: [
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://github.com/sponsors/ricoberger');
          },
          children: [
            Icon(
              CustomIcons.github,
              color: theme(context).colorPrimary,
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
            openUrl('https://www.paypal.com/paypalme/ricoberger');
          },
          children: [
            Icon(
              CustomIcons.paypal,
              color: theme(context).colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'PayPal',
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
