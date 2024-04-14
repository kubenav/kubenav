import 'package:flutter/material.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';

void showModal(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Constants.spacingMiddle),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

void showActions(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    useSafeArea: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return widget;
      return Container(
        margin: const EdgeInsets.all(Constants.spacingMiddle),
        child: widget,
      );
    },
  );
}

void showSnackbar(BuildContext context, String title, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      backgroundColor: theme(context).message,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Constants.sizeBorderRadius,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme(context).onMessage,
            ),
          ),
          Text(
            message,
            style: TextStyle(
              color: theme(context).onMessage,
            ),
          ),
        ],
      ),
    ),
  );
}
