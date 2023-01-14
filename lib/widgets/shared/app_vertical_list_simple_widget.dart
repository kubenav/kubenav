import 'package:flutter/material.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// [AppVertialListSimpleModel] represents a single item in the
/// [AppVertialListSimpleWidget] widget. Each item mist contain a list of
/// [children] and an optional [onTap] function which is called when the user
/// clicks on the item in the list.
class AppVertialListSimpleModel {
  List<Widget> children;
  void Function()? onTap;

  AppVertialListSimpleModel({
    required this.children,
    this.onTap,
  });
}

/// [AppVertialListSimpleWidget] is a widget to render a simple vertical list.
/// The list items are defined via the [AppVertialListSimpleModel]. The widget
/// can be used as follows:
///
/// ```
/// AppVertialListSimpleWidget(
///   title: 'Info',
///   items: [
///     AppVertialListSimpleModel(
///       children: [
///         const Icon(
///           CustomIcons.version,
///           color: theme(context).colorPrimary,
///         ),
///         const SizedBox(width: Constants.spacingSmall),
///         Expanded(
///           child: Text('Version', style: noramlTextStyle()),
///           flex: 1,
///         ),
///         Container(
///           padding: const EdgeInsets.only(
///             bottom: 2,
///             top: 2,
///             left: 6,
///             right: 6,
///           ),
///           decoration: const BoxDecoration(
///             color: theme(context).colorPrimary,
///             borderRadius: BorderRadius.all(
///               Radius.circular(Constants.sizeBorderRadius),
///             ),
///           ),
///           constraints: const BoxConstraints(
///             minWidth: 16,
///             minHeight: 16,
///           ),
///           child: Obx(
///             () {
///               return Text(
///                 controller.version.value,
///                 style: secondaryTextStyle(
///                   size: 14,
///                 ),
///                 textAlign: TextAlign.center,
///               );
///             },
///           ),
///         ),
///       ],
///     ),
///   ],
/// )
/// ```
///
/// The [smallPadding] argument can be used to minimize the additional padding for the widget, so that it can be used in
/// other places, like a bottom sheet.
class AppVertialListSimpleWidget extends StatelessWidget {
  const AppVertialListSimpleWidget({
    Key? key,
    required this.title,
    required this.items,
    this.smallPadding = false,
  }) : super(key: key);

  final String title;
  final List<AppVertialListSimpleModel> items;
  final bool smallPadding;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Constants.spacingMiddle,
            left: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
            right: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
            right: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: Constants.spacingMiddle,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) => AppListItem(
              onTap: items[index].onTap,
              child: Row(
                children: items[index].children,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
