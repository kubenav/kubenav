import 'dart:io';

import 'package:flutter/material.dart';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsSponsorSubscribe] widget shows a modal bottom sheet for the
/// provided [product], where a user can buy / subscribe to this product to
/// support the development of the app. When the user clicks on the action
/// button of the modal bottom sheet the sponsoring process is initialized and
/// then completed via the platforms native screens.
class SettingsSponsorSubscribe extends StatefulWidget {
  const SettingsSponsorSubscribe({
    super.key,
    required this.product,
  });

  final ProductDetails product;

  @override
  State<SettingsSponsorSubscribe> createState() =>
      _SettingsSponsorSubscribeState();
}

class _SettingsSponsorSubscribeState extends State<SettingsSponsorSubscribe> {
  bool _isLoading = false;

  /// [_subscribe] initializes the subscription process by calling the
  /// `subscribe` function from our [SponsorRepository]. If we were able to
  /// start the process the modal is closed and a native screen should be shown.
  /// If we could not start the process we show the thrown exception in a
  /// snackbar.
  Future<void> _subscribe() async {
    SponsorRepository sponsorRepository = Provider.of<SponsorRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });

      await sponsorRepository.subscribe(widget.product);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      if (!context.mounted) return;
      showSnackbar(
        context,
        'An error occured',
        err.toString(),
      );
    }
  }

  Widget _buildIOSNotes() {
    if (Platform.isIOS) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.spacingSmall,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notes:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\u2022'),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Sponsor banner is removed as long as the subscription is active',
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('\u2022'),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Subscription will automatically renew for ${widget.product.price} ${periods.containsKey(widget.product.id) ? periods[widget.product.id] : ''} until automatically renew is turned off',
                  ),
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\u2022'),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Subscription will be charged to your Apple account at confirmation of purchase',
                  ),
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\u2022'),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Privacy Policy: https://kubenav.io/privacy.html',
                  ),
                ),
              ],
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\u2022'),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Terms of Use: https://www.apple.com/legal/internet-services/itunes/dev/stdeula/',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: titles.containsKey(widget.product.id)
          ? titles[widget.product.id]!
          : widget.product.title,
      subtitle:
          'Subscribe for ${widget.product.price} ${periods.containsKey(widget.product.id) ? periods[widget.product.id] : ''}',
      icon: Icons.favorite,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText:
          'Subscribe for ${widget.product.price} ${periods.containsKey(widget.product.id) ? periods[widget.product.id] : ''}',
      actionPressed: () {
        _subscribe();
      },
      actionIsLoading: _isLoading,
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'We believe in open source. This means that we will never put any features behind a paywall. You will always be able to use all features of kubenav for free.',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'With the monthly and yearly sponsoring you can remove the "Sponsor" banner in the settings screen and support the development of kubenav.',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'You can also support us by reporting bugs, submitting fixes, proposing new features or by becoming a maintainer. For more information you can have a look at the contributing guide in our GitHub repository. The repository is available at https://github.com/kubenav/kubenav.',
              ),
            ),
            _buildIOSNotes(),
          ],
        ),
      ),
    );
  }
}
