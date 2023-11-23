import 'package:flutter/material.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';

/// The [AppListItem] widget can be used to render an item in a list.
///
/// ```
/// ListView.separated(
///   physics: const NeverScrollableScrollPhysics(),
///   shrinkWrap: true,
///   separatorBuilder: (context, index) => const SizedBox(
///     height: Constants.spacingMiddle,
///   ),
///   itemCount: items.length,
///   itemBuilder: (context, index) => AppListItem(
///     onTap: items[index].onTap,
///     child: Row(
///       children: items[index].children,
///     ),
///   ),
/// ),
/// ```
class AppListItem extends StatelessWidget {
  const AppListItem({
    super.key,
    this.onTap,
    this.onDoubleTap,
    required this.child,
  });

  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Container(
        padding: const EdgeInsets.all(Constants.spacingListItemContent),
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
        child: child,
      ),
    );
  }
}
