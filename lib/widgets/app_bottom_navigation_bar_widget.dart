import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/routes/app_routes.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';

/// [AppBottomNavigationBarWidget] is the global bottom navigation bar for our app. It provides easy access to the most
/// important pages of the app.
class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({Key? key}) : super(key: key);

  /// [getCurrentIndex] is used to get the index of the current route. The function is used to highlight the selected
  /// page in the bottom navigation bar. To work with nested pages the must be start with the same prefix as the main
  /// page, which is accessed via the bottom navigation bar (e.g. to highlight the settings page with the route
  /// `/settings/`, the clusters page which is accessed via the settings must also contain the `/settings/` prefix,
  /// `/settings/clusters`).
  getCurrentIndex(String currentRoute) {
    if (currentRoute.startsWith(Routes.home)) {
      return 0;
    } else if (currentRoute.startsWith(Routes.resources)) {
      return 1;
    } else if (currentRoute.startsWith(Routes.plugins)) {
      return 2;
    } else if (currentRoute.startsWith(Routes.settings)) {
      return 3;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.colorPrimary,
      selectedItemColor: Theme.of(context).appBarTheme.foregroundColor,
      unselectedItemColor:
          Theme.of(context).appBarTheme.foregroundColor?.withOpacity(0.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: getCurrentIndex(Get.currentRoute),
      onTap: (value) {
        switch (value) {
          case 0:
            Get.back();
            Get.offAllNamed(Routes.home);
            break;
          case 1:
            Get.back();
            Get.offAllNamed(Routes.resources);
            break;
          case 2:
            Get.back();
            Get.offAllNamed(Routes.plugins);
            break;
          case 3:
            Get.back();
            Get.offAllNamed(Routes.settings);
            break;
          default:
            Get.back();
            Get.offAllNamed(Routes.home);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Resources',
          icon: Icon(CustomIcons.kubernetes),
        ),
        BottomNavigationBarItem(
          label: 'Plugins',
          icon: Icon(Icons.extension),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
