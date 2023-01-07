import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/widgets/home/home.dart';
import 'package:kubenav/widgets/plugins/plugins.dart';
import 'package:kubenav/widgets/resources/resources.dart';
import 'package:kubenav/widgets/settings/settings.dart';

/// [AppBottomNavigationBarWidget] is the global bottom navigation bar for our
/// app. It provides easy access to the most important pages of the app and
/// should be used on every page as follows:
///
/// ```
/// Scaffold(
///   appBar: AppBar(
///     centerTitle: true,
///     title: const Text('Settings'),
///   ),
///   bottomNavigationBar: const AppBottomNavigationBarWidget(),
///   floatingActionButton: const AppFloatingActionButtonsWidget(),
///   body: Container(),
/// );
/// ```
class AppBottomNavigationBarWidget extends StatelessWidget {
  const AppBottomNavigationBarWidget({Key? key}) : super(key: key);

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
      backgroundColor: theme(context).colorPrimary,
      selectedItemColor: Theme.of(context).appBarTheme.foregroundColor,
      unselectedItemColor:
          Theme.of(context).appBarTheme.foregroundColor?.withOpacity(0.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: appRepository.currentPageIndex,
      onTap: (value) {
        switch (value) {
          case 0:
            navigate(context, const Home(), Constants.pageIndexHome);
            break;
          case 1:
            navigate(context, const Resources(), Constants.pageIndexResources);
            break;
          case 2:
            navigate(context, const Plugins(), Constants.pageIndexPlugins);
            break;
          case 3:
            navigate(context, const Settings(), Constants.pageIndexSettings);
            break;
          default:
            navigate(context, const Home(), Constants.pageIndexHome);
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
