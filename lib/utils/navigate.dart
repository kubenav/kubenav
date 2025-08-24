import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';

/// [navigate] navigates to the provided [widget]. If a [index] is provided, it
/// will remove all previous screens from the stack and sets the current page
/// index to the provided one.
void navigate(BuildContext context, Widget widget, [int? index]) {
  if (index != null) {
    Provider.of<AppRepository>(
      context,
      listen: false,
    ).setCurrentPageIndex(index);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => widget),
      (route) => false,
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => widget),
    );
  }
}
