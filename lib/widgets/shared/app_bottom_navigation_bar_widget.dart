import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/widgets/home/home.dart';
import 'package:kubenav/widgets/plugins/plugins.dart';
import 'package:kubenav/widgets/resources/resources.dart';
import 'package:kubenav/widgets/settings/settings.dart';

/// [AppBottomNavigationBarWidget] is the global bottom navigation bar for our
/// app. It provides easy access to the most important pages of the app and
/// should be used on every page.
class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    /// Normally we should always use `listen: true` when a repository is used in
    /// the build function. In this case it is not necessary, because we we send
    /// the user to another page via the `navigate` function, which rebuilds the
    /// widget anyway.
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.primary,
      selectedItemColor: Theme.of(context).colorScheme.onPrimary,
      unselectedItemColor: Theme.of(
        context,
      ).colorScheme.onPrimary.withValues(alpha: 0.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: appRepository.currentPageIndex,
      onTap: (value) {
        switch (value) {
          case 0:
            if (Navigator.of(context).canPop() == true ||
                appRepository.currentPageIndex != Constants.pageIndexHome) {
              navigate(context, const Home(), Constants.pageIndexHome);
            }
            break;
          case 1:
            if (Navigator.of(context).canPop() == true ||
                appRepository.currentPageIndex !=
                    Constants.pageIndexResources) {
              navigate(
                context,
                const Resources(),
                Constants.pageIndexResources,
              );
            }
            break;
          case 2:
            if (Navigator.of(context).canPop() == true ||
                appRepository.currentPageIndex != Constants.pageIndexPlugins) {
              navigate(context, const Plugins(), Constants.pageIndexPlugins);
            }
            break;
          case 3:
            if (Navigator.of(context).canPop() == true ||
                appRepository.currentPageIndex != Constants.pageIndexSettings) {
              navigate(context, const Settings(), Constants.pageIndexSettings);
            }
            break;
          default:
            if (Navigator.of(context).canPop() == true ||
                appRepository.currentPageIndex != Constants.pageIndexHome) {
              navigate(context, const Home(), Constants.pageIndexHome);
            }
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(
          label: 'Resources',
          icon: Icon(CustomIcons.kubernetes),
        ),
        BottomNavigationBarItem(label: 'Plugins', icon: Icon(Icons.extension)),
        BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
      ],
    );
  }
}
