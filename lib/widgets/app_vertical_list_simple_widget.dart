import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

/// [AppVertialListSimpleModel] represents a single item in the [AppVertialListSimpleWidget] widget. Each item mist
/// contain a list of [children] and an optional [onTap] function which is called when the user clicks on the item in
/// the list.
class AppVertialListSimpleModel {
  List<Widget> children;
  void Function()? onTap;

  AppVertialListSimpleModel({
    required this.children,
    this.onTap,
  });
}

/// [AppVertialListSimpleWidget] is a widget to render a simple vertical list. The list items are defined via the
/// [AppVertialListSimpleModel]. The widget can be used as follows:
///
/// ```
/// AppVertialListSimpleWidget(
///   title: 'Info',
///   items: [
///     AppVertialListSimpleModel(
///       children: [
///         const Icon(
///           CustomIcons.version,
///           color: Constants.colorPrimary,
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
///             color: Constants.colorPrimary,
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
///                   color: Colors.white,
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
class AppVertialListSimpleWidget extends StatelessWidget {
  const AppVertialListSimpleWidget({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List<AppVertialListSimpleModel> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: primaryTextStyle(size: 18),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: Column(
            children: List.generate(
              items.length,
              (index) => Container(
                margin: const EdgeInsets.only(
                  bottom: Constants.spacingMiddle,
                ),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Constants.shadowColorGlobal,
                      blurRadius: Constants.sizeBorderBlurRadius,
                      spreadRadius: Constants.sizeBorderSpreadRadius,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.sizeBorderRadius),
                  ),
                ),
                child: InkWell(
                  onTap: items[index].onTap,
                  child: Row(
                    children: items[index].children,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
