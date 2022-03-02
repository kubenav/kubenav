import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

/// [AppBottomSheetWidget] is a widget which can be used within a bottom sheet to show a bottom sheet with a height of
/// 75% of the display height, for more complex user inteactions. The widget required a [title], [subtitle] and [icon]
/// which are used in the header. The [onClosePressed] function is executed when the user clicks the close icon in the
/// header of the bottom sheet. The action properties are used within a button which is displayed in the footer of the
/// bottom sheet. The body of the bottom sheet is defined via the child property.
class AppBottomSheetWidget extends StatelessWidget {
  const AppBottomSheetWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onClosePressed,
    required this.actionText,
    required this.onActionPressed,
    required this.child,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final dynamic icon;
  final void Function() onClosePressed;
  final String actionText;
  final void Function() onActionPressed;
  final Widget child;

  /// [buildIcon] creates the icon container for the bottom sheet header. The [icon] parameter for the widget could be
  /// of type `String` or `IconData` to also allow images from the assets folder as icons.
  Widget buildIcon(dynamic icon) {
    if (icon is String) {
      return Container(
        margin: const EdgeInsets.only(
          right: Constants.spacingMiddle,
        ),
        height: 54,
        width: 54,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            Constants.sizeBorderRadius,
          ),
          child: Image.asset(
            icon,
            fit: BoxFit.fill,
          ),
        ),
      );
    } else if (icon is IconData) {
      return Container(
        margin: const EdgeInsets.only(
          right: Constants.spacingMiddle,
        ),
        decoration: const BoxDecoration(
          color: Constants.colorPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        height: 54,
        width: 54,
        child: Icon(
          icon,
          color: Colors.white,
          size: 36,
        ),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(
          left: Constants.spacingMiddle,
          right: Constants.spacingMiddle,
          bottom: Constants.spacingLarge,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: Constants.spacingMiddle,
                bottom: Constants.spacingMiddle,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        buildIcon(icon),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle(
                                  size: 18,
                                ),
                              ),
                              Text(
                                Characters(subtitle)
                                    .replaceAll(
                                        Characters(''), Characters('\u{200B}'))
                                    .toString(),
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close_outlined,
                    ),
                    onPressed: onClosePressed,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
              thickness: 1.0,
            ),
            const SizedBox(height: Constants.spacingMiddle),
            Flexible(
              child: child,
            ),
            const SizedBox(height: Constants.spacingMiddle),
            const Divider(
              height: 0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.spacingMiddle,
                bottom: Constants.spacingMiddle,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Constants.colorPrimary,
                  onPrimary: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: onActionPressed,
                child: Text(
                  actionText,
                  style: primaryTextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
