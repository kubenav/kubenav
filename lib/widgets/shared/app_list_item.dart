import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/themes.dart';

class AppListItemSlidableAction {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function(BuildContext context)? onTap;

  const AppListItemSlidableAction({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
  });
}

/// The [AppListItem] widget can be used to render an item in a list.
class AppListItem extends StatelessWidget {
  const AppListItem({
    super.key,
    this.onTap,
    this.onLongPress,
    this.slidableActions,
    required this.child,
  });

  final void Function()? onTap;
  final void Function()? onLongPress;
  final List<AppListItemSlidableAction>? slidableActions;
  final Widget child;

  Widget _buildItem(BuildContext context) {
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
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (slidableActions != null) {
      return Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned.fill(
            child: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.sizeBorderRadius,
                ),
                child: Container(color: slidableActions![0].backgroundColor),
              ),
            ),
          ),
          Slidable(
            key: UniqueKey(),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.3 * slidableActions!.length,
              children: List.generate(slidableActions!.length, (int index) {
                return SlidableAction(
                  onPressed: slidableActions![index].onTap,
                  backgroundColor: slidableActions![index].backgroundColor,
                  foregroundColor: slidableActions![index].foregroundColor,
                  icon: slidableActions![index].icon,
                  label: slidableActions![index].label,
                  borderRadius: slidableActions!.length - 1 == index
                      ? const BorderRadius.only(
                          topRight: Radius.circular(Constants.sizeBorderRadius),
                          bottomRight: Radius.circular(
                            Constants.sizeBorderRadius,
                          ),
                        )
                      : BorderRadius.zero,
                );
              }),
            ),
            child: _buildItem(context),
          ),
        ],
      );
    }

    return _buildItem(context);
  }
}
