import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

class AppVertialListSimpleModel {
  List<Widget> children;
  void Function()? onTap;

  AppVertialListSimpleModel({
    required this.children,
    this.onTap,
  });
}

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
