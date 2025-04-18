import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/widgets/home/home_clusters.dart';
import 'package:kubenav/widgets/home/home_overview.dart';
import 'package:kubenav/widgets/reset/reset.dart';

/// The [Home] is the first widget which is displayed when a user opens the app.
/// We use it to initialize the [AppRepository] and [ClustersRepository] and to
/// handle the authentication ot the user (when enabled). If the repositories
/// were initialized we remove the splash screen and show the [Overview] page.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String shortcut = '';

  @override
  void initState() {
    super.initState();

    /// Add a "reset" quick action, so that a user can reset all the saved
    /// providers, clusters and settings. This is required, because sometimes
    /// the app crashes for a invalid cluster configuration and I wasn't able
    /// until now, why this happens. So having a workaround that effect users
    /// can start using the app again might be a good idea.
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      setState(() {
        shortcut = shortcutType;
      });
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'reset',
        localizedTitle: 'Reset',
        localizedSubtitle: 'Reset Data',
      ),
    ]);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ThemeRepository themeRepository = Provider.of<ThemeRepository>(
        context,
        listen: false,
      );
      AppRepository appRepository = Provider.of<AppRepository>(
        context,
        listen: false,
      );
      ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
        context,
        listen: false,
      );
      BookmarksRepository bookmarksRepository =
          Provider.of<BookmarksRepository>(context, listen: false);

      if (!appRepository.isAuthenticated) {
        themeRepository.init().then((value) {
          appRepository.init().then((value) {
            clustersRepository.init().then((value) {
              bookmarksRepository.init().then((value) {
                FlutterNativeSplash.remove();
              });
            });
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// When a user selected the show clusters on start option in the settings
    /// we will show the [HomeClusters] widget instead of the normal
    /// [HomeOverview] widget on the home screen, to allow the user to select an
    /// active cluster before he continues.
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    if (!appRepository.isAuthenticated) {
      return Container();
    }

    if (shortcut == 'reset') {
      return const Reset();
    }

    if (appRepository.showClusters && clustersRepository.clusters.isNotEmpty) {
      return const HomeClusters();
    }

    return const HomeOverview();
  }
}
