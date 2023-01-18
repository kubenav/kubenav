import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/settings/sponsor/settings_sponsor_subscribe.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

/// The [SettingsSponsor] widget displays a list with all available sponsor
/// options. For iOS and Android we are using In-App Purchase for sponsoring. On
/// desktop we are just displaying a ling to GitHub Sponsors and Paypal.
class SettingsSponsor extends StatelessWidget {
  const SettingsSponsor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SponsorRepository sponsorRepository = Provider.of<SponsorRepository>(
      context,
      listen: true,
    );
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );

    /// On Android and iOS we are using In-App Purchases for sponsoring. If the
    /// In-App Purchases API isn't available or when the user is already a
    /// sponsor we just return an empty container.
    if (Platform.isAndroid || Platform.isIOS) {
      if (!sponsorRepository.isAvailable ||
          sponsorRepository.products.isEmpty ||
          sponsorRepository.isSponsor) {
        return Container();
      }

      /// If a user clicked on the subscribe button in the
      /// [SettingsSponsorSubscribe] widget to initialize the subscription
      /// process we display a circular spinner while we didn't receive a
      /// successful / canceled purchase.
      if (sponsorRepository.status == SponsorRepositoryStatus.pending) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(Constants.spacingMiddle),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Sponsor',
                      style: primaryTextStyle(context, size: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
                bottom: Constants.spacingMiddle,
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: theme(context).colorPrimary,
                ),
              ),
            ),
          ],
        );
      }

      /// When a user isn't a sponsor we display all products we received from
      /// the corresponding platform API. If the user clicks on one of these
      /// products we open a [SettingsSponsorSubscribe] widget with this product
      /// were a user can buy it.
      return AppVertialListSimpleWidget(
        title: 'Sponsor',
        items: sponsorRepository.products
            .map(
              (e) => AppVertialListSimpleModel(
                onTap: () {
                  showModal(
                    context,
                    SettingsSponsorSubscribe(
                      product: e,
                    ),
                  );
                },
                children: [
                  Icon(
                    Icons.favorite,
                    color: theme(context).colorPrimary,
                  ),
                  const SizedBox(width: Constants.spacingSmall),
                  Expanded(
                    flex: 1,
                    child: Text(
                      e.title,
                      style: noramlTextStyle(
                        context,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 2,
                      top: 2,
                      left: 6,
                      right: 6,
                    ),
                    decoration: BoxDecoration(
                      color: theme(context).colorPrimary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Constants.sizeBorderRadius),
                      ),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      e.price,
                      style: secondaryTextStyle(
                        context,
                        size: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      );
    }

    /// On desktop we display a link to the GitHub Sponsors page and to Paypal
    /// we are user has the chance to support the development.
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
              color: theme(context)
                  .colorTextPrimary
                  .withOpacity(Constants.opacityIcon),
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
              color: theme(context)
                  .colorTextPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}
