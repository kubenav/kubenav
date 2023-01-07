import 'package:flutter/material.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/widgets/home/home_overview.dart';

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
  @override
  void initState() {
    super.initState();
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
          Provider.of<BookmarksRepository>(
        context,
        listen: false,
      );

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
    return const HomeOverview();
  }
}
