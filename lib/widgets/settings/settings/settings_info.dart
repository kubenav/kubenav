import 'dart:io';

import 'package:flutter/material.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

const licenseText = '''MIT License

Copyright (c) 2024 Rico Berger

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.''';

/// The [SettingsInfo] displays some general information and links for the app.
/// These information contain the installed app version, the license text, and
/// the links to our website, GitHub and Twitter.
class SettingsInfo extends StatefulWidget {
  const SettingsInfo({super.key});

  @override
  State<SettingsInfo> createState() => _SettingsInfoState();
}

class _SettingsInfoState extends State<SettingsInfo> {
  String _version = '';

  /// [_getVersion] sets the [_version] variable via the [PackageInfo] package.
  /// The [_version] is then displayed within the information items. When we are
  /// not able to get the version of the app we log an error and leave the
  /// version unset.
  Future<void> _getVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _version = packageInfo.version;
      });
    } catch (err) {
      Logger.log(
        'SettingsInfo _getVersion',
        'Could not get package info',
        err,
      );
    }
  }

  /// [buildAdditionalLinks] returns additional links for iOS which must be
  /// present in the app so that the app is not rejected in the App Store
  /// submission.
  List<AppVertialListSimpleModel> buildAdditionalLinks() {
    if (Platform.isIOS) {
      SponsorRepository sponsorRepository = Provider.of<SponsorRepository>(
        context,
        listen: false,
      );

      return [
        AppVertialListSimpleModel(
          onTap: () {
            openUrl(
              'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
            );
          },
          children: [
            Icon(
              Icons.policy,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Terms of Use',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            sponsorRepository.restorePurchases();
            showSnackbar(
              context,
              'Restore Purchases',
              'Your previous purchases were restored',
            );
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
                'Restore Purchases',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
      ];
    }

    return [];
  }

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return AppVertialListSimpleWidget(
      title: 'Info',
      items: [
        AppVertialListSimpleModel(
          children: [
            Icon(
              Icons.code,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Version',
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
                _version,
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
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://kubenav.io');
          },
          children: [
            Icon(
              Icons.language,
              color: Theme.of(context).colorScheme.primary,
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
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://github.com/kubenav/kubenav');
          },
          children: [
            Icon(
              CustomIcons.github,
              color: Theme.of(context).colorScheme.primary,
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
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://twitter.com/kubenav');
          },
          children: [
            Icon(
              CustomIcons.twitter,
              color: Theme.of(context).colorScheme.primary,
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
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            showModal(
              context,
              AppBottomSheetWidget(
                title: 'License',
                subtitle: 'MIT License',
                icon: Icons.copyright,
                closePressed: () {
                  Navigator.pop(context);
                },
                actionText: 'Close',
                actionPressed: () {
                  Navigator.pop(context);
                },
                actionIsLoading: false,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: Constants.spacingMiddle,
                      bottom: Constants.spacingMiddle,
                      left: Constants.spacingMiddle,
                      right: Constants.spacingMiddle,
                    ),
                    child: Text(
                      licenseText,
                      style: TextStyle(
                        color: Theme.of(context)
                            .extension<CustomColors>()!
                            .textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          children: [
            Icon(
              Icons.copyright,
              color: Theme.of(context).colorScheme.primary,
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
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
        AppVertialListSimpleModel(
          onTap: () {
            openUrl('https://kubenav.io/privacy.html');
          },
          children: [
            Icon(
              Icons.policy,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Privacy Policy',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
        ...buildAdditionalLinks(),
      ],
    );
  }
}
