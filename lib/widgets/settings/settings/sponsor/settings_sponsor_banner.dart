import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/settings/sponsor/settings_sponsor_actions.dart';

class SettingsSponsorBanner extends StatelessWidget {
  const SettingsSponsorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );
    SponsorRepository sponsorRepository = Provider.of<SponsorRepository>(
      context,
      listen: true,
    );

    if (sponsorRepository.isAvailable &&
        sponsorRepository.products.isNotEmpty &&
        !sponsorRepository.isSponsor &&
        DateTime.now().millisecondsSinceEpoch >
            appRepository.settings.sponsorReminder) {
      return Container(
        margin: const EdgeInsets.all(
          Constants.spacingMiddle,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).extension<CustomColors>()!.shadow,
              blurRadius: Constants.sizeBorderBlurRadius,
              spreadRadius: Constants.sizeBorderSpreadRadius,
              offset: const Offset(0.0, 0.0),
            ),
          ],
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        child: InkWell(
          onTap: () {
            showActions(
              context,
              const SettingsSponsorActions(
                showDismiss: true,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Constants.sizeBorderRadius),
                    topRight: Radius.circular(Constants.sizeBorderRadius),
                  ),
                ),
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 108,
                ),
              ),
              const SizedBox(height: Constants.spacingSmall),
              Padding(
                padding: const EdgeInsets.only(
                  left: Constants.spacingSmall,
                ),
                child: Text(
                  'Sponsor',
                  style: primaryTextStyle(
                    context,
                  ),
                ),
              ),
              const SizedBox(height: Constants.spacingExtraSmall),
              Padding(
                padding: const EdgeInsets.only(
                  left: Constants.spacingSmall,
                ),
                child: Text(
                  'Support the development of kubenav by becoming a sponsor.',
                  style: secondaryTextStyle(
                    context,
                  ),
                ),
              ),
              const SizedBox(height: Constants.spacingSmall),
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
