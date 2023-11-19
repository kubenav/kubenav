import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/settings/sponsor/settings_sponsor_actions.dart';

class SettingsSponsorBanner extends StatelessWidget {
  const SettingsSponsorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );
    SponsorRepository sponsorRepository = Provider.of<SponsorRepository>(
      context,
      listen: true,
    );

    if ((Platform.isAndroid || Platform.isIOS) &&
        sponsorRepository.isAvailable &&
        sponsorRepository.products.isNotEmpty &&
        !sponsorRepository.isSponsor &&
        DateTime.now().millisecondsSinceEpoch >
            appRepository.settings.sponsorReminder) {
      return Container(
        padding: const EdgeInsets.only(
          left: Constants.spacingMiddle,
          right: Constants.spacingMiddle,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            top: Constants.spacingSmall,
            bottom: Constants.spacingSmall,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: theme(context).colorShadow,
                blurRadius: Constants.sizeBorderBlurRadius,
                spreadRadius: Constants.sizeBorderSpreadRadius,
                offset: const Offset(0.0, 0.0),
              ),
            ],
            color: theme(context).colorCard,
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
                    color: theme(context).colorPrimary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Constants.sizeBorderRadius),
                      topRight: Radius.circular(Constants.sizeBorderRadius),
                    ),
                  ),
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
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
        ),
      );
    }

    return Container();
  }
}
