import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/settings/sponsor/settings_sponsor_subscribe.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

/// The [SettingsSponsor] widget displays a list with all available sponsor
/// options. For iOS and Android we are using In-App Purchase for sponsoring.
class SettingsSponsor extends StatelessWidget {
  const SettingsSponsor({super.key});

  @override
  Widget build(BuildContext context) {
    SponsorRepository sponsorRepository = Provider.of<SponsorRepository>(
      context,
      listen: true,
    );

    /// On Android and iOS we are using In-App Purchases for sponsoring. If the
    /// In-App Purchases API isn't available or when the user is already a
    /// sponsor we just return an empty container.
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
            padding: const EdgeInsets.all(Constants.spacingMiddle),
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
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
    return AppVerticalListSimpleWidget(
      title: 'Sponsor',
      items:
          sponsorRepository.products
              .map(
                (e) => AppVerticalListSimpleModel(
                  onTap: () {
                    showModal(context, SettingsSponsorSubscribe(product: e));
                  },
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      flex: 1,
                      child: Text(
                        titles.containsKey(e.id) ? titles[e.id]! : e.title,
                        style: normalTextStyle(context),
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
                        color: Theme.of(context).colorScheme.primary,
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
                          color: Theme.of(context).colorScheme.onPrimary,
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
}
