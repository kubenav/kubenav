import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showModal(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

void showActions(BuildContext context, Widget widget) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    isDismissible: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        margin: const EdgeInsets.all(Constants.spacingMiddle),
        child: widget,
      );
    },
  );
}

void showSnackbar(String title, String message) {
  snackbarKey.currentState?.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text(message),
        ],
      ),
    ),
  );
}
