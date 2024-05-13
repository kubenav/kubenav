import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/themes.dart';

/// The [AppListItem] widget can be used to render an item in a list.
class AppListItem extends StatelessWidget {
  const AppListItem({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.child,
  });

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(Constants.spacingListItemContent),
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
        child: child,
      ),
    );
  }
}
